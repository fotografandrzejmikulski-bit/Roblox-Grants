# Aetheria — Vertical Slice Evidence Package

## Evidence objective

The prototype exists to substantiate the central production thesis before a funding decision:

> Aetheria can deliver a replayable cooperative expedition game in which a bounded Director system changes gameplay while the Roblox server remains authoritative and the experience remains playable when AI services are unavailable.

## What is implemented

### 1. Server-authoritative simulation

The prototype keeps mission state, Director state, route state, intensity, and extraction state on the server.

### 2. Director adapter

`deterministicDirector()` is deliberately shaped as an adapter boundary. In production, this function can be replaced by a currently supported Roblox AI integration without changing the core mission systems.

### 3. Allow-listed actions

The Director can only issue the following actions:

- `SpawnEncounter`
- `SetWeatherProfile`
- `CloseRoute`
- `OpenResourceCache`
- `StartExtractionPressure`

Invalid actions are rejected by `validateAction()`.

### 4. AI outage proof

The test operator can disable the Director adapter during a mission. The server switches to a deterministic fallback policy and the mission continues.

This is a critical grant proof because the product does not make experimental AI services a single point of failure.

### 5. Complete mission loop

The prototype supports:

`HUB → START EXPEDITION → DIRECTOR EVENTS → EXTRACTION → HUB`

### 6. Observability

The prototype emits readable events for mission start, Director decisions, fallback operation, encounters, environmental changes, route changes, extraction pressure, mission completion, and return to hub.

## What the prototype does not claim

The prototype is not evidence that:

- Roblox has approved the project;
- Roblox Reality is generally available to this project;
- any grant amount is guaranteed;
- an external AI provider is approved for production use;
- the prototype already has commercial-scale art content;
- platform compliance has been finally certified.

Those are separate validation gates.

## Reproducible Studio test

1. Create a new Roblox experience.
2. Copy the server script into `ServerScriptService`.
3. Copy the client script into `StarterPlayer/StarterPlayerScripts`.
4. Start a 4-player local multiplayer test.
5. Click `START EXPEDITION`.
6. Observe Director decisions every six seconds.
7. Click `SIMULATE AI OUTAGE` and observe `DIRECTOR_FALLBACK` events.
8. Click `RESTORE AI`.
9. Click `EXTRACT`.
10. Verify the HUD returns to `HUB`.

## Grant video script

### 0:00–0:15 — social hub
Show four connected players and explain that the hub is the persistent social layer.

### 0:15–0:35 — mission start
Start the expedition. Show the squad size and transition into the mission.

### 0:35–1:05 — adaptive Director
Allow several Director decisions to fire. Show at least three distinct interventions.

### 1:05–1:20 — resilience test
Trigger AI outage. Show the deterministic fallback and the fact that the mission continues.

### 1:20–1:35 — extraction
Complete extraction and return to hub.

### 1:35–1:50 — technical takeaway
Show the repository and summarize the server-authoritative, allow-listed architecture.

## Evidence table

| Thesis | Prototype evidence | Next production proof |
|---|---|---|
| Cooperative multiplayer | 4-player Studio test | 4–6 external playtesters |
| Adaptive gameplay | Multiple Director events | A/B encounter tests |
| AI resilience | Forced outage + fallback | Latency and failure load tests |
| Server authority | Server-owned mission state | Exploit/invalid-client test suite |
| Repeatability | Complete expedition loop | Retention cohort tests |
| Mobile-first | Architecture prepared | Device-tier profiling |

## Required recording artifacts

- `evidence/vertical-slice-demo.mp4`
- `evidence/multiplayer-session.png`
- `evidence/director-fallback.png`
- `evidence/extraction-loop.png`
- `evidence/mobile-performance.png`

Binary evidence files are intentionally not fabricated. They should be added after the actual Studio run and capture.
