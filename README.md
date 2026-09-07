# 🕵️ CyberHunt

### The Digital Escape Room

> A solo, 2-hour gamified cybersecurity competition where participants investigate a fictional cyber incident through a sequence of interconnected challenges.

---

## 📌 Overview

CyberHunt is a custom-built cybersecurity competition platform designed around a **digital escape-room experience**.

Participants are presented with a fictional cybersecurity incident and must investigate a sequence of interconnected challenges to uncover clues, progress through the investigation, and ultimately identify the attacker.

The competition is:

- 👤 **Solo**
- ⏱️ **2 Hours / 120 Minutes**
- 🧩 **Challenge-driven**
- 🔗 **Interconnected**
- 🏆 **Score-based**
- ⚡ **Real-time**
- 🛡️ **Cybersecurity-focused**

The platform consists of two primary interfaces:

1. **Participant Platform**
2. **Admin Control Center**

The actual cybersecurity challenge environments are kept isolated from the core platform.

---

# 🎯 Event Concept

### Fictional Incident

> Someone has breached the university network.
>
> You have 120 minutes to investigate the incident, follow the available clues, and identify the attacker.

Participants progress through interconnected challenges covering:

1. Hidden Clues
2. Password Puzzles
3. OSINT
4. Encoding / Decoding
5. Web Vulnerabilities
6. Digital Forensics

A solved challenge should contribute information toward the larger investigation rather than existing as a completely independent question.

---

# 🏗️ Platform Architecture

```text
                         ┌─────────────────────────┐
                         │       CYBERHUNT         │
                         │      WEB PLATFORM       │
                         └────────────┬────────────┘
                                      │
                    ┌─────────────────┴─────────────────┐
                    │                                   │
                    ▼                                   ▼
          ┌───────────────────┐               ┌───────────────────┐
          │ PARTICIPANT APP   │               │   ADMIN PANEL     │
          └─────────┬─────────┘               └─────────┬─────────┘
                    │                                   │
                    └─────────────────┬─────────────────┘
                                      │
                                      ▼
                         ┌─────────────────────────┐
                         │       API SERVER        │
                         │        BACKEND          │
                         └────────────┬────────────┘
                                      │
            ┌─────────────────────────┼─────────────────────────┐
            │                         │                         │
            ▼                         ▼                         ▼
    ┌───────────────┐       ┌────────────────┐        ┌────────────────┐
    │ AUTH SERVICE  │       │ EVENT ENGINE   │        │ CHALLENGE      │
    │               │       │                │        │ ENGINE         │
    └───────────────┘       └────────────────┘        └───────┬────────┘
                                                              │
                                                              ▼
                                                     ┌─────────────────┐
                                                     │ SCORING ENGINE  │
                                                     └────────┬────────┘
                                                              │
                    ┌─────────────────────────────────────────┼──────────┐
                    │                                         │          │
                    ▼                                         ▼          ▼
             ┌────────────┐                           ┌────────────┐ ┌──────────┐
             │ PostgreSQL │                           │   Redis    │ │ Storage  │
             │  Database  │                           │            │ │          │
             └────────────┘                           └─────┬──────┘ └──────────┘
                                                            │
                                                            ▼
                                                     ┌──────────────┐
                                                     │ WebSockets   │
                                                     │ Real-time    │
                                                     └──────────────┘

                                      ║
                              ISOLATED NETWORK
                                      ║
                ┌─────────────────────┼─────────────────────┐
                │                     │                     │
                ▼                     ▼                     ▼
         ┌─────────────┐      ┌─────────────┐      ┌─────────────┐
         │ Web         │      │ Forensics   │      │ Other       │
         │ Challenges  │      │ Challenges  │      │ Challenge   │
         │             │      │             │      │ Services    │
         └─────────────┘      └─────────────┘      └─────────────┘
```

---

# 🧱 Core Components

CyberHunt consists of two primary user-facing applications, a shared backend, a real-time communication layer, a persistent data layer, and isolated challenge infrastructure.

