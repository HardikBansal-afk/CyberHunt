-- =====================================================================
-- CyberHunt Database Schema (PostgreSQL)
-- Creates all core tables. Run this once against a fresh database.
--   psql -U <user> -d cyberhunt -f schema.sql
-- =====================================================================

-- Enable UUID/crypto helpers if you later want hashed tokens, etc.
-- CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ---------------------------------------------------------------------
-- Custom enum types
-- ---------------------------------------------------------------------
CREATE TYPE user_role AS ENUM ('participant', 'organizer', 'admin');
CREATE TYPE event_status AS ENUM ('upcoming', 'active', 'ended');
CREATE TYPE difficulty_level AS ENUM ('easy', 'medium', 'hard', 'expert');
CREATE TYPE clue_type AS ENUM ('text', 'image', 'file', 'link', 'video');

-- ---------------------------------------------------------------------
-- 1. USERS
-- ---------------------------------------------------------------------
CREATE TABLE users (
    id              SERIAL PRIMARY KEY,
    username        VARCHAR(50)  UNIQUE NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    full_name       VARCHAR(100),
    team_name       VARCHAR(100),
    role            user_role NOT NULL DEFAULT 'participant',
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ---------------------------------------------------------------------
-- 2. EVENTS
-- ---------------------------------------------------------------------
CREATE TABLE events (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(150) NOT NULL,
    slug            VARCHAR(150) UNIQUE NOT NULL,
    description     TEXT,
    start_time      TIMESTAMPTZ NOT NULL,
    end_time        TIMESTAMPTZ NOT NULL,
    status          event_status NOT NULL DEFAULT 'upcoming',
    created_by      INTEGER REFERENCES users(id) ON DELETE SET NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_event_time CHECK (end_time > start_time)
);

-- ---------------------------------------------------------------------
-- 3. CHALLENGES
-- ---------------------------------------------------------------------
CREATE TABLE challenges (
    id              SERIAL PRIMARY KEY,
    event_id        INTEGER NOT NULL REFERENCES events(id) ON DELETE CASCADE,
    title           VARCHAR(150) NOT NULL,
    description     TEXT,
    category        VARCHAR(50),                 -- web, crypto, forensics, osint, misc...
    difficulty      difficulty_level NOT NULL DEFAULT 'easy',
    points          INTEGER NOT NULL DEFAULT 100 CHECK (points >= 0),
    flag_hash       VARCHAR(255) NOT NULL,        -- store a hash of the flag, never plaintext
    max_attempts    INTEGER,                      -- NULL = unlimited attempts
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_by      INTEGER REFERENCES users(id) ON DELETE SET NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_challenges_event ON challenges(event_id);

-- ---------------------------------------------------------------------
-- 4. CHALLENGE_DEPENDENCIES  (challenge unlocks only after prerequisite solved)
-- ---------------------------------------------------------------------
CREATE TABLE challenge_dependencies (
    id                       SERIAL PRIMARY KEY,
    challenge_id             INTEGER NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
    depends_on_challenge_id  INTEGER NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (challenge_id, depends_on_challenge_id),
    CONSTRAINT chk_no_self_dependency CHECK (challenge_id <> depends_on_challenge_id)
);
CREATE INDEX idx_dependencies_challenge ON challenge_dependencies(challenge_id);

-- ---------------------------------------------------------------------
-- 5. SUBMISSIONS  (every flag attempt, correct or not)
-- ---------------------------------------------------------------------
CREATE TABLE submissions (
    id              SERIAL PRIMARY KEY,
    user_id         INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    challenge_id    INTEGER NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
    submitted_flag  VARCHAR(255) NOT NULL,
    is_correct      BOOLEAN NOT NULL DEFAULT FALSE,
    attempt_number  INTEGER NOT NULL DEFAULT 1,
    ip_address      INET,
    submitted_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_submissions_user ON submissions(user_id);
CREATE INDEX idx_submissions_challenge ON submissions(challenge_id);

-- ---------------------------------------------------------------------
-- 6. SCORES  (one row per challenge successfully solved -> points banked)
-- ---------------------------------------------------------------------
CREATE TABLE scores (
    id              SERIAL PRIMARY KEY,
    user_id         INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    event_id        INTEGER NOT NULL REFERENCES events(id) ON DELETE CASCADE,
    challenge_id    INTEGER NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
    points_awarded  INTEGER NOT NULL,
    awarded_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (user_id, challenge_id)   -- points for a challenge only ever counted once
);
CREATE INDEX idx_scores_event_user ON scores(event_id, user_id);

-- ---------------------------------------------------------------------
-- 7. HINTS
-- ---------------------------------------------------------------------
CREATE TABLE hints (
    id              SERIAL PRIMARY KEY,
    challenge_id    INTEGER NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
    hint_text       TEXT NOT NULL,
    point_cost      INTEGER NOT NULL DEFAULT 0 CHECK (point_cost >= 0),
    order_index     INTEGER NOT NULL DEFAULT 1,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_hints_challenge ON hints(challenge_id);

-- ---------------------------------------------------------------------
-- 8. CLUES_EVIDENCE  (files/images/text handed out as investigation material)
-- ---------------------------------------------------------------------
CREATE TABLE clues_evidence (
    id              SERIAL PRIMARY KEY,
    challenge_id    INTEGER REFERENCES challenges(id) ON DELETE CASCADE,
    title           VARCHAR(150),
    description     TEXT,
    file_path       VARCHAR(255),          -- path or URL to the attached file
    clue_type       clue_type NOT NULL DEFAULT 'text',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_clues_challenge ON clues_evidence(challenge_id);

-- ---------------------------------------------------------------------
-- 9. LEADERBOARD  (cached ranking per event; refreshed after each solve)
-- ---------------------------------------------------------------------
CREATE TABLE leaderboard (
    id                SERIAL PRIMARY KEY,
    event_id          INTEGER NOT NULL REFERENCES events(id) ON DELETE CASCADE,
    user_id           INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    total_points      INTEGER NOT NULL DEFAULT 0,
    total_solves      INTEGER NOT NULL DEFAULT 0,
    last_solve_time   TIMESTAMPTZ,
    rank              INTEGER,
    updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (event_id, user_id)
);
CREATE INDEX idx_leaderboard_event_rank ON leaderboard(event_id, rank);

-- ---------------------------------------------------------------------
-- 10. ANNOUNCEMENTS
-- ---------------------------------------------------------------------
CREATE TABLE announcements (
    id              SERIAL PRIMARY KEY,
    event_id        INTEGER REFERENCES events(id) ON DELETE CASCADE,  -- NULL = site-wide
    title           VARCHAR(150) NOT NULL,
    message         TEXT NOT NULL,
    posted_by       INTEGER REFERENCES users(id) ON DELETE SET NULL,
    is_pinned       BOOLEAN NOT NULL DEFAULT FALSE,
    posted_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_announcements_event ON announcements(event_id);

-- ---------------------------------------------------------------------
-- 11. ACTIVITY_LOGS  (audit trail: logins, submissions, hint unlocks, admin actions)
-- ---------------------------------------------------------------------
CREATE TABLE activity_logs (
    id              SERIAL PRIMARY KEY,
    user_id         INTEGER REFERENCES users(id) ON DELETE SET NULL,
    action          VARCHAR(100) NOT NULL,   -- e.g. LOGIN, SUBMIT_FLAG, HINT_UNLOCK, CHALLENGE_CREATE
    details         JSONB,
    ip_address      INET,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_activity_logs_user ON activity_logs(user_id);
CREATE INDEX idx_activity_logs_created ON activity_logs(created_at);

-- =====================================================================
-- Done. All 11 tables created. Add rows via your app, an ORM, or
-- INSERT statements in a separate seed.sql once content is ready.
-- =====================================================================
