"""
Password hashing, JWT creation/verification, and route protection decorators.

This is the piece that answers "is this request from a logged-in user, and
which participant is it?" on every protected endpoint.
"""

import os
from datetime import datetime, timedelta, timezone
from functools import wraps

import jwt
from flask import current_app, jsonify, request, g
from werkzeug.security import check_password_hash, generate_password_hash

from database.models import db, User, ActivityLog


# ---------------------------------------------------------------------
# Passwords
# ---------------------------------------------------------------------
def hash_password(plain_password: str) -> str:
    """Hash a password for storage. Never store the plaintext."""
    return generate_password_hash(plain_password)


def verify_password(plain_password: str, password_hash: str) -> bool:
    """Check a submitted password against the stored hash."""
    if not password_hash:
        return False
    return check_password_hash(password_hash, plain_password)


def validate_password_strength(password: str):
    """Return an error message if the password is too weak, else None."""
    if not password or len(password) < 8:
        return "Password must be at least 8 characters long."
    if password.isdigit() or password.isalpha():
        return "Password must contain both letters and numbers."
    return None


# ---------------------------------------------------------------------
# JWT tokens
# ---------------------------------------------------------------------
def create_access_token(user: User) -> str:
    """Issue a signed JWT identifying this user.

    The payload carries the user id (`sub`) and role so most requests can be
    authorised without a DB hit, plus issued-at and expiry timestamps.
    """
    now = datetime.now(timezone.utc)
    expires_in = current_app.config.get("JWT_EXPIRES_HOURS", 12)
    payload = {
        "sub": str(user.id),
        "username": user.username,
        "role": user.role,
        "iat": now,
        "exp": now + timedelta(hours=expires_in),
    }
    return jwt.encode(payload, current_app.config["JWT_SECRET_KEY"], algorithm="HS256")


def decode_access_token(token: str):
    """Return (payload, None) on success, or (None, error_message)."""
    try:
        payload = jwt.decode(
            token, current_app.config["JWT_SECRET_KEY"], algorithms=["HS256"]
        )
        return payload, None
    except jwt.ExpiredSignatureError:
        return None, "Token has expired. Please log in again."
    except jwt.InvalidTokenError:
        return None, "Invalid token."


def _extract_token():
    """Pull the bearer token out of the Authorization header."""
    auth_header = request.headers.get("Authorization", "")
    if auth_header.startswith("Bearer "):
        return auth_header[7:].strip()
    return None


# ---------------------------------------------------------------------
# Decorators
# ---------------------------------------------------------------------
def token_required(f):
    """Protect a route. Rejects anyone without a valid, unexpired token.

    On success, the authenticated User is available as `g.current_user`
    inside the route - this is how the backend "identifies the participant".
    """

    @wraps(f)
    def decorated(*args, **kwargs):
        token = _extract_token()
        if not token:
            return jsonify({"error": "Authorization token is missing."}), 401

        payload, error = decode_access_token(token)
        if error:
            return jsonify({"error": error}), 401

        user = db.session.get(User, int(payload["sub"]))
        if not user:
            return jsonify({"error": "User no longer exists."}), 401
        if not user.is_active:
            return jsonify({"error": "This account has been deactivated."}), 403

        g.current_user = user
        return f(*args, **kwargs)

    return decorated


def role_required(*allowed_roles):
    """Restrict a route to certain roles, e.g. @role_required('admin')."""

    def decorator(f):
        @wraps(f)
        @token_required
        def decorated(*args, **kwargs):
            if g.current_user.role not in allowed_roles:
                return jsonify({"error": "You do not have permission to do this."}), 403
            return f(*args, **kwargs)

        return decorated

    return decorator


# ---------------------------------------------------------------------
# Audit logging
# ---------------------------------------------------------------------
def log_activity(user_id, action, details=None):
    """Write an entry to activity_logs. Never let logging break the request."""
    try:
        entry = ActivityLog(
            user_id=user_id,
            action=action,
            details=details or {},
            ip_address=request.remote_addr,
        )
        db.session.add(entry)
        db.session.commit()
    except Exception:
        db.session.rollback()