---

## 1. 👤 Participant Platform

The participant-facing application used by individual players throughout the 2-hour event.

### Responsibilities

- Registration and login
- Incident briefing
- Investigation dashboard
- 120-minute event timer
- Challenge discovery and progression
- Challenge workspace
- Flag / answer submission
- Clue and evidence tracking
- Hint system
- Score display
- Current rank
- Live leaderboard
- Event announcements
- Final results

### Main Participant Flow

```text
Registration / Login
        ↓
Incident Briefing
        ↓
Start Investigation
        ↓
120-Minute Timer
        ↓
Investigation Dashboard
        ↓
Challenges ↔ Evidence
        ↓
Submit Answers / Flags
        ↓
Score + Progress Update
        ↓
Unlock Further Challenges
        ↓
Final Investigation
        ↓
Event End
        ↓
Final Ranking
```

---

# 2. 🎛️ Admin Control Center

The admin-facing application used by the organising and technical teams to control and monitor the event in real time.

### Responsibilities

- Event control
- Live leaderboard
- Participant monitoring
- Challenge management
- Submission monitoring
- Hint management
- Challenge lock / unlock
- Announcements
- Activity and audit logs
- Event analytics
- Final results

### Admin Dashboard

The main control center should provide a live overview of the event.

```text
CYBERHUNT // CONTROL CENTER

EVENT STATUS        ● LIVE
TIME REMAINING      01:37:42

REGISTERED          500
ACTIVE              387
TOTAL SOLVES        2,847
AVG SCORE           1,284

────────────────────────────────

LIVE LEADERBOARD

#    PLAYER          SCORE     TIME
1    ShadowX         1450      82:18
2    CyberWolf       1400      76:42
3    RootAccess      1350      91:07

────────────────────────────────

LIVE ACTIVITY

09:18  ShadowX solved Challenge #18
09:17  RootAccess used Hint #2
09:16  CyberWolf solved Challenge #17
```

### Event Controls

```text
[ START EVENT ]

[ PAUSE EVENT ]
[ RESUME EVENT ]

[ +5 MIN ]
[ +10 MIN ]
[ +30 MIN ]

[ LOCK SUBMISSIONS ]

[ END EVENT ]
```

---

# 3. 🧩 Challenge Engine

The challenge engine manages all CyberHunt challenges and their progression.

Challenges should be **interconnected** rather than functioning only as independent questions.

### Challenge Categories

```text
Hidden Clues
Password Puzzles
OSINT
Encoding / Decoding
Web Vulnerabilities
Digital Forensics
```

### Challenge Data

Each challenge should support:

```text
Challenge ID
Title
Description
Category
Difficulty
Point Value
Flag / Answer
Hints
Prerequisites
Unlock Conditions
Attachments
Status
```

### Challenge States

```text
DRAFT
  ↓
PUBLISHED
  ↓
LOCKED / UNLOCKED
  ↓
ACTIVE
  ↓
COMPLETED / DISABLED
```

### Challenge Dependencies

The platform should support dependencies between challenges.

Example:

```text
Challenge #1
Hidden Clue
     ↓
Challenge #2
Password Puzzle
     ↓
┌───────────────┐
│               │
▼               ▼
OSINT        Encoding
│               │
└───────┬───────┘
        ▼
   Web Challenge
        ↓
 Digital Forensics
        ↓
 Final Investigation
```

The exact progression should be configurable by the admin.

---

# 4. ⏱️ Event Engine

The event engine controls the complete lifecycle of the CyberHunt event.

CyberHunt is a **120-minute / 2-hour event**.

### Event States

```text
DRAFT
  ↓
READY
  ↓
LIVE
  ↓
PAUSED
  ↓
LIVE
  ↓
ENDED
```

### Responsibilities

- Event start
- Start participant timers
- Maintain event duration
- Pause / resume event
- Extend event duration
- Lock submissions
- End event
- Trigger final rankings
- Synchronise event state

