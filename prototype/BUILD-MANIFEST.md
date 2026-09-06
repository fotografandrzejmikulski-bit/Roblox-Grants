# Aetheria — Vertical Slice Build Manifest

## Build identity

- Project: Aetheria: Echa Upadku
- Prototype channel: Roblox Studio
- Prototype version: VS-0.2.0
- Purpose: grant-facing gameplay/architecture proof
- Status: implementation-ready; runtime verification must be performed in Roblox Studio

## Demonstrated thesis

The vertical slice proves that the core gameplay loop can remain playable and server-authoritative while an adaptive Director layer changes encounter pacing.

## Evidence matrix

| Claim | Implementation evidence | Runtime evidence required |
|---|---|---|
| Server authority | Server Script owns mission state and executes Director actions | Studio multiplayer session |
| Bounded AI | Allow-list + schema/range validation | Studio log showing accepted/rejected actions |
| Graceful AI outage | `SIMULATE_AI_OUTAGE` switches to fallback policy | Video capture of outage and continued mission |
| Replayable Director | State snapshot drives different intervention classes | Multiple Director events in one mission |
| Complete loop | Start → expedition → extraction → hub reset | End-to-end recording |
| Multiplayer | Shared server state + player count | 4-player Studio test |
| Instrumentation | `STATE`, decision, fallback and completion events | Output/HUD capture |

## Studio installation

1. Create a new Baseplate experience.
2. Insert the server file as a `Script` under `ServerScriptService`.
3. Insert the client file as a `LocalScript` under `StarterPlayer > StarterPlayerScripts`.
4. Run **Test > Start** with multiple players (target: 4).
5. Press `START`.
6. Observe Director events and state changes.
7. Press `SIMULATE OUTAGE` and verify `OUTAGE → FALLBACK` while the loop continues.
8. Press `RESTORE AI`.
9. Press `EXTRACT` or allow the mission to complete automatically.

## Grant demonstration sequence

Recommended recording length: 90–150 seconds.

1. Show all four connected players.
2. Start expedition.
3. Show at least three Director interventions.
4. Trigger AI outage.
5. Show deterministic fallback and continued state progression.
6. Restore Director.
7. Extract and show completion.
8. Show the repository build manifest and source tree as technical evidence.

## Known scope boundary

This slice intentionally proves architecture and gameplay orchestration, not final art direction, combat content depth, production economy, or Roblox Reality visual quality. Those belong to subsequent production milestones.

## Integrity rule

Do not describe the slice as externally validated, mobile-benchmarked, or publicly deployed until those tests have actually been performed and their evidence archived.
