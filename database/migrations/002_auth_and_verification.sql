-- =====================================================================
-- Migration 002: Authentication + student verification
--
-- Adds the pieces the login/registration flow needs on top of schema.sql:
--   1. verified_students  - the allowlist of students who filled out the
--                           form and were verified. Registration is only
--                           allowed for people in this table.
--   2. users.is_verified  - set TRUE once a user registers against a
--                           matching verified_students row.
--   3. users.last_login_at - handy for admin views and activity tracking.
--
-- Run after schema.sql:
--   psql -U postgres -d cyberhunt -f database/migrations/002_auth_and_verification.sql
-- =====================================================================

-- ---------------------------------------------------------------------
-- The verified student roster (source of truth for "are you allowed in")
-- Populate this from your existing verified-students data / form exports.
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS verified_students (
    id              SERIAL PRIMARY KEY,
    roll_number     VARCHAR(50)  UNIQUE NOT NULL,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    branch          VARCHAR(100),
    year_of_study   INTEGER,
    phone           VARCHAR(20),

    -- Did they submit the registration/participation form?
    form_filled     BOOLEAN NOT NULL DEFAULT TRUE,

    -- Has this student already created a login account? Prevents one
    -- student registering twice under different usernames.
    has_registered  BOOLEAN NOT NULL DEFAULT FALSE,

    -- Filled in once they register; links roster entry -> user account.
    user_id         INTEGER UNIQUE REFERENCES users(id) ON DELETE SET NULL,

    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Emails are matched case-insensitively during registration, so index that way.
CREATE UNIQUE INDEX IF NOT EXISTS idx_verified_students_email_lower
    ON verified_students (LOWER(email));
CREATE INDEX IF NOT EXISTS idx_verified_students_roll
    ON verified_students (roll_number);

-- ---------------------------------------------------------------------
-- Extra columns on users needed by the auth flow
-- ---------------------------------------------------------------------
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_verified   BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE users ADD COLUMN IF NOT EXISTS last_login_at TIMESTAMPTZ;

-- Match user emails case-insensitively at login.
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_email_lower ON users (LOWER(email));
