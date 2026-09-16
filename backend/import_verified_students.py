"""
Import your verified-students list into the `verified_students` roster table.

This is the allowlist registration checks against - if a student isn't in
here, they cannot create an account.

Usage:
    python -m backend.import_verified_students students.csv

Expected CSV columns (header row required):
    roll_number,full_name,email,branch,year_of_study,phone,form_filled

Only roll_number, full_name and email are mandatory. `form_filled` accepts
true/false/yes/no/1/0 and defaults to true.

Re-running is safe: existing students are updated, not duplicated, and a
student who has already registered is never reset.
"""

import csv
import sys

from backend.app import create_app
from database.models import db
from database.auth_models import VerifiedStudent


def parse_bool(value, default=True):
    if value is None or str(value).strip() == "":
        return default
    return str(value).strip().lower() in ("true", "yes", "y", "1")


def parse_int(value):
    try:
        return int(str(value).strip())
    except (TypeError, ValueError):
        return None


def import_csv(path):
    created = updated = skipped = 0
    errors = []

    with open(path, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        for line_no, row in enumerate(reader, start=2):
            roll = (row.get("roll_number") or "").strip()
            name = (row.get("full_name") or "").strip()
            email = (row.get("email") or "").strip().lower()

            if not roll or not name or not email:
                errors.append(f"line {line_no}: missing roll_number, full_name or email")
                skipped += 1
                continue

            existing = VerifiedStudent.query.filter(
                (VerifiedStudent.roll_number == roll)
                | (db.func.lower(VerifiedStudent.email) == email)
            ).first()

            if existing:
                # Never undo a completed registration on re-import.
                existing.full_name = name
                existing.email = email
                existing.roll_number = roll
                existing.branch = (row.get("branch") or "").strip() or existing.branch
                existing.year_of_study = parse_int(row.get("year_of_study")) or existing.year_of_study
                existing.phone = (row.get("phone") or "").strip() or existing.phone
                existing.form_filled = parse_bool(row.get("form_filled"), existing.form_filled)
                updated += 1
            else:
                db.session.add(VerifiedStudent(
                    roll_number=roll,
                    full_name=name,
                    email=email,
                    branch=(row.get("branch") or "").strip() or None,
                    year_of_study=parse_int(row.get("year_of_study")),
                    phone=(row.get("phone") or "").strip() or None,
                    form_filled=parse_bool(row.get("form_filled")),
                ))
                created += 1

    db.session.commit()
    return created, updated, skipped, errors


def main():
    if len(sys.argv) < 2:
        print("Usage: python -m backend.import_verified_students <students.csv>")
        sys.exit(1)

    app = create_app()
    with app.app_context():
        created, updated, skipped, errors = import_csv(sys.argv[1])

    print(f"Created: {created}   Updated: {updated}   Skipped: {skipped}")
    if errors:
        print("\nProblems found:")
        for e in errors:
            print("  -", e)
    total = VerifiedStudent.query.count() if False else None
    print("\nDone. Students in this list can now register.")


if __name__ == "__main__":
    main()
