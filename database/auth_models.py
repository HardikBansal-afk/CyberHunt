"""
Auth-related models for CyberHunt.

These extend the core models in database/models.py. Import both:

    from database.models import db, User, Challenge, ...
    from database.auth_models import VerifiedStudent

Corresponds to database/migrations/002_auth_and_verification.sql.
"""

from datetime import datetime
from database.models import db


class VerifiedStudent(db.Model):
    """The allowlist of students who filled the form and were verified.

    Registration is only permitted for an email/roll number present here.
    Once a student registers, `has_registered` flips to True and `user_id`
    points at their account, so nobody can register twice.
    """

    __tablename__ = "verified_students"

    id = db.Column(db.Integer, primary_key=True)
    roll_number = db.Column(db.String(50), unique=True, nullable=False)
    full_name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(255), unique=True, nullable=False)
    branch = db.Column(db.String(100))
    year_of_study = db.Column(db.Integer)
    phone = db.Column(db.String(20))

    form_filled = db.Column(db.Boolean, nullable=False, default=True)
    has_registered = db.Column(db.Boolean, nullable=False, default=False)
    user_id = db.Column(
        db.Integer, db.ForeignKey("users.id", ondelete="SET NULL"), unique=True
    )

    created_at = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def to_dict(self):
        return {
            "roll_number": self.roll_number,
            "full_name": self.full_name,
            "email": self.email,
            "branch": self.branch,
            "year_of_study": self.year_of_study,
            "form_filled": self.form_filled,
            "has_registered": self.has_registered,
        }
