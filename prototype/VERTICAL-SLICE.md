# Aetheria — Vertical Slice Specification

## Purpose

This vertical slice is the minimum credible product proof for the grant package. It demonstrates the project's central thesis without depending on unverified experimental Roblox technology.

## Demonstration flow

1. Social Hub loads.
2. Four players join an expedition instance.
3. Squad state is aggregated on the server.
4. Mission enters reconnaissance phase.
5. Director selects a bounded encounter from an allow-listed action library.
6. Players fight, collect resources, and approach extraction.
7. Director changes pressure according to validated squad state.
8. AI service can be disabled during the demo; deterministic fallback continues the mission.
9. Squad extracts and returns to the hub.

## Proof points

### Multiplayer

Target: 4–6 simultaneous participants in one expedition.

Evidence: recorded multiplayer session and server-side mission log.

### Director AI

Target: at least three materially different encounter outcomes from the same mission template.

Evidence: deterministic test seeds plus gameplay captures showing different valid interventions.

### Safety boundary

The AI may only select an action from the allow-list. No model response directly executes arbitrary Lua or modifies arbitrary server state.

Evidence: architecture documentation, validation tests, and negative-test results.

### Fallback

Disable the AI adapter at runtime. The deterministic director continues the mission using the same action library.

Evidence: side-by-side demo recording and automated fallback test.

### Mobile performance

Benchmark representative Tier B and Tier C devices. Record frame time, memory, replication load, and long-session stability. Final numerical targets must be derived from measurements rather than asserted in advance.

### Avatar identity

Demonstrate Roblox avatar representation in the social hub and readable silhouettes in combat.

## Deliverable package

The production vertical slice should contain:

- playable Roblox place;
- source-controlled Luau code;
- deterministic test scenarios;
- Director adapter and fallback implementation;
- server-authority tests;
- device benchmark sheet;
- 3–5 minute gameplay recording;
- 60–90 second technical demonstration;
- screenshots for pitch deck;
- build/version manifest.

## Important limitation

A repository containing design documents is not itself evidence that a runnable Roblox build exists. The grant package must not claim that the vertical slice has been completed until a playable build and corresponding recordings/tests have actually been produced.