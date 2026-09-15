"""
CyberHunt database models (Flask-SQLAlchemy).

Usage:
    from database.models import db, User, Event, Challenge, ...

    app.config["SQLALCHEMY_DATABASE_URI"] = os.environ["DATABASE_URL"]
    db.init_app(app)

Then generate/apply migrations with Flask-Migrate (Alembic):
    flask db init        # once
    flask db migrate -m "initial schema"
    flask db upgrade
"""

from datetime import datetime
from sqlalchemy.dialects.postgresql import JSONB
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


# ---------------------------------------------------------------------
# 1. USERS
# ---------------------------------------------------------------------
class User(db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    full_name = db.Column(db.String(100))
    team_name = db.Column(db.String(100))
    role = db.Column(db.String(20), nullable=False, default="participant")  # participant/organizer/admin
    is_active = db.Column(db.Boolean, nullable=False, default=True)
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow, onupdate=datetime.utcnow)


# ---------------------------------------------------------------------
# 2. EVENTS
# ---------------------------------------------------------------------
class Event(db.Model):
    __tablename__ = "events"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150), nullable=False)
    slug = db.Column(db.String(150), unique=True, nullable=False)
    description = db.Column(db.Text)
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime, nullable=False)
    status = db.Column(db.String(20), nullable=False, default="upcoming")  # upcoming/active/ended
    created_by = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="SET NULL"))
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 3. CHALLENGES
# ---------------------------------------------------------------------
class Challenge(db.Model):
    __tablename__ = "challenges"

    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.Integer, db.ForeignKey("events.id", ondelete="CASCADE"), nullable=False)
    title = db.Column(db.String(150), nullable=False)
    description = db.Column(db.Text)
    category = db.Column(db.String(50))
    difficulty = db.Column(db.String(20), nullable=False, default="easy")  # easy/medium/hard/expert
    points = db.Column(db.Integer, nullable=False, default=100)
    flag_hash = db.Column(db.String(255), nullable=False)  # never store the plaintext flag
    max_attempts = db.Column(db.Integer)  # None = unlimited
    is_active = db.Column(db.Boolean, nullable=False, default=True)
    created_by = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="SET NULL"))
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow, onupdate=datetime.utcnow)


# ---------------------------------------------------------------------
# 4. CHALLENGE_DEPENDENCIES
# ---------------------------------------------------------------------
class ChallengeDependency(db.Model):
    __tablename__ = "challenge_dependencies"
    __table_args__ = (
        db.UniqueConstraint("challenge_id", "depends_on_challenge_id"),
        db.CheckConstraint("challenge_id != depends_on_challenge_id"),
    )

    id = db.Column(db.Integer, primary_key=True)
    challenge_id = db.Column(db.Integer, db.ForeignKey("challenges.id", ondelete="CASCADE"), nullable=False)
    depends_on_challenge_id = db.Column(db.Integer, db.ForeignKey("challenges.id", ondelete="CASCADE"), nullable=False)
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 5. SUBMISSIONS
# ---------------------------------------------------------------------
class Submission(db.Model):
    __tablename__ = "submissions"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    challenge_id = db.Column(db.Integer, db.ForeignKey("challenges.id", ondelete="CASCADE"), nullable=False)
    submitted_flag = db.Column(db.String(255), nullable=False)
    is_correct = db.Column(db.Boolean, nullable=False, default=False)
    attempt_number = db.Column(db.Integer, nullable=False, default=1)
    ip_address = db.Column(db.String(45))
    submitted_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 6. SCORES
# ---------------------------------------------------------------------
class Score(db.Model):
    __tablename__ = "scores"
    __table_args__ = (db.UniqueConstraint("user_id", "challenge_id"),)

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    event_id = db.Column(db.Integer, db.ForeignKey("events.id", ondelete="CASCADE"), nullable=False)
    challenge_id = db.Column(db.Integer, db.ForeignKey("challenges.id", ondelete="CASCADE"), nullable=False)
    points_awarded = db.Column(db.Integer, nullable=False)
    awarded_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 7. HINTS
# ---------------------------------------------------------------------
class Hint(db.Model):
    __tablename__ = "hints"

    id = db.Column(db.Integer, primary_key=True)
    challenge_id = db.Column(db.Integer, db.ForeignKey("challenges.id", ondelete="CASCADE"), nullable=False)
    hint_text = db.Column(db.Text, nullable=False)
    point_cost = db.Column(db.Integer, nullable=False, default=0)
    order_index = db.Column(db.Integer, nullable=False, default=1)
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 8. CLUES_EVIDENCE
# ---------------------------------------------------------------------
class ClueEvidence(db.Model):
    __tablename__ = "clues_evidence"

    id = db.Column(db.Integer, primary_key=True)
    challenge_id = db.Column(db.Integer, db.ForeignKey("challenges.id", ondelete="CASCADE"))
    title = db.Column(db.String(150))
    description = db.Column(db.Text)
    file_path = db.Column(db.String(255))
    clue_type = db.Column(db.String(20), nullable=False, default="text")  # text/image/file/link/video
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 9. LEADERBOARD
# ---------------------------------------------------------------------
class Leaderboard(db.Model):
    __tablename__ = "leaderboard"
    __table_args__ = (db.UniqueConstraint("event_id", "user_id"),)

    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.Integer, db.ForeignKey("events.id", ondelete="CASCADE"), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    total_points = db.Column(db.Integer, nullable=False, default=0)
    total_solves = db.Column(db.Integer, nullable=False, default=0)
    last_solve_time = db.Column(db.DateTime)
    rank = db.Column(db.Integer)
    updated_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow, onupdate=datetime.utcnow)


# ---------------------------------------------------------------------
# 10. ANNOUNCEMENTS
# ---------------------------------------------------------------------
class Announcement(db.Model):
    __tablename__ = "announcements"

    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.Integer, db.ForeignKey("events.id", ondelete="CASCADE"))  # None = site-wide
    title = db.Column(db.String(150), nullable=False)
    message = db.Column(db.Text, nullable=False)
    posted_by = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="SET NULL"))
    is_pinned = db.Column(db.Boolean, nullable=False, default=False)
    posted_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# ---------------------------------------------------------------------
# 11. ACTIVITY_LOGS
# ---------------------------------------------------------------------
class ActivityLog(db.Model):
    __tablename__ = "activity_logs"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="SET NULL"))
    action = db.Column(db.String(100), nullable=False)  # LOGIN, SUBMIT_FLAG, HINT_UNLOCK, etc.
    details = db.Column(JSONB)
    ip_address = db.Column(db.String(45))
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