### Timer Requirements

The timer must be **server-authoritative**.

The browser should only display the timer. It must not determine whether the event has expired.

The backend should calculate:

```text
Remaining Time =
Event End Time - Current Server Time
```

This prevents participants from manipulating their local system clock or browser timer.

---

# 5. 🏆 Scoring & Ranking Engine

CyberHunt is a **solo, score-based competition**.

Each challenge has a predefined point value.

Example:

```text
Easy       → 50 points
Medium     → 100 points
Hard       → 150 points
Expert     → 250 points
Final      → 500 points
```

Point values should be configurable.

### Score Calculation

```text
Challenge Solved
       ↓
Validate Answer
       ↓
Check Previous Solve
       ↓
Award Points
       ↓
Record Score Transaction
       ↓
Update Participant Score
       ↓
Recalculate Rank
```

### Hint Deduction

If hints carry a penalty:

```text
Current Score
      ↓
Hint Requested
      ↓
Apply Hint Penalty
      ↓
Reveal Hint
      ↓
Record Transaction
```

Example:

```text
Hint #1 → -10 points
Hint #2 → -20 points
Hint #3 → -40 points
```

### Ranking Algorithm

Ranking should be deterministic:

```text
1. Higher total score
        ↓
2. If score is equal:
   Earlier achievement time
        ↓
3. If still equal:
   Earlier final submission timestamp
```

Score is always the primary factor.

Time is used as the tie-breaker.

---

# 6. 📊 Leaderboard

The leaderboard provides live rankings for participants and organisers.

### Participant Leaderboard

```text
CYBERHUNT // LIVE RANKINGS

#    PLAYER          SCORE     TIME USED    SOLVED
──────────────────────────────────────────────────
🥇   ShadowX         1450      82:18        18
🥈   CyberWolf       1400      76:42        17
🥉   RootAccess      1350      91:07        16
4    NullByte        1250      88:21        15
5    ByteHunter      1200      95:04        14
```

### Admin Leaderboard

The admin version should additionally include:

```text
Player
Score
Rank
Time Used
Challenges Solved
Hints Used
Last Solve
Last Activity
Status
```

### Rank Updates

When a participant solves a challenge:

```text
Challenge Solved
       ↓
Score Updated
       ↓
Ranking Recalculated
       ↓
Leaderboard Updated
       ↓
WebSocket Broadcast
       ↓
All Connected Clients Updated
```

---

# 7. 💡 Hint System

The hint system allows participants to request assistance while maintaining competitive scoring.

Each challenge can have multiple hints.

Example:

```text
HINT #1
Cost: 10 points

HINT #2
Cost: 20 points

HINT #3
Cost: 40 points
```

### Hint Flow

```text
Participant
     ↓
Request Hint
     ↓
Display Cost
     ↓
Confirm
     ↓
Deduct Points
     ↓
Reveal Hint
     ↓
Log Hint Usage
```

The backend must handle the deduction and hint unlock.

The frontend should never be responsible for applying score deductions.

---

# 8. 📁 Clue / Evidence System

The evidence system connects individual challenges to the larger CyberHunt investigation.

A challenge can reveal a piece of information that contributes to the overall incident.

Possible evidence:

```text
Attacker Alias
IP Address
Email Address
Location
Device
Attack Vector
Compromised Account
Motive
Target
```

### Evidence Flow

```text
Challenge Solved
      ↓
Evidence Unlocked
      ↓
Evidence Added to Investigation
      ↓
Participant Connects Clues
      ↓
Further Challenge / Final Investigation
```

The evidence system should support:

- Evidence ID
- Title
- Description
- Source challenge
- Unlock condition
- Evidence type
- Visibility
- Relationships to other evidence

---

# 9. 📢 Announcement System

Admins should be able to send live announcements to all participants.

Examples:

