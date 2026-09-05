# Aetheria: Echa Upadku — AI Safety & Compliance

## Scope

This document defines the minimum control framework for AI-assisted systems in Aetheria. It is intentionally stricter than a simple API integration plan because grant reviewers need evidence that AI is a controlled production system rather than an experimental black box.

## Design principles

### 1. Server authority

AI suggestions are advisory. Roblox server logic remains authoritative for health, damage, inventory, rewards, progression, mission state, and spawn permissions.

### 2. Allow-list execution

Only pre-registered action types may be executed. Every parameter is validated against a typed schema and hard range limits.

### 3. No unrestricted conversational dependency

The core game loop does not require unrestricted player-to-AI conversation. Player-facing generated text, when used at all, is treated as a separately reviewed feature with its own moderation and maturity analysis.

### 4. Data minimization

The Director receives only the game-state attributes required for its decision. Personal identifiers, private communications, and unnecessary raw telemetry are excluded.

### 5. Failure is expected

The AI service may be unavailable. The game must remain playable through deterministic fallback logic.

## Data flow

```text
Authoritative Server
      |
      | bounded state snapshot
      v
DirectorAI Adapter
      |
      | validated request
      v
AI Service / Roblox-supported AI capability
      |
      | structured response
      v
Schema Validator
      |
      +---- invalid ---> deterministic fallback
      |
      v
Action Policy Engine
      |
      +---- disallowed ---> reject + fallback
      |
      v
Authoritative Gameplay System
```

## Security controls

- server-only execution of privileged actions;
- strict input/output schemas;
- maximum action intensity;
- cooldowns;
- rate limits;
- timeout budgets;
- replay protection for action IDs;
- audit events without unnecessary personal data;
- feature flags;
- emergency AI kill switch;
- deterministic fallback tables.

## Content maturity

Roblox currently requires accurate maturity information and maps maturity labels to age-based access. Restricted experiences are limited to verified 18+ users. Experiences intended to reach younger account categories have additional publication and evaluation requirements. citeturn254589search1turn254589search2turn254589search3

Aetheria will therefore:

- avoid designing its entire distribution strategy around a presumed rating;
- document every material AI/player interaction;
- complete the current Maturity & Compliance questionnaire accurately;
- remove or redesign features that would create an unnecessary access restriction;
- re-check requirements before each public milestone.

## Moderation

Any generated player-facing content must pass through the platform capabilities and project-level controls appropriate to the current Roblox policy. Generated content that cannot be confidently moderated is not part of the production baseline.

## Privacy

The project will maintain a data inventory covering:

- data collected;
- purpose;
- retention period;
- access controls;
- deletion process;
- third-party processing where applicable.

No privacy-sensitive feature enters production without an explicit data-flow review.

## Compliance evidence

For each release candidate, the team should archive:

- current source links;
- screenshots of relevant Creator Dashboard settings;
- completed maturity/compliance questionnaire evidence where appropriate;
- AI feature inventory;
- data-flow diagram;
- test reports;
- moderation test cases;
- failure/fallback test results.

## Current-source discipline

Roblox's current documentation is the authority for platform policy. Historical Game Fund announcements provide context but do not override current platform rules. This project therefore avoids asserting historical funding rules, legacy API behavior, or undocumented thresholds as current policy.
