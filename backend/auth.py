"""
Authentication routes for CyberHunt.

Flow implemented here:

    Register -> checked against verified_students roster -> users row created
       -> Login -> credentials verified -> JWT issued
       -> JWT sent on every request -> backend identifies the participant

Endpoints:
    POST /api/auth/check-eligibility  - is this email allowed to register?
    POST /api/auth/register           - create an account (verified students only)
    POST /api/auth/login              - verify credentials, return a JWT
    GET  /api/auth/me                 - current user details (requires token)
    GET  /api/auth/status             - am I logged in? (never 401s)
    POST /api/auth/logout             - record logout (client discards token)
    POST /api/auth/change-password    - change password (requires token)
"""

from datetime import datetime

from flask import Blueprint, g, jsonify, request
from sqlalchemy import func

from database.models import db, User
from database.auth_models import VerifiedStudent
from backend.security import (
    create_access_token,
    hash_password,
    log_activity,
    token_required,
    validate_password_strength,
    verify_password,
    _extract_token,
    decode_access_token,
)

auth_bp = Blueprint("auth", __name__, url_prefix="/api/auth")


# ---------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------
def _find_verified_student(email=None, roll_number=None):
    """Look up the roster entry. Email match is case-insensitive."""
    query = VerifiedStudent.query
    if email:
        return query.filter(
            func.lower(VerifiedStudent.email) == email.strip().lower()
        ).first()
    if roll_number:
        return query.filter(
            VerifiedStudent.roll_number == roll_number.strip()
        ).first()
    return None


def _json_body():
    data = request.get_json(silent=True)
    return data if isinstance(data, dict) else {}


# ---------------------------------------------------------------------
# 1. Eligibility pre-check (optional, nice for the frontend)
# ---------------------------------------------------------------------
@auth_bp.route("/check-eligibility", methods=["POST"])
def check_eligibility():
    """Tell the frontend whether an email can register, before showing the form.

    Lets the UI say "you're not on the verified list" immediately instead of
    after the user fills in everything.
    """
    data = _json_body()
    email = (data.get("email") or "").strip()
    if not email:
        return jsonify({"error": "Email is required."}), 400

    student = _find_verified_student(email=email)
    if not student:
        return jsonify({
            "eligible": False,
            "reason": "not_verified",
            "message": "This email is not on the verified participant list.",
        }), 200

    if not student.form_filled:
        return jsonify({
            "eligible": False,
            "reason": "form_not_filled",
            "message": "Your registration form has not been submitted yet.",
        }), 200

    if student.has_registered:
        return jsonify({
            "eligible": False,
            "reason": "already_registered",
            "message": "An account already exists for this email. Please log in.",
        }), 200

    return jsonify({
        "eligible": True,
        "message": "You are verified and can create an account.",
        "full_name": student.full_name,
        "roll_number": student.roll_number,
    }), 200


# ---------------------------------------------------------------------
# 2. Registration
# ---------------------------------------------------------------------
@auth_bp.route("/register", methods=["POST"])
def register():
    """Create an account - but only for a verified student who hasn't already.

    Gate order matters: we check the roster BEFORE creating anything, so an
    unverified person never ends up with a half-made account.
    """
    data = _json_body()
    email = (data.get("email") or "").strip()
    username = (data.get("username") or "").strip()
    password = data.get("password") or ""
    roll_number = (data.get("roll_number") or "").strip()
    team_name = (data.get("team_name") or "").strip() or None

    # --- basic input validation -------------------------------------
    missing = [f for f in ("email", "username", "password") if not data.get(f)]
    if missing:
        return jsonify({"error": f"Missing required fields: {', '.join(missing)}"}), 400

    if len(username) < 3 or len(username) > 50:
        return jsonify({"error": "Username must be between 3 and 50 characters."}), 400

    pw_error = validate_password_strength(password)
    if pw_error:
        return jsonify({"error": pw_error}), 400

    # --- gate 1: are they on the verified roster? -------------------
    student = _find_verified_student(email=email)
    if not student and roll_number:
        student = _find_verified_student(roll_number=roll_number)

    if not student:
        return jsonify({
            "error": "You are not on the verified participant list. "
                     "Please contact the organisers.",
            "reason": "not_verified",
        }), 403

    # --- gate 2: did they actually fill the form? -------------------
    if not student.form_filled:
        return jsonify({
            "error": "Your registration form has not been submitted yet.",
            "reason": "form_not_filled",
        }), 403

    # --- gate 3: have they already made an account? -----------------
    if student.has_registered:
        return jsonify({
            "error": "An account already exists for this student. Please log in.",
            "reason": "already_registered",
        }), 409

    # --- gate 4: roll number must match the roster entry ------------
    if roll_number and student.roll_number != roll_number:
        return jsonify({
            "error": "The roll number does not match our records for this email.",
            "reason": "roll_mismatch",
        }), 403

    # --- gate 5: username/email not already taken in users -----------
    if User.query.filter(func.lower(User.email) == email.lower()).first():
        return jsonify({"error": "An account with this email already exists."}), 409
    if User.query.filter(func.lower(User.username) == username.lower()).first():
        return jsonify({"error": "That username is taken."}), 409

    # --- create the account -----------------------------------------
    user = User(
        username=username,
        email=email.lower(),
        password_hash=hash_password(password),
        full_name=student.full_name,
        team_name=team_name,
        role="participant",
        is_active=True,
        is_verified=True,
    )
    db.session.add(user)

    try:
        db.session.flush()          # assigns user.id without committing yet
        student.has_registered = True
        student.user_id = user.id   # link roster entry -> account
        db.session.commit()
    except Exception:
        db.session.rollback()
        return jsonify({"error": "Could not create the account. Please try again."}), 500

    log_activity(user.id, "REGISTER", {"email": user.email, "roll_number": student.roll_number})

    token = create_access_token(user)
    return jsonify({
        "message": "Registration successful.",
        "access_token": token,
        "token_type": "Bearer",
        "user": user.to_dict(),
    }), 201