```text
🚨 60 MINUTES REMAINING

⚠️ NEW CLUE AVAILABLE

🔓 CHALLENGE #12 UNLOCKED

🚨 FINAL 10 MINUTES
```

Announcements should support:

- Message
- Priority
- Target audience
- Timestamp
- Admin identity
- Event association

Announcements can be delivered using WebSockets.

---

# 10. 📝 Submission System

All challenge answers and flags must be validated by the backend.

### Submission Flow

```text
Participant
     ↓
Submit Answer / Flag
     ↓
API Validation
     ↓
Check Event Status
     ↓
Check Challenge Availability
     ↓
Validate Answer
     ↓
┌───────────────┐
│               │
▼               ▼
INCORRECT      CORRECT
│               │
▼               ▼
Log Attempt    Record Solve
                ↓
             Award Points
                ↓
          Unlock Content
                ↓
          Update Ranking
                ↓
          Broadcast Update
```

### Submission Requirements

The system should support:

- Correct / incorrect validation
- Submission timestamp
- Attempt history
- Rate limiting
- Duplicate submission handling
- Score assignment
- Challenge completion
- Audit logging

Flags must never be exposed to the frontend.

---

# 11. ⚡ Real-Time Layer

CyberHunt requires real-time updates during the live event.

Recommended:

```text
Redis + WebSockets
```

### Real-Time Events

```text
event.started
event.paused
event.resumed
event.extended
event.ended

challenge.unlocked
challenge.solved

score.updated
rank.updated

announcement.created

participant.status_changed
```

### Architecture

```text
                     BACKEND
                        │
                      REDIS
                        │
                 WEBSOCKET SERVER
                        │
        ┌───────────────┼───────────────┐
        ▼               ▼               ▼
   Participant      Participant       Admin
      #001             #002         Dashboard
        │               │               │
        └───────────────┼───────────────┘
                        │
                  REAL-TIME EVENTS
```

WebSockets should be used for live information rather than repeatedly refreshing the page.

---

# 12. 🗃️ Database Layer

PostgreSQL should be used as the primary persistent data store.

### Core Entities

```text
User
Participant
Event
Challenge
ChallengeDependency
Submission
ScoreTransaction
Hint
HintUsage
Clue
Evidence
Announcement
ActivityLog
```

### Relationship Overview

```text
USER
 │
 └── PARTICIPANT
        │
        ├── SUBMISSIONS
        ├── SCORE TRANSACTIONS
        ├── HINT USAGE
        ├── CLUES / EVIDENCE
        └── ACTIVITY LOGS

EVENT
 │
 ├── PARTICIPANTS
 ├── CHALLENGES
 ├── ANNOUNCEMENTS
 └── RESULTS

CHALLENGE
 │
 ├── DEPENDENCIES
 ├── HINTS
 ├── SUBMISSIONS
 └── EVIDENCE
```

The database should be treated as the source of truth for persistent competition data.

---

# 13. 🛡️ Isolated Challenge Infrastructure

Technical cybersecurity challenges should be separated from the core CyberHunt platform.

This is especially important for:

- Web vulnerabilities
- Interactive services
- Network challenges
- Exploitation environments

### Architecture

```text
                  CYBERHUNT CORE
                       │
            ┌──────────┴──────────┐
            │                     │
       Backend/API            Database
            │
            ║
       NETWORK ISOLATION
            ║
            │
   ┌────────┼────────┬────────────┐
   ▼        ▼        ▼            ▼
  WEB    FORENSICS  NETWORK     OTHER
  LAB      LAB       LAB       SERVICES
```

Participants should never be able to use a vulnerable challenge to access:

```text
PostgreSQL
Redis
Admin Panel
Authentication Service
Scoring Engine
Internal APIs
Host Machine
```

Challenge environments should be sandboxed and monitored.

---

# 14. 🔐 Authentication & Authorization

Authentication should be implemented centrally.

### Roles

```text
PARTICIPANT
ADMIN
SUPER_ADMIN
```

### Participant

