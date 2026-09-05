# Aetheria Vertical Slice

## Purpose
This prototype is the grant-facing proof of the project's core thesis. It demonstrates a complete multiplayer expedition loop using Roblox-native authoritative server logic and a replaceable Director AI adapter.

## Demonstrated loop

1. Players enter the social hub.
2. An expedition is started.
3. Connected players are grouped into a squad.
4. The server creates a bounded anomaly mission.
5. A Director selects from validated gameplay interventions.
6. Encounters and environmental pressure change during the mission.
7. Players reach extraction.
8. The squad returns to the hub with reward/progression state.

## Important architecture principle

The prototype does not depend on an experimental Roblox Reality renderer or an external AI provider to remain playable. The Director AI is an adapter around a deterministic decision engine. This proves that the gameplay thesis survives provider outage, latency, API change, and experimental-feature availability.

## Roblox Studio setup

Create a new Roblox experience and add:

- `prototype/roblox/ServerScriptService/AetheriaPrototype.server.lua` as a Script in `ServerScriptService`.
- `prototype/roblox/ReplicatedStorage/AetheriaPrototype.client.lua` as a LocalScript in `StarterPlayer > StarterPlayerScripts`.

For the first test, use Roblox Studio's local multiplayer test with 4 players.

## What to record for the grant package

Capture a 90–150 second video showing:

- 4 connected players in the hub;
- expedition start;
- squad state panel;
- at least three Director decisions;
- one AI-disabled/fallback event;
- extraction;
- return to hub.

## Acceptance criteria

The slice is considered successful when all six criteria are demonstrated:

- multiplayer session is stable;
- mission state remains server-authoritative;
- Director actions are schema/allow-list constrained;
- deterministic fallback works with Director unavailable;
- mission can be completed end-to-end;
- instrumentation exposes the key events needed for milestone evidence.
