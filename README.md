# Aetheria — Roblox Grant Submission Package

**Project:** Aetheria: Echa Upadku  
**Applicant:** Andrzej Mikulski  
**Application posture:** independent/private applicant; final legal entity and contracting status subject to Roblox confirmation  
**Repository purpose:** evidence-backed grant materials, prototype, technical concept, budget model, milestones, compliance plan, and submission package.

## Executive position

Aetheria is a cooperative multiplayer Survival-Action-RPG concept designed around a deterministic Roblox game layer and an AI-assisted Director system. The project is positioned to demonstrate how Roblox can support sophisticated cooperative, socially driven experiences while preserving platform safety, operational control, and scalable production economics.

The project deliberately distinguishes between:

- currently documented Roblox capabilities;
- Roblox technologies publicly described as early-stage / forthcoming;
- project-level prototype evidence;
- assumptions that require confirmation with Roblox.

## Repository package

### Core application

- `docs/GRANT-APPLICATION-FINAL.md` — professional grant application
- `docs/EXECUTIVE-SUMMARY.md` — reviewer-facing summary
- `docs/APPLICANT-PROFILE.md` — applicant presentation
- `docs/GAME-DESIGN.md` — game vision and core loop
- `docs/GO-TO-MARKET.md` — audience and launch strategy

### Technical and evidence package

- `docs/TECHNICAL-DESIGN.md` — authoritative server architecture and Director system
- `docs/AI-SAFETY-AND-COMPLIANCE.md` — AI safety and compliance posture
- `docs/PROTOTYPE-EVIDENCE.md` — reproducible vertical-slice evidence plan
- `prototype/README.md` — Studio setup and test protocol
- `prototype/roblox/ServerScriptService/AetheriaPrototype.server.lua` — functional server prototype
- `prototype/roblox/StarterPlayerScripts/AetheriaPrototype.client.lua` — functional prototype HUD

### Commercial and delivery package

- `finance/BUDGET.md` — bottom-up budget methodology
- `milestones/MILESTONE-PLAN.md` — milestone-driven production plan
- `docs/RISK-REGISTER.md` — risk management
- `docs/SUBMISSION-CHECKLIST.md` — final submission gate
- `research/SOURCE-REGISTER.md` — fact verification and evidence policy

## Current Roblox program position

Roblox's historical Game Fund was launched in 2021 with a stated $25 million pool, and Roblox publicly described project criteria including innovative gameplay, ambitious visuals, multiplayer/cross-platform play, mobile optimization, fundamental social mechanics, platform-avatar identity, and Avatar Shop integration. Roblox also listed a project description, pitch deck, team details, milestone schedule and budget as application materials. This is historical program evidence and must not be represented as proof that the same funding window or terms remain active in 2026. citeturn994487search0turn994487search2

For 2026, Roblox has an active strategic focus on novel games and has operated the Roblox Incubator. The first 2026 Incubator cohort application is closed; Roblox describes the program as six months, milestone-based, and aimed at small experienced teams with strong prototypes or plans to build them. citeturn994487search4turn994487search12

Accordingly, this repository is structured to be usable for a reopened Roblox program, incubator-style opportunity, or direct creator-partnership/funding discussion rather than claiming a nonexistent active Game Fund application link.

## Technology position

Roblox currently documents `TextGenerator:GenerateTextAsync()` for creator-facing text generation and `GenerationService:GenerateModelAsync()` for text/image-conditioned 3D model generation. citeturn752627search2turn994487search5

Roblox also publicly describes Roblox Reality as an early-stage hybrid architecture combining structured simulation with edge-based video world models, with an early version described as targeted for late 2026 or early 2027. Aetheria treats this as an optional acceleration layer and does not depend on it for minimum viability. citeturn994487search10turn994487search1

## Prototype status

A functional grant-facing vertical slice is now included in the repository. It demonstrates:

1. social-hub state;
2. expedition start;
3. server-authoritative mission state;
4. bounded Director actions;
5. allow-list validation;
6. simulated AI outage;
7. deterministic fallback behavior;
8. extraction;
9. return to hub;
10. readable instrumentation for the key transitions.

This is an architectural/gameplay proof, not a claim that final AAA visual production has already been completed.

## Commercial position

The project is designed around Roblox-native monetization pathways. Roblox currently documents passes, developer products, subscriptions, private servers, paid access, avatar items and Creator Rewards. citeturn752627search1turn752627search4

## Submission status

**PACKAGE READY FOR SUBMISSION PREPARATION.**

The narrative, technical architecture, safety posture, prototype, financial methodology and formal application are prepared.

The following two items cannot be honestly fabricated inside GitHub and must be completed by the applicant immediately before transmission:

1. attach the actual Studio-recorded prototype evidence (video/screenshots/build link);
2. use the then-current official Roblox application/partnership route and verify its live eligibility/terms on the day of submission.

No repository document claims Roblox approval, guaranteed funding, or acceptance into a program that is not currently open.
