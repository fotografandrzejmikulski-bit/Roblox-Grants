# Grant Application — Aetheria: Echa Upadku

## Applicant

**Andrzej Mikulski**  
Independent/private applicant  
Poland

## Project

**Aetheria: Echa Upadku**

**Category:** Cooperative multiplayer Survival-Action-RPG  
**Platform:** Roblox  
**Target:** Older Roblox players seeking deeper cooperative, systemic experiences  
**Development model:** Milestone-driven, prototype-first, mobile-first

---

## 1. Executive request

We are seeking support to transform Aetheria: Echa Upadku from a validated vertical-slice concept into a production-ready Roblox experience.

Aetheria is built around one clear thesis: Roblox can support sophisticated cooperative experiences in which social coordination and adaptive systems are central to gameplay, while the underlying game state remains deterministic, safe, measurable, and scalable.

The requested funding should be agreed with Roblox against the active program or partnership terms applicable at the time of submission. We deliberately do not anchor this application to an unverified historical funding ceiling.

---

## 2. The opportunity

Roblox has publicly pursued ambitious, technically differentiated games that expand what is possible on the platform. The historical Game Fund explicitly prioritized innovative gameplay, ambitious visual design, multiplayer and cross-platform experiences with mobile optimization, fundamental social mechanics, platform-identity avatars, and use of Avatar Shop items. It also requested team information, a project description, pitch deck, milestone schedule and budget. citeturn994487search0turn994487search2

In 2026, Roblox has continued to invest in new forms of game creation and high-fidelity interactive technology. Roblox Reality is described by Roblox as a hybrid architecture combining structured multiplayer simulation with edge-based video world models to increase visual fidelity. Roblox has also described the Morpheus AI, Dynamics Lab and Lucid AI work contributing to this direction. citeturn994487search10turn994487search1

Aetheria is designed to benefit from this trajectory without making an experimental platform feature a hard production dependency.

---

## 3. The game

Aetheria is a cooperative 4–6 player expedition game set in unstable anomaly zones.

Players operate from a social hub, assemble a squad, enter an expedition, manage resources and combat pressure, adapt to changing routes and environmental conditions, and extract successfully to progress.

The design emphasizes:

- teamwork instead of solo optimization;
- systemic replayability instead of linear content repetition;
- meaningful extraction decisions;
- strong platform-avatar identity in social spaces;
- readable combat and performance across device tiers;
- controlled AI intervention rather than unrestricted AI conversation.

---

## 4. The differentiator: Director AI

The project's signature system is the **Director**.

The Director is not a chatbot. It is a bounded gameplay orchestration layer.

It receives a compact snapshot of the current game state, evaluates variables such as mission phase, squad condition, separation, resource pressure, encounter history and extraction proximity, and selects an intervention from an allow-listed library.

Example interventions include:

- spawning a bounded encounter;
- changing a weather profile;
- closing a predefined route;
- opening a resource cache;
- increasing bounded extraction pressure.

The authoritative Roblox server validates and executes the resulting action. An AI service can therefore influence pacing without receiving arbitrary authority over the simulation.

Roblox currently documents a native `TextGenerator` with `GenerateTextAsync()`, which makes controlled text-generation integrations technically possible. The production implementation will use only the APIs and policies confirmed for the actual production environment. citeturn752627search2

---

## 5. Prototype proof

A functional vertical-slice prototype has been added to the project repository.

It demonstrates:

1. a social-hub state;
2. expedition start;
3. server-authoritative mission state;
4. repeated Director interventions;
5. strict allow-list validation;
6. explicit AI-outage simulation;
7. deterministic fallback operation;
8. extraction;
9. return to the hub;
10. instrumentation of the major state transitions.

This proves the most important architectural claim before production-scale investment: **AI can enrich the game loop without becoming a single point of failure or a source of unrestricted server authority.**

The prototype is intentionally lightweight. It is evidence of the gameplay/control architecture, not a claim of final visual quality.

---

## 6. Why Roblox

Aetheria is designed for Roblox rather than merely being ported to Roblox.

The experience makes Roblox strengths part of the product itself:

- persistent online social interaction;
- multi-device access;
- avatar identity;
- platform-native commerce;
- creator and player ecosystem;
- rapid live-ops iteration.

Roblox documents multiple native monetization mechanisms, including passes, developer products, subscriptions, private servers, paid access, avatar items and Creator Rewards. citeturn752627search1turn752627search4

---

## 7. Audience

The primary design audience is older Roblox players who want more sophisticated cooperative gameplay while retaining the social identity and accessibility of the Roblox platform.

The project will not assume a specific age classification before Roblox's current review requirements are applied. Content maturity, communication features, AI behavior, asset content and distribution will be submitted and managed according to the platform's current policies. Roblox's current content-maturity system links experience distribution to declared content and regional/age policies. citeturn994487search13turn994487search9

---

## 8. Production strategy

The project follows a vertical-slice-first strategy.

### Stage 1 — Prototype proof

Validate multiplayer state, the Director loop, fallback behavior, extraction, basic progression, and device-tier performance.

### Stage 2 — Vertical slice

Deliver one polished expedition environment, representative enemies, social hub, avatar identity presentation, mission progression, and the first production-quality Director scenarios.

### Stage 3 — Expanded production

Add additional environments, encounter families, progression depth, economy, live-ops instrumentation and content pipeline.

### Stage 4 — Test and launch

