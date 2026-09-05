# Aetheria: Echa Upadku — Game Design Overview

## High concept

Aetheria is a cooperative survival-action RPG built around expedition risk. Teams enter unstable anomaly zones, adapt to a changing environment, recover resources, and decide when to extract. The experience is built to make communication and coordinated decisions materially more valuable than individual damage output.

## Core loop

```text
SOCIAL HUB
   ↓
FORM SQUAD
   ↓
PREPARE LOADOUT / OBJECTIVE
   ↓
ENTER ANOMALY
   ↓
SCOUT → EXPLORE → FIGHT → RECOVER
   ↑                     ↓
   └──── DIRECTOR AI ────┘
                         ↓
                   EXTRACTION DECISION
                    ↙             ↘
                EXTRACT          PUSH DEEPER
                   ↓                 ↓
              REWARDS / PROGRESSION / NEW RUN
                         ↓
                    SOCIAL HUB
```

## Player roles

Roles are soft rather than hard classes. A player can bring a preferred function—recon, support, control, damage, recovery, or extraction—but the system should remain playable when the squad is imperfectly composed.

## Social design

The social layer is part of progression:

- squad formation;
- shared preparation;
- visible expedition results;
- social hub activities;
- collaborative upgrades;
- cosmetic expression using supported Roblox avatar identity;
- shared decision-making around extraction risk.

## Director AI gameplay philosophy

The Director is an invisible game-system operator. Its job is to produce tension, adaptation, and replayability without overriding player agency.

The Director should obey the following rules:

1. Never create an unavoidable loss state from an AI-only decision.
2. Never manipulate rewards outside the validated economy system.
3. Never invent arbitrary entities or abilities that are not part of the approved content library.
4. Never punish an individual player for personal conversation content.
5. Never remove a player's ability to understand why an in-game event occurred when transparency is needed for fairness.
6. Always have a deterministic fallback.

## Expedition variables

The procedural layer may vary:

- route availability;
- encounter composition;
- environmental hazards;
- resource scarcity;
- extraction timing pressure;
- optional objectives;
- environmental ambience;
- recovery opportunities.

## Progression

The progression system prioritizes long-term mastery over raw power inflation. Candidate progression axes include:

- account-level expedition mastery;
- unlockable equipment configurations;
- cosmetic progression;
- hub upgrades;
- challenge records;
- seasonal or rotating objectives.

Any progression system should be designed so that monetization does not create an unavoidable competitive advantage.

## Monetization principles

The baseline proposition is free-to-play with optional purchases. Roblox currently provides passes, developer products, subscriptions, private servers, advertising, avatar items, and other monetization mechanisms. citeturn516321search8

The design prioritizes:

- cosmetics;
- personalization;
- optional convenience;
- private social spaces where supported;
- recurring subscription benefits that do not invalidate non-paying players.

## First-session objective

The first session should teach the complete proposition rather than only movement and combat. Within a short onboarding period, a player should experience:

1. meeting a squad;
2. entering an expedition;
3. seeing the environment react to squad behavior;
4. making an extraction-risk decision;
5. returning to the hub with visible consequences.

## Vertical-slice content target

The first production slice should deliberately remain small:

- one hub;
- one anomaly biome;
- one complete mission archetype;
- one enemy family;
- one boss/elite encounter or equivalent climax;
- one extraction system;
- one progression branch;
- one monetization placeholder;
- one Director AI scenario matrix;
- one mobile optimization target.

This is the minimum demonstration needed to prove the design thesis before expanding content volume.