Can:

- Access own profile
- Access available challenges
- Submit answers
- View own score
- View leaderboard
- Request hints
- View own evidence

### Admin

Can:

- Manage event
- Manage challenges
- Monitor participants
- View submissions
- Send announcements
- Control event

### Super Admin

Can:

- Manage admins
- Manage system configuration
- Access sensitive platform controls

Role-based access control must be enforced on the backend.

---

# 15. 📋 Activity & Audit Logging

Important actions should be recorded for troubleshooting, fairness and post-event analysis.

### Example

```text
09:18:42
ShadowX
SOLVED
Challenge #18
+150

09:18:31
RootAccess
HINT_USED
Challenge #07
-20

09:17:51
CyberWolf
WRONG_SUBMISSION
Challenge #12

09:17:24
ADMIN
UNLOCKED
Challenge #19
```

Logs should include:

```text
Timestamp
Actor
Action
Resource
Resource ID
Result
IP / Session information where appropriate
Metadata
```

---

# 16. 📈 Analytics

The admin platform should provide live and post-event analytics.

### Event Analytics

- Registered participants
- Active participants
- Total solves
- Average score
- Score distribution
- Completion rate
- Average time used

### Challenge Analytics

- Total attempts
- Successful solves
- Failed attempts
- Success rate
- Average solve time
- Hint usage
- Difficulty performance

### Participant Analytics

- Score progression
- Challenges solved
- Time used
- Hint usage
- Submission history
- Investigation progress

---

# 17. 🔌 Backend API

The backend should expose versioned APIs.

Base path:

```text
/api/v1
```

### Authentication

```text
POST   /auth/register
POST   /auth/login
POST   /auth/logout
GET    /auth/me
```

### Participant

```text
GET    /participant/profile
GET    /participant/progress
GET    /participant/score
GET    /participant/challenges
GET    /participant/evidence
```

### Challenges

```text
GET    /challenges
GET    /challenges/{id}
POST   /challenges/{id}/submit
POST   /challenges/{id}/hint
```

### Leaderboard

```text
GET    /leaderboard
GET    /leaderboard/me
```

### Event

```text
GET    /event
GET    /event/status
```

### Admin

```text
GET    /admin/participants
GET    /admin/participants/{id}

POST   /admin/challenges
PUT    /admin/challenges/{id}
DELETE /admin/challenges/{id}

POST   /admin/event/start
POST   /admin/event/pause
POST   /admin/event/resume
POST   /admin/event/extend
POST   /admin/event/end

POST   /admin/announcements
```

These endpoints are an initial architecture. The development team should finalise the API contract before implementation.

---

# 18. 🧰 Recommended Technology Stack

| Component | Technology |
|---|---|
| Participant Frontend | Next.js + TypeScript |
| Admin Frontend | Next.js + TypeScript |
| UI | Tailwind CSS |
| Backend | FastAPI + Python |
| Database | PostgreSQL |
| Cache / Pub-Sub | Redis |
| Real-Time | WebSockets |
| Challenge Isolation | Docker |
| Reverse Proxy | Nginx |
| API Documentation | OpenAPI / Swagger |
| Testing | Pytest + frontend testing framework |
| Version Control | Git + GitHub |

The team may change technologies if there is a strong technical reason, but the overall architecture and API contracts should remain consistent.

---

# 19. 📂 Recommended Repository Structure

```text
CyberHunt/
│
├── frontend/
│   ├── participant/
│   └── admin/
│
├── backend/
│   ├── app/
│   │   ├── api/
│   │   ├── models/
│   │   ├── schemas/
│   │   ├── services/
│   │   ├── repositories/
│   │   ├── core/
│   │   └── websocket/
│   │
│   ├── tests/
│   └── migrations/
│
├── challenges/
│   ├── hidden-clues/
│   ├── password-puzzles/
│   ├── osint/
│   ├── encoding-decoding/
│   ├── web-vulnerabilities/
│   └── digital-forensics/
│
├── infrastructure/
│   ├── docker/
│   ├── nginx/
│   ├── deployment/
│   └── monitoring/
│
├── docs/
│   ├── architecture/
│   ├── api/
│   ├── database/
│   ├── challenges/
│   └── deployment/
│
├── .env.example
├── .gitignore
├── docker-compose.yml
└── README.md
```

