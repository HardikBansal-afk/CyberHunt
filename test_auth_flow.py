"""End-to-end check of the CyberHunt auth flow against a real database."""
import os
os.environ["DATABASE_URL"] = "postgresql://postgres:postgres@localhost:5432/cyberhunt_auth"
os.environ["JWT_SECRET_KEY"] = "test-secret"

from backend.app import create_app

app = create_app()
c = app.test_client()

passed = failed = 0

def check(label, cond, extra=""):
    global passed, failed
    if cond:
        passed += 1
        print(f"  PASS  {label}")
    else:
        failed += 1
        print(f"  FAIL  {label} {extra}")

print("\n--- eligibility pre-check ---")
r = c.post("/api/auth/check-eligibility", json={"email": "hardik@college.edu"})
check("verified student is eligible", r.get_json()["eligible"] is True, r.get_json())

r = c.post("/api/auth/check-eligibility", json={"email": "nobody@random.com"})
check("unknown email not eligible", r.get_json()["reason"] == "not_verified", r.get_json())

r = c.post("/api/auth/check-eligibility", json={"email": "rohit@college.edu"})
check("form-not-filled student blocked", r.get_json()["reason"] == "form_not_filled", r.get_json())

print("\n--- registration gates ---")
r = c.post("/api/auth/register", json={
    "email": "stranger@random.com", "username": "stranger", "password": "abcd1234"})
check("unverified email rejected (403)", r.status_code == 403, r.status_code)

r = c.post("/api/auth/register", json={
    "email": "rohit@college.edu", "username": "rohit", "password": "abcd1234"})
check("form not filled rejected (403)", r.status_code == 403, r.get_json())

r = c.post("/api/auth/register", json={
    "email": "hardik@college.edu", "username": "hardik", "password": "short"})
check("weak password rejected (400)", r.status_code == 400, r.get_json())

r = c.post("/api/auth/register", json={
    "email": "hardik@college.edu", "username": "hardik",
    "password": "cyber2026pass", "roll_number": "21CS999"})
check("mismatched roll number rejected (403)", r.status_code == 403, r.get_json())

print("\n--- successful registration ---")
r = c.post("/api/auth/register", json={
    "email": "hardik@college.edu", "username": "hardik",
    "password": "cyber2026pass", "roll_number": "21CS101", "team_name": "RedTeam"})
body = r.get_json()
check("registration succeeds (201)", r.status_code == 201, body)
check("token returned", bool(body.get("access_token")), body)
check("user marked verified", body["user"]["is_verified"] is True, body.get("user"))
check("full_name pulled from roster", body["user"]["full_name"] == "Hardik Bansal", body.get("user"))
check("password_hash never exposed", "password_hash" not in body.get("user", {}), body.get("user"))

print("\n--- duplicate registration blocked ---")
r = c.post("/api/auth/register", json={
    "email": "hardik@college.edu", "username": "hardik2", "password": "cyber2026pass"})
check("second registration rejected (409)", r.status_code == 409, r.get_json())

print("\n--- login ---")
r = c.post("/api/auth/login", json={"identifier": "hardik@college.edu", "password": "wrongpass"})
check("wrong password rejected (401)", r.status_code == 401, r.status_code)

r = c.post("/api/auth/login", json={"identifier": "hardik@college.edu", "password": "cyber2026pass"})
check("login by email works", r.status_code == 200, r.get_json())
token = r.get_json()["access_token"]

r = c.post("/api/auth/login", json={"identifier": "hardik", "password": "cyber2026pass"})
check("login by username works", r.status_code == 200, r.get_json())

print("\n--- protected routes ---")
auth = {"Authorization": f"Bearer {token}"}

r = c.get("/api/auth/me")
check("/me without token rejected (401)", r.status_code == 401, r.status_code)

r = c.get("/api/auth/me", headers=auth)
check("/me with token works", r.status_code == 200 and r.get_json()["user"]["username"] == "hardik", r.get_json())

r = c.get("/api/auth/me", headers={"Authorization": "Bearer garbage.token.here"})
check("tampered token rejected (401)", r.status_code == 401, r.status_code)

r = c.get("/api/dashboard", headers=auth)
check("protected dashboard identifies participant", "hardik" in r.get_json().get("message",""), r.get_json())

print("\n--- status endpoint (never 401s) ---")
r = c.get("/api/auth/status")
check("status without token -> 200 false", r.status_code == 200 and r.get_json()["authenticated"] is False, r.get_json())

r = c.get("/api/auth/status", headers=auth)
check("status with token -> 200 true", r.status_code == 200 and r.get_json()["authenticated"] is True, r.get_json())

print("\n--- expired token ---")
import jwt as pyjwt
from datetime import datetime, timezone, timedelta
expired = pyjwt.encode(
    {"sub": "1", "exp": datetime.now(timezone.utc) - timedelta(hours=1)},
    "test-secret", algorithm="HS256")
r = c.get("/api/auth/me", headers={"Authorization": f"Bearer {expired}"})
check("expired token rejected (401)", r.status_code == 401, r.status_code)

print("\n--- change password ---")
r = c.post("/api/auth/change-password", headers=auth,
           json={"current_password": "cyber2026pass", "new_password": "newpass9876"})
check("password change works", r.status_code == 200, r.get_json())
r = c.post("/api/auth/login", json={"identifier": "hardik", "password": "newpass9876"})
check("login with new password works", r.status_code == 200, r.status_code)
r = c.post("/api/auth/login", json={"identifier": "hardik", "password": "cyber2026pass"})
check("old password no longer works", r.status_code == 401, r.status_code)

print("\n--- audit trail ---")
with app.app_context():
    from database.models import db, ActivityLog, User
    actions = [a.action for a in ActivityLog.query.all()]
    check("REGISTER logged", "REGISTER" in actions, actions)
    check("LOGIN logged", "LOGIN" in actions, actions)
    check("LOGIN_FAILED logged", "LOGIN_FAILED" in actions, actions)
    u = User.query.filter_by(username="hardik").first()
    check("password stored hashed, not plaintext",
          "newpass9876" not in (u.password_hash or ""), "PLAINTEXT LEAK")
    check("last_login_at recorded", u.last_login_at is not None)

print(f"\n{'='*50}\nPASSED: {passed}   FAILED: {failed}\n{'='*50}")
