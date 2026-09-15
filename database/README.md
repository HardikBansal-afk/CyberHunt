# CyberHunt — Database Setup

This folder contains everything needed to stand up the database for the
project: 11 tables (`users`, `events`, `challenges`, `challenge_dependencies`,
`submissions`, `scores`, `hints`, `clues_evidence`, `leaderboard`,
`announcements`, `activity_logs`). No question/content data is included yet —
that gets added later via the app or a separate `seed.sql`.

## Files

- **`schema.sql`** — Plain PostgreSQL DDL. Works no matter what backend
  framework you use (Django, Flask, or none at all). Good if you want to
  create the database by hand or in CI.
- **`models.py`** — SQLAlchemy models matching the same schema, for Flask +
  Flask-SQLAlchemy + Flask-Migrate (Alembic) projects. Skip this file if
  you're on Django (see the note below).

## 1. Add these files to the repo

```
CyberHunt/
└── database/
    ├── schema.sql
    ├── models.py
    └── README.md
```

Commit them under a `database/` directory at the repo root (or wherever your
backend folder lives).

## 2. Create the Postgres database

Locally:

```bash
# install Postgres if you don't have it, then:
createdb cyberhunt
```

Or with Docker (no local Postgres install needed):

```bash
docker run --name cyberhunt-db -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=cyberhunt -p 5432:5432 -d postgres:16
```

## 3. Option A — Apply the raw SQL directly

Fastest way to get all 11 tables created:

```bash
psql -U postgres -d cyberhunt -f database/schema.sql
```

This is framework-agnostic — use it even if your app is Django or something
else that doesn't use SQLAlchemy.

## 4. Option B — Flask + SQLAlchemy + Alembic (recommended if using Flask)

Instead of applying `schema.sql` by hand, let Alembic manage it so future
schema changes are tracked as migrations.

```bash
pip install flask flask-sqlalchemy flask-migrate psycopg2-binary
```

In your Flask app factory:

```python
import os
from flask import Flask
from flask_migrate import Migrate
from database.models import db

def create_app():
    app = Flask(__name__)
    app.config["SQLALCHEMY_DATABASE_URI"] = os.environ["DATABASE_URL"]
    db.init_app(app)
    Migrate(app, db)
    return app
```

Set the connection string (e.g. in a `.env` file, loaded with
`python-dotenv`):

```
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/cyberhunt
```

Then generate and apply the migration:

```bash
flask db init          # only once, creates migrations/ folder
flask db migrate -m "initial schema: users, events, challenges..."
flask db upgrade
```

This creates all 11 tables in the database and checks a `migrations/` folder
into git so teammates can run `flask db upgrade` and get the same schema.

## 5. If you're on Django instead

Django wants its schema expressed as `models.py` using `django.db.models`,
not SQLAlchemy. The table design is identical — just the syntax differs. Say
the word and I'll generate a Django-style `models.py` (with `ForeignKey`,
`Meta` classes, and migration files) from the same schema instead.

## 6. Verify it worked

```bash
psql -U postgres -d cyberhunt -c "\dt"
```

You should see all 11 tables listed.

## 7. Adding content later

Once questions/challenges are ready, insert them as rows in `challenges`,
attach any files to `clues_evidence`, and add progressive hints to `hints`.
A `seed.sql` or an admin panel/route in the app is the usual way to do this
— happy to help build either when you're ready.

## Notes on design choices

- **Flags are hashed, not stored in plaintext** (`challenges.flag_hash`) —
  compare submissions by hashing the guess and checking equality, so the
  answer isn't visible via a DB dump.
- **`submissions`** logs every attempt (right or wrong) for anti-cheat and
  analytics; **`scores`** only has one row per user per solved challenge
  (points banked once).
- **`leaderboard`** is a cached/denormalized table for fast reads — recompute
  it from `scores` after every correct submission (via app code or a
  scheduled job) rather than querying aggregates on every page load.
- **`challenge_dependencies`** lets a challenge require another to be solved
  first (self-referencing to `challenges`, prevents a challenge depending on
  itself).
