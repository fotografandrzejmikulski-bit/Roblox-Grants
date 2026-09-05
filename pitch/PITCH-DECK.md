# Aetheria: Echa Upadku — Pitch Deck Master Copy

## Slide 1 — Aetheria: Echa Upadku

**A cooperative survival-action RPG where the world adapts to the squad.**

Four to six players enter unstable anomaly zones, improvise under pressure, and decide how far to push before extraction.

**Core promise:** every expedition is systemic, social, and replayable.

---

## Slide 2 — The Opportunity

Roblox supports a large global audience and current documentation describes distribution across iOS, Android, Windows, Mac, Xbox, PlayStation, Chromebook, and selected VR hardware. Roblox also currently documents multiple creator monetization systems. citeturn516321search4turn516321search8

The historical Game Fund explicitly sought ambitious, innovative, multiplayer and cross-platform experiences with mobile optimization, social mechanics, platform-avatar identity, and Avatar Shop integration. citeturn723596search0

**Opportunity:** build a premium-feeling systemic multiplayer experience specifically for the Roblox ecosystem rather than simply porting a conventional game loop.

---

## Slide 3 — The Player Need

Many multiplayer experiences can be replayed indefinitely, but replayability often comes from repeating the same authored encounters.

Aetheria makes the **state of the squad** part of the content generator.

Players should ask:

> "What is the world going to do to us this time?"

not:

> "Which scripted room comes next?"

---

## Slide 4 — The Game

**Genre:** Cooperative Survival-Action RPG

**Squad:** 4–6 players

**Structure:** Social hub → expedition → extraction → progression → repeat

**Camera:** first-person during combat; third-person presentation in social/cosmetic contexts where useful.

**Audience:** target 16+, subject to Roblox's current age, maturity, and publishing rules.

Roblox currently maps maturity labels to age-based account categories; Restricted experiences are limited to age-verified 18+ users. Final classification will be determined through the current Roblox process, not assumed in advance. citeturn254589search1

---

## Slide 5 — Core Loop

1. Assemble a squad.
2. Prepare loadouts and objective.
3. Enter an anomaly zone.
4. Scout and communicate.
5. Fight and recover resources.
6. React to changing conditions.
7. Decide whether to extract or push deeper.
8. Return with rewards and consequences.
9. Upgrade the hub and prepare the next run.

**Design rule:** the decision to extract should be emotionally and economically meaningful.

---

## Slide 6 — The Differentiator: Director AI

Aetheria uses AI as an **orchestration system**, not as a novelty chatbot.

The Director evaluates bounded game-state signals and chooses among validated gameplay actions.

Examples:

- alter encounter intensity;
- change route pressure;
- introduce an approved environmental event;
- open or relocate an approved resource opportunity;
- change extraction pressure.

The AI cannot execute arbitrary code, invent unrestricted gameplay objects, or become the sole authority over the simulation.

---

## Slide 7 — Why This Is Technically Credible

The architecture separates:

**Authoritative simulation → deterministic systems → AI adapter → validated action library → presentation**

This makes the AI replaceable, testable, and safe.

When an AI service fails, the game falls back to deterministic rules and continues operating.

**Investment thesis:** fund the gameplay system first; use emerging AI capabilities as acceleration rather than as a single point of failure.

---

## Slide 8 — Visual & Technical Ambition

Roblox's 2026 corporate announcements describe the Roblox Reality initiative and the addition of technology and expertise from Morpheus AI, Dynamics Lab, and Lucid AI, including Self Forcing research aimed at responsive playable world models. citeturn254589search5

Aetheria will design for this direction while avoiding a hard dependency on any experimental renderer or unreleased creator-facing capability.

**Result:** the project can benefit from platform innovation without making a grant-funded production promise that depends on an undocumented API.

---

## Slide 9 — Social + Platform Identity

The social layer is not a lobby glued onto the game.

It is where players:

- form squads;
- compare expedition results;
- configure their next run;
- progress their shared hub;
- express Roblox avatar identity;
- return between expeditions.

The historical Game Fund criteria specifically prioritized social mechanics, platform identity, and Avatar Shop items. citeturn723596search0

---

## Slide 10 — Mobile-First Engineering

Mobile is a design constraint from day one.

We measure:

- frame-time;
- memory;
- network traffic;
- script cost;
- streaming behavior;
- long-session stability;
- reconnect behavior.

The first vertical slice must prove the performance strategy before content production scales.

---

## Slide 11 — Business Model

The baseline product is free-to-play.

Current Roblox monetization documentation supports passes, developer products, subscriptions, advertising, avatar items, private servers, paid access and other mechanisms. citeturn516321search8

The preferred mix is:

- cosmetic personalization;
- optional convenience;
- subscriptions with non-competitive benefits;
- private/social functionality where appropriate;
- carefully tested developer products.

The monetization model is evaluated by retention impact, not by short-term extraction.

---

## Slide 12 — KPI Framework

The project will optimize against measurable player outcomes:

- D1 / D7 retention;
- median session length;
- expedition completion rate;
- squad completion rate;
- reconnect success;
- critical errors per 1,000 sessions;
- AI fallback rate;
- mobile P95 frame time;
- payer conversion;
- revenue per daily active user after monetization activation.

No single vanity metric determines success.

---

## Slide 13 — Production Plan

**Phase 1:** Foundation and multiplayer architecture

**Phase 2:** Vertical slice and Director AI

**Phase 3:** Content expansion and economy

**Phase 4:** Mobile, QA, security, compliance

**Phase 5:** Launch readiness and controlled release

Every phase has objective acceptance evidence and a defined go/no-go gate.

---

## Slide 14 — The Ask

We are seeking funding to de-risk the development of a technically ambitious, socially native Roblox experience.

The final requested amount will be based on current Roblox Game Fund terms and a bottom-up production budget—not an assumed historical maximum.

**Aetheria is designed to demonstrate that Roblox can support deep, systemic multiplayer game design at high production quality while using AI responsibly and measurably.**

---

## Presenter note — critical factual discipline

Historical Roblox Game Fund announcements establish the original program's focus and application materials, but they do not establish that a 2026 application window or a $500,000–$750,000 funding range is currently available. This distinction must remain visible in the final application until Roblox confirms current terms. citeturn723596search0turn723596search7
