# Aetheria — Vertical Slice Implementation Package

## Status

**Grant evidence package:** implementation-ready scaffold.

The prototype is intentionally designed as a minimum credible proof of the game's central thesis rather than a simulated claim of production readiness.

## What the vertical slice must prove

1. Multiplayer cooperation changes mission outcomes.
2. A Director system can adapt encounters from bounded game-state inputs.
3. AI failure does not break gameplay.
4. The server remains authoritative.
5. Avatar identity exists in the social hub.
6. The same core loop remains viable on mobile.

## Playable loop

```text
SOCIAL HUB
   ↓
Squad formation
   ↓
EXPEDITION
   ↓
Recon → Resource decision → Encounter → Extraction pressure
   ↓
EXTRACTION
   ↓
Shared rewards / hub progression
   ↓
SOCIAL HUB
```

## Director state snapshot

```lua
return {
    missionPhase = "expedition",
    squadSize = 4,
    averageHealth = 0.72,
    squadSeparation = 0.31,
    resourcePressure = 0.64,
    extractionDistance = 0.58,
    encounterIntensity = 0.41,
    difficultyBudgetRemaining = 0.52,
}
```

## Bounded action model

```lua
local AllowedActions = {
    SpawnEncounter = true,
    SetWeatherProfile = true,
    CloseRoute = true,
    OpenResourceCache = true,
    StartExtractionPressure = true,
    TriggerAmbientEvent = true,
}
```

Every action is validated server-side for type, range, location, cooldown, and remaining difficulty budget.

## Deterministic fallback

When the AI provider is disabled, unavailable, delayed beyond the configured timeout, or returns invalid data, the server selects an action from deterministic rules.

Example policy:

```lua
if snapshot.resourcePressure > 0.75 then
    return { action = "OpenResourceCache" }
elseif snapshot.squadSeparation > 0.70 then
    return { action = "TriggerAmbientEvent", parameters = { event = "SquadRegroup" } }
elseif snapshot.extractionDistance < 0.25 then
    return { action = "StartExtractionPressure", parameters = { intensity = 0.35 } }
else
    return { action = "SpawnEncounter", parameters = { intensity = 0.40 } }
end
```

## Demonstration acceptance tests

### Test A — Multiplayer

Two or more simulated clients can form a squad, enter one expedition, receive replicated mission state, and complete extraction.

### Test B — Director

At least three distinct valid states lead to different bounded actions.

### Test C — AI failure

Disabling the AI adapter causes no mission halt; the fallback policy continues gameplay.

### Test D — Server authority

Invalid client attempts to spawn encounters, award rewards, alter health, or bypass extraction are rejected by the server.

### Test E — Mobile

The mission can be completed on a representative supported mobile device while recording frame time, memory, replication and long-session stability.

## Evidence capture

The final application evidence folder should contain:

- `01_multiplayer_walkthrough.mp4`
- `02_director_ai_demo.mp4`
- `03_ai_failure_fallback.mp4`
- `04_mobile_benchmark.mp4`
- `05_avatar_identity.mp4`
- `screenshots/`
- `benchmarks/`
- `build-info.txt`

The repository must never imply that a video or build exists until the corresponding artifact has actually been produced.