Run structured playtests, measure retention and session quality, tune the economy, validate performance, complete moderation/compliance checks and prepare the launch build.

---

## 9. Technical architecture

The server owns gameplay truth.

The architecture is divided into:

- authoritative simulation;
- deterministic gameplay modules;
- replaceable AI integration;
- allow-listed Director actions;
- presentation and social systems.

The project deliberately avoids a hard dependency on experimental Roblox Reality features. Roblox Reality-related systems are treated as an acceleration layer that may increase fidelity as access and production suitability mature. Roblox currently describes Roblox Reality as an early-stage hybrid architecture, with an early version targeted for late 2026 or early 2027. citeturn994487search10

Roblox's current `GenerationService:GenerateModelAsync()` can generate structured multi-mesh geometry from text/image inputs, including functional model schemas. Aetheria can use such capabilities selectively for approved content-generation workflows, subject to production availability, safety and performance testing. citeturn994487search5turn994487search7

---

## 10. Safety and trust

Safety is a product requirement, not a post-production patch.

The Director architecture enforces:

- no arbitrary code execution from model output;
- allow-listed actions;
- schema validation;
- hard parameter limits;
- cooldowns;
- rate limits;
- timeouts;
- deterministic fallback;
- kill-switch capability;
- minimal telemetry collection;
- moderation of any player-facing generated content.

Any persistent player data will be stored only through approved systems and only when necessary. Roblox documents DataStoreService for persistent gameplay data and emphasizes separation of testing and production data environments. citeturn752627search3

---

## 11. Monetization

Aetheria will use platform-native monetization with an emphasis on fairness and player trust.

Primary candidates are:

- cosmetic items;
- developer products for bounded convenience;
- subscriptions offering optional recurring benefits;
- private servers;
- avatar-linked items;
- Creator Rewards where eligible.

The game will avoid monetization that undermines the cooperative progression loop.

Roblox documents passes, subscriptions, developer products, private servers, avatar items and Creator Rewards as current monetization routes. citeturn752627search1

DevEx is treated as creator economics rather than a player-facing monetization feature. Roblox currently documents a standard exchange rate of $0.0038 per Earned Robux and a minimum of 30,000 Earned Robux for eligible cash-out. citeturn752627search5

---

## 12. Milestones

### Milestone 1 — Technical foundation

**Deliverables:** multiplayer core, server authority, basic mission state machine, prototype evidence, initial performance budget.

**Acceptance:** 4-player controlled test completes an expedition loop without critical state errors.

### Milestone 2 — Production vertical slice

**Deliverables:** one polished environment, combat encounter family, social hub, avatar identity presentation, Director scenarios, fallback path.

**Acceptance:** recorded playable vertical slice with repeatable outcomes and measurable system behavior.

### Milestone 3 — Content and progression

**Deliverables:** expanded encounter library, progression, economy, live metrics, additional mission content.

**Acceptance:** external playtest cohort demonstrates repeat-session engagement and stable performance.

### Milestone 4 — Scale and launch readiness

**Deliverables:** mobile optimization, stress tests, moderation/compliance, monetization tuning, launch candidate.

**Acceptance:** platform review package and release candidate satisfy agreed technical and product criteria.

### Milestone 5 — Commercial launch

**Deliverables:** launch build, acquisition assets, live-ops plan, analytics dashboards, post-launch roadmap.

**Acceptance:** production launch and first post-launch operating review.

---

## 13. Budget request

The project will use a bottom-up cost model rather than claiming a fixed historical Game Fund ceiling.

The requested amount should cover:

- core engineering;
- AI/technical systems;
- game design and production;
- 3D art and animation;
- UX/UI;
- QA and device testing;
- legal and accounting;
- infrastructure and software;
- launch and user acquisition;
- contingency.

A detailed cost model is included separately in `finance/BUDGET.md` and will be reconciled to the final Roblox funding instrument before submission.

---

## 14. Team and operating model

The project is being originated and led by **Andrzej Mikulski**.

The operating model is designed around a lean senior technical core supplemented by specialized game-development, art, QA and production capacity as milestones justify each addition.

The final submission will distinguish current confirmed contributors from planned hires/contractors and will not represent planned personnel as already retained.

---

## 15. Why this project deserves support

Aetheria is not simply an AI-themed Roblox game.

Its central proposition is a measurable game-system innovation: a multiplayer expedition loop whose pacing and risk profile can adapt dynamically while remaining bounded, testable and deterministic at the simulation layer.

That makes the project useful on three levels:

**For players:** deeper cooperative replayability and meaningful social coordination.

**For Roblox:** evidence that sophisticated systemic design, platform identity and new AI/visual technologies can be combined without sacrificing control and reliability.

**For the development ecosystem:** a reusable pattern for safe AI-assisted orchestration in multiplayer experiences.

---

## 16. Funding and partnership request

We request an opportunity to present Aetheria and the completed vertical slice to the appropriate Roblox funding, incubation or creator-partnership team and to align the project with the active 2026 program available to eligible teams.

We are prepared to provide the playable prototype, technical documentation, milestone plan, budget, applicant information, product roadmap and supporting evidence required for formal evaluation.

The project is intentionally structured to begin with demonstrable proof, progress through measurable milestones, and preserve a viable production path even if an experimental platform capability changes during development.

---

## 17. Contact

**Andrzej Mikulski**  
Phone: +48 455 575 337  
Email: mojealterego21@gmail.com

Project repository:

`https://github.com/fotografandrzejmikulski-bit/Roblox-Grants`