# ---------------------------------------------------------------------
# 3. Login
# ---------------------------------------------------------------------
@auth_bp.route("/login", methods=["POST"])
def login():
    """Verify credentials and hand back a JWT.

    Accepts either an email or a username in the `identifier` field.
    """
    data = _json_body()
    identifier = (data.get("identifier") or data.get("email") or data.get("username") or "").strip()
    password = data.get("password") or ""

    if not identifier or not password:
        return jsonify({"error": "Email/username and password are required."}), 400

    user = User.query.filter(
        (func.lower(User.email) == identifier.lower())
        | (func.lower(User.username) == identifier.lower())
    ).first()

    # Same message for "no such user" and "wrong password" on purpose - it
    # stops an attacker from discovering which emails are registered.
    if not user or not verify_password(password, user.password_hash):
        log_activity(user.id if user else None, "LOGIN_FAILED", {"identifier": identifier})
        return jsonify({"error": "Invalid credentials."}), 401

    if not user.is_active:
        return jsonify({"error": "This account has been deactivated."}), 403

    user.last_login_at = datetime.utcnow()
    db.session.commit()

    log_activity(user.id, "LOGIN", {"username": user.username})

    token = create_access_token(user)
    return jsonify({
        "message": "Login successful.",
        "access_token": token,
        "token_type": "Bearer",
        "user": user.to_dict(),
    }), 200


# ---------------------------------------------------------------------
# 4. Current user details
# ---------------------------------------------------------------------
@auth_bp.route("/me", methods=["GET"])
@token_required
def me():
    """Who am I? The frontend calls this on page load to restore session state."""
    return jsonify({"user": g.current_user.to_dict()}), 200


# ---------------------------------------------------------------------
# 5. Login status check (never returns 401)
# ---------------------------------------------------------------------
@auth_bp.route("/status", methods=["GET"])
def status():
    """Lightweight 'am I logged in?' check that always returns 200.

    Useful for the frontend to decide whether to show Login or Dashboard
    without having to treat a 401 as an error.
    """
    token = _extract_token()
    if not token:
        return jsonify({"authenticated": False, "reason": "no_token"}), 200

    payload, error = decode_access_token(token)
    if error:
        return jsonify({"authenticated": False, "reason": error}), 200

    user = db.session.get(User, int(payload["sub"]))
    if not user or not user.is_active:
        return jsonify({"authenticated": False, "reason": "inactive_or_missing"}), 200

    return jsonify({"authenticated": True, "user": user.to_dict()}), 200


# ---------------------------------------------------------------------
# 6. Logout
# ---------------------------------------------------------------------
@auth_bp.route("/logout", methods=["POST"])
@token_required
def logout():
    """JWTs are stateless, so logout is the client deleting its token.

    We record the event for the audit trail. If you later need server-side
    revocation, add a token blocklist table and check it in token_required.
    """
    log_activity(g.current_user.id, "LOGOUT", {"username": g.current_user.username})
    return jsonify({"message": "Logged out. Please discard your token."}), 200


# ---------------------------------------------------------------------
# 7. Change password
# ---------------------------------------------------------------------
@auth_bp.route("/change-password", methods=["POST"])
@token_required
def change_password():
    data = _json_body()
    current_password = data.get("current_password") or ""
    new_password = data.get("new_password") or ""

    if not verify_password(current_password, g.current_user.password_hash):
        return jsonify({"error": "Current password is incorrect."}), 401

    pw_error = validate_password_strength(new_password)
    if pw_error:
        return jsonify({"error": pw_error}), 400

    g.current_user.password_hash = hash_password(new_password)
    db.session.commit()
    log_activity(g.current_user.id, "PASSWORD_CHANGE")

    return jsonify({"message": "Password updated successfully."}), 200
