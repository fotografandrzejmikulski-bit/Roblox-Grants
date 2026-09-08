# Aetheria: Echa Upadku
## Grant & Partnership Application — Executive Final

**Applicant:** Andrzej Mikulski  
**Email:** mojealterego21@gmail.com  
**Phone:** +48 455 575 337  
**Country:** Poland  
**Platform:** Roblox

### Executive Proposal

Aetheria: Echa Upadku is a cooperative multiplayer survival-action RPG designed specifically for Roblox. Its central innovation is a bounded **Director system** that dynamically adapts expedition pressure to the live state of a squad while leaving game-state authority, validation, safety, and progression entirely under deterministic server logic.

The project is not positioned as an AI chatbot experience. AI is a controlled orchestration layer that chooses from a predefined action library: encounter selection, environmental pressure, route disruption, resource opportunities, and extraction escalation. Invalid, delayed, unavailable, or experimental AI services cannot directly mutate the game state and are replaced by deterministic fallback policies.

### Player Experience

A squad of 4–6 players begins in a persistent social hub, forms a team, enters an anomaly expedition, manages risk and resources, encounters adaptive events, and attempts extraction before returning with progression.

The design makes cooperation—not optional party formation—the primary mechanic. Players divide responsibilities, react to changing conditions, make collective extraction decisions, and build shared progression.

### Why Roblox

Aetheria is designed for Roblox rather than being a conventional game port. The concept uses platform-native strengths as product features: social multiplayer, avatar identity, cross-device accessibility, platform commerce, creator ecosystem distribution, and rapid live-operations iteration.

The project also aligns with the themes Roblox has historically emphasized through its Game Fund and more recent incubation efforts: novel gameplay, multiplayer/social design, ambitious presentation, multi-device execution, and measurable milestone delivery. Historical program terms are treated as historical context, not current guaranteed funding conditions.

### Technical Thesis

The architecture has five boundaries:

1. **Authoritative simulation** — Roblox server owns health, combat, inventory, mission state, rewards, progression, and action execution.
2. **Deterministic gameplay systems** — state machines, encounter systems, extraction logic, and resource systems remain reproducible.
3. **Director adapter** — AI capability is isolated behind a replaceable interface.
4. **Policy enforcement** — only allow-listed actions with bounded parameters may execute.
5. **Presentation layer** — client presentation consumes authoritative state and cannot rewrite it.

This creates a commercially important property: the game does not become unplayable when an AI provider is unavailable, rate-limited, changed, or removed.

### Prototype Evidence

The repository contains a Roblox Studio vertical-slice implementation intended to demonstrate the architectural thesis. The slice includes:

- social-hub state;
- expedition start;
- multiplayer state tracking;
- Director decisions;
- allow-list validation;
- AI outage simulation;
- deterministic fallback;
- extraction;
- hub reset;
- instrumentation for evidence capture.

The repository separately records what is implemented in source and what still requires runtime evidence from Roblox Studio. No runtime benchmark, public deployment, or external validation is claimed before it has actually been captured.

### Safety and Compliance

Safety is treated as a first-order product requirement. The Director is constrained by:

- server authority;
- allow-listed actions;
- schema/range validation;
- cooldowns and rate limits;
- timeout handling;
- deterministic fallbacks;
- kill-switch capability;
- data minimization;
- moderated handling of any player-facing generated content.

The final content-maturity classification, distribution scope, communication configuration, and AI configuration will follow the Roblox requirements in force at the time of publication and review.

### Production Plan

The project uses a proof-first sequence:

**Phase 1 — Prototype validation:** multiplayer core, state machine, Director/fallback architecture, performance baseline.  
**Phase 2 — Vertical slice:** one polished expedition environment, encounter family, social hub, avatar identity layer, and production-grade Director scenarios.  
**Phase 3 — Expansion:** content families, progression, economy, analytics, and live-ops systems.  
**Phase 4 — Launch readiness:** mobile optimization, stress testing, compliance, moderation, monetization tuning, and release candidate.  
**Phase 5 — Commercial operation:** global launch, acquisition, live operations, and post-launch content.

### Budget Philosophy

The project does not rely on an unverified historical Game Fund ceiling. Funding is requested against a bottom-up production plan, with every major expense tied to a deliverable and milestone. The budget separates personnel, production operations, infrastructure/software, legal/accounting, quality assurance, user acquisition, and contingency.

This approach gives Roblox a clearer basis for evaluating capital efficiency and reduces the risk of a funding request appearing to be reverse-engineered from a headline maximum.

### Commercial Model

Aetheria is designed around platform-native, player-respectful monetization. Primary candidates include cosmetics, optional convenience products, subscriptions, private servers, avatar-linked items, and eligible platform reward systems. Competitive progression will not be designed around compulsory spending.

### Success Metrics

The project will use measurable acceptance criteria rather than vanity milestones. Examples include:

- stable multiplayer session completion;
- Director intervention diversity;
- fallback completion rate;
- server rejection of invalid actions;
- memory/frame-time/network budgets by device tier;
- first-session completion;
- repeat-session engagement;
- social interaction frequency;
- monetization conversion without deterioration of player experience.

Final numerical targets will be set from prototype benchmarks and agreed production requirements rather than invented before evidence exists.

### Funding / Partnership Request

I am requesting an opportunity to present Aetheria: Echa Upadku to the appropriate current Roblox team responsible for funding, incubation, strategic partnerships, or creator support, and to align the project with the program or instrument currently open to an eligible applicant.

I am prepared to provide the prototype, source repository, pitch materials, technical design, milestone plan, financial model, compliance documentation, and applicant information required for formal review.

The intended outcome is a milestone-based partnership in which Roblox can evaluate the project on demonstrated technical execution, product differentiation, platform fit, safety maturity, and measurable commercial potential.

### Applicant

**Andrzej Mikulski**  
mojealterego21@gmail.com  
+48 455 575 337

**Repository:** https://github.com/fotografandrzejmikulski-bit/Roblox-Grants
