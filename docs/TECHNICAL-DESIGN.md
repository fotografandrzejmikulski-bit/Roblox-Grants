# Aetheria: Echa Upadku — Technical Design

## Architecture objectives

The technical architecture is designed around five constraints:

1. Roblox server authority over game state.
2. Graceful operation when AI services are unavailable, delayed, rate-limited, or changed.
3. Strict separation between player-facing communication and system-level AI orchestration.
4. Cross-platform performance, with mobile considered a first-class target.
5. Measurable, testable interfaces so grant milestones can be independently demonstrated.

## System layers

### Layer 1 — Authoritative simulation

The Roblox server owns:

- player state;
- mission state;
- enemy state;
- inventory and rewards;
- encounter spawning;
- navigation and extraction rules;
- damage and progression;
- anti-cheat validation.

No AI response can directly mutate arbitrary server state.

### Layer 2 — Deterministic gameplay systems

Core systems are expressed as deterministic modules with explicit inputs and outputs:

- Encounter Director;
- Spawn Controller;
- Environmental Event Controller;
- Resource Economy;
- Mission State Machine;
- Squad State Aggregator;
- Extraction Controller.

### Layer 3 — AI orchestration adapter

An abstraction layer isolates Roblox AI capabilities from the game logic:

```text
DirectorAI.request(snapshot)
        |
        +--> policy / schema validation
        |
        +--> provider adapter
        |
        +--> timeout / retry / fallback
        |
        +--> validated DirectorAction
```

The application should never couple core gameplay to a single experimental API name or undocumented service contract.

### Layer 4 — Approved action library

The AI may select only predefined actions, for example:

- `SpawnEncounter` with approved enemy types and counts;
- `SetWeatherProfile` from an allow-list;
- `CloseRoute` for predefined route segments;
- `OpenResourceCache` at approved locations;
- `StartExtractionPressure` with bounded intensity;
- `TriggerAmbientEvent` from approved events.

Each action contains hard limits, cooldowns, validation rules, and rollback behavior.

### Layer 5 — Presentation

Visual effects, audio, UI, animation, camera presentation, and social-hub systems consume authoritative game state. Presentation never changes the underlying truth of the simulation.

## Director AI

### Input contract

The Director receives a compact game-state snapshot. The snapshot should exclude unnecessary personal data and free-form player text unless a specific, approved feature requires it.

Suggested features:

- mission phase;
- squad size;
- average and variance of player health;
- squad separation;
- recent encounter intensity;
- current resource pressure;
- extraction proximity;
- mission timer;
- failed/successful objectives;
- environmental state;
- difficulty budget remaining.

### Output contract

The output is structured and schema-validated:

```json
{
  "action": "SpawnEncounter",
  "parameters": {
    "encounterType": "swarm",
    "intensity": 0.55,
    "locationId": "zone_03_anchor_b"
  },
  "reasonCode": "RESOURCE_PRESSURE_HIGH",
  "ttlSeconds": 30
}
```

The exact implementation format is illustrative; the final production schema must match the capabilities of the selected, currently supported Roblox integration.

## Failure behavior

AI failure must never equal gameplay failure.

When AI is unavailable:

1. the request times out;
2. the server rejects incomplete or malformed output;
3. a deterministic fallback policy selects an approved action;
4. the mission continues;
5. an operational metric records the fallback event.

This architecture ensures that network latency, provider changes, or rate limits do not make the game unplayable.

## Multiplayer networking

The game will use server-authoritative replication and explicit bandwidth budgets. High-frequency data is sampled and aggregated before use by the Director. Cosmetic presentation data is kept separate from simulation-critical state.

Performance targets will be defined by device tiers rather than a single headline FPS figure:

- Tier A: high-end desktop / console;
- Tier B: mainstream desktop / current-generation mobile;
- Tier C: constrained supported mobile devices.

The final targets will be established from prototype benchmarks and validated continuously.

## Mobile-first performance methodology

Every production milestone includes:

- memory profiling;
- frame-time profiling;
- network replication measurements;
- instance and asset-count budgets;
- script execution profiling;
- streaming tests;
- cold-start and rejoin tests;
- long-session stability tests.

The project will not rely on an assumed platform-side renderer or world-model feature to meet its minimum playable-performance requirement.

## Avatar identity and social hub

Avatar identity is treated as a separate subsystem from combat readability. The social hub can provide richer cosmetic representation, while combat scenes enforce silhouette and readability constraints. Current Roblox platform documentation confirms support for avatar items and related monetization pathways; the final implementation will use supported Roblox APIs and current policy requirements. citeturn516321search8

## AI safety controls

- allow-listed actions only;
- JSON/schema validation;
- parameter range checks;
- per-player and per-server rate limits;
- action cooldowns;
- timeout handling;
- fallback policies;
- observability without retaining unnecessary personal data;
- moderation and content review for any player-facing generated material;
- explicit kill-switch for AI orchestration.

## Experimental technology policy

Roblox officially describes a 2026 Roblox Reality initiative involving Morpheus AI, Dynamics Lab, and Lucid AI, including Self Forcing research toward playable photorealistic world models. citeturn254589search5

Because availability, integration surfaces, performance characteristics, and commercial access can change, Aetheria treats Roblox Reality-related functionality as an **optional acceleration layer**, not as a hard dependency for the core gameplay loop.

## Acceptance tests for the vertical slice

The grant-facing vertical slice should demonstrate:

- 4–6 connected players in one mission instance;
- complete expedition loop from hub to extraction;
- at least three dynamically selected encounter outcomes;
- Director fallback operation with the AI service disabled;
- server authority against invalid client actions;
- repeatable automated test scenario;
- profiled performance on representative mobile hardware;
- functioning avatar identity presentation in the social hub;
- monetization hooks present behind feature flags and disabled during controlled technical testing.

## Technical risks

| Risk | Impact | Mitigation |
|---|---|---|
| AI API changes | High | Adapter interface + feature flags |
| AI latency | High | Async orchestration + fallback policies |
| AI output invalidity | High | Strict schema validation |
| Mobile performance | High | Tiered budgets + continuous profiling |
| Network instability | High | Server-authoritative state + prediction only where safe |
| Platform policy changes | High | Compliance owner + source register |
| Asset production cost | Medium | Reuse, procedural systems, tightly scoped environments |
| Scope growth | High | Vertical-slice gate before full production |