---

# 20. 🔒 Security Principles

The following principles are mandatory.

### Never trust the frontend

The backend must be authoritative for:

- Score
- Timer
- Flags
- Challenge unlocks
- Permissions
- Event state

### Never expose flags

Flags must not be present in:

- Frontend source
- Public API responses
- Client-side configuration
- Public repository files

### Isolate challenge infrastructure

Vulnerable challenge environments must be separated from core services.

### Protect secrets

Secrets must be supplied through environment variables or a proper secrets manager.

Never commit:

```text
.env
API keys
Database passwords
JWT secrets
Admin credentials
Challenge flags
Production credentials
```

### Audit important actions

All scoring, administrative and competition-critical operations should be logged.

---

# 21. 🎯 Core Architecture Principle

The platform should be designed around five authoritative systems:

```text
                    CYBERHUNT
                        │
        ┌───────────────┼────────────────┐
        ▼               ▼                ▼
     EVENT           CHALLENGE         SCORING
     ENGINE           ENGINE            ENGINE
        │               │                │
        └───────────────┼────────────────┘
                        ▼
                   PARTICIPANT
                     STATE
                        │
                        ▼
                  LEADERBOARD
```

The **frontend is a presentation layer**.

The backend is responsible for determining:

> **Who the participant is, what they are allowed to access, whether their answer is correct, how many points they receive, what they have unlocked, how much time remains, and where they rank.**

This should be the foundation of the CyberHunt platform.

---

# 🚀 Development Roadmap

## Phase 1 — Foundation

- Repository setup
- Frontend setup
- Backend setup
- PostgreSQL
- Redis
- Authentication
- User roles
- Docker development environment

## Phase 2 — Participant Platform

- Participant dashboard
- Event timer
- Challenge listing
- Challenge page
- Submission system
- Scoring
- Progress tracking

## Phase 3 — Admin Platform

- Admin authentication
- Control center
- Participant management
- Challenge management
- Submission monitoring
- Event controls
- Leaderboard

## Phase 4 — Real-Time Features

- WebSockets
- Live leaderboard
- Live score updates
- Timer synchronisation
- Announcements
- Live activity feed

## Phase 5 — CyberHunt Investigation Layer

- Interconnected challenges
- Challenge dependencies
- Evidence system
- Clue progression
- Hint system
- Investigation dashboard

## Phase 6 — Challenge Infrastructure

- Docker-based challenge services
- Web vulnerability environments
- Forensics resources
- Challenge file storage
- Network isolation
- Challenge monitoring

## Phase 7 — Testing & Deployment

- Security audit
- Load testing
- Full event simulation
- Backup/recovery testing
- Monitoring
- Production deployment

---

# 🧪 MVP Definition of Done

The first working version is considered complete when a participant can:

```text
Register
   ↓
Login
   ↓
Enter Event
   ↓
Start 120-minute Timer
   ↓
View Challenge
   ↓
Submit Correct Flag
   ↓
Receive Score
   ↓
Progress / Unlock Updates
   ↓
Rank Updates
   ↓
Use Hint
   ↓
Continue Investigation
   ↓
Finish Event
   ↓
View Final Rank
```

And an admin can:

```text
Login
   ↓
View Control Center
   ↓
Start Event
   ↓
Monitor Participants
   ↓
Monitor Submissions
   ↓
Control Challenges
   ↓
Control Timer
   ↓
Send Announcements
   ↓
Monitor Leaderboard
   ↓
End Event
   ↓
View Results & Analytics
```

---

# 🤝 Team Development Guidelines

## Git Branching

Recommended:

```text
main
│
├── develop
│
├── feature/auth
├── feature/participant-dashboard
├── feature/challenge-engine
├── feature/scoring
├── feature/leaderboard
├── feature/admin-dashboard
├── feature/event-engine
└── feature/websocket
```

Do not push directly to `main`.

---

## Pull Requests

Every PR should include:

- What was changed
- Why it was changed
- Screenshots for UI changes
- API changes
- Database changes
- Testing performed

---

## Commit Format

Use meaningful commits:

```text
feat: add participant authentication
feat: implement challenge submission
feat: add live leaderboard
feat: implement event timer

fix: prevent duplicate flag submission
fix: correct leaderboard tie-breaking

refactor: separate scoring service
docs: update API documentation
```

---

# ⚠️ Important Development Rules

### 1. Never trust the frontend

The backend must be authoritative for:

- Score
- Timer
- Flags
- Challenge unlocks
- Permissions
- Event state

### 2. Never expose flags

Flags must never be present in:

- Frontend JavaScript
- Public API responses
- Client-side configuration
- Git history

### 3. Never connect challenge containers directly to the core database

Challenge environments must remain isolated.

### 4. Keep scoring deterministic

Given the same event state and submissions, the backend should always produce the same ranking.

### 5. Log important actions

Every important event should be auditable.

---

# 📚 Documentation

Technical documentation should be maintained inside:

```text
/docs
```

Recommended:

```text
docs/
├── architecture/
│   └── system-design.md
│
├── api/
│   └── api-reference.md
│
├── database/
│   └── schema.md
│
├── challenges/
│   └── challenge-development.md
│
└── deployment/
    └── deployment.md
```

---

# 🧭 First Tasks for the Development Team

Before building individual features, complete these in order:

### 1. Finalise Architecture

Agree on:

- Frontend framework
- Backend framework
- Database
- Redis
- WebSocket architecture
- Deployment strategy

### 2. Design Database Schema

Define:

- Users
- Participants
- Events
- Challenges
- Dependencies
- Submissions
- Scores
- Hints
- Evidence
- Logs

### 3. Define API Contracts

Document all participant and admin APIs.

### 4. Build Authentication

Implement:

- Participant login
- Admin login
- Roles
- Sessions
- Authorization

### 5. Build Event Engine

Implement:

- Event states
- 120-minute timer
- Start/pause/resume
- Event ending

### 6. Build Challenge Engine

Implement:

- Challenge CRUD
- Dependencies
- Unlocking
- Flag validation
- Submissions

### 7. Build Scoring Engine

Implement:

- Point allocation
- Hint deductions
- Ranking
- Tie-breaking

### 8. Build Leaderboard

Start with REST polling if necessary, then move to WebSockets.

### 9. Build Admin Control Center

Connect the admin interface to all event controls.

### 10. Integrate Real Challenges

Only after the core platform is stable should the isolated cybersecurity challenge environments be connected.

---

# 🎯 Final Product Vision

CyberHunt should ultimately feel like:

```text
                 ┌─────────────────────┐
                 │    INCIDENT         │
                 │    BRIEFING         │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │   INVESTIGATION     │
                 │     DASHBOARD       │
                 └──────────┬──────────┘
                            │
             ┌──────────────┼──────────────┐
             ▼              ▼              ▼
          CHALLENGE       EVIDENCE       RANK
             │              │              │
             └──────────────┼──────────────┘
                            ▼
                     NEW CLUES FOUND
                            │
                            ▼
                  MORE CHALLENGES UNLOCK
                            │
                            ▼
                   ATTACKER IDENTIFIED
                            │
                            ▼
                      EVENT ENDS
                            │
                            ▼
                   FINAL LEADERBOARD
```

The goal is **not simply to build a CTF website**.

The goal is to build a **real-time, story-driven cybersecurity investigation platform** where the challenges, clues, scoring, timing and leaderboard all work together to create the CyberHunt experience.
