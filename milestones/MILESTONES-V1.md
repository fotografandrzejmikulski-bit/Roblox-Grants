# Aetheria: Echa Upadku — Milestones V1

## Milestone philosophy

The proposal is structured around evidence-producing gates. A milestone is complete only when the named functionality works, is measurable, and has documented evidence.

## M1 — Foundation / Months 1–3

### Deliverables
- Production repository and branching policy.
- Automated build/test workflow appropriate to the Roblox project.
- Server-authoritative multiplayer prototype.
- Basic hub-to-expedition transition.
- Performance instrumentation.
- Core data model and save-state strategy.
- AI adapter interface with a deterministic mock provider.

### Acceptance evidence
- Recorded multiplayer session.
- Automated test report.
- Performance baseline.
- Architecture diagram.
- Risk register revision.

## M2 — Vertical Slice / Months 4–8

### Deliverables
- One polished environment.
- One complete expedition loop.
- One enemy family.
- Director AI prototype operating through validated action schemas.
- Three materially different encounter outcomes from the same mission template.
- Social hub prototype with avatar identity presentation.
- Initial mobile performance pass.

### Acceptance evidence
- Playable build.
- Recorded before/after Director-AI comparison.
- Action schema tests.
- Mobile benchmark report.
- Playtest feedback report.

## M3 — Expansion / Months 9–13

### Deliverables
- Additional environments and encounter families.
- Progression and resource economy.
- Social progression.
- Initial monetization implementation behind feature flags.
- Analytics events for acquisition, activation, retention, session quality, failures, and monetization.
- Moderation/compliance review.

### Acceptance evidence
- Feature-complete internal build for the agreed scope.
- KPI dashboard prototype.
- Economy simulation.
- Security and exploit test report.

## M4 — Validation / Months 14–16

### Deliverables
- Mobile device matrix testing.
- Long-session stability testing.
- Network degradation and reconnect testing.
- AI outage simulation.
- Accessibility review.
- External QA cycle.
- Platform-policy checklist updated against current Roblox primary sources.

### Acceptance evidence
- Defect trend report.
- Crash and recovery statistics.
- AI fallback test report.
- Device compatibility matrix.
- Compliance sign-off.

## M5 — Launch Readiness / Months 17–18

### Deliverables
- Gold candidate build.
- Store metadata and launch assets.
- Community/support process.
- Analytics and operational dashboards.
- Launch and rollback plans.
- Final financial and production report.
- Submission/approval package aligned with any current Roblox program instructions.

### Acceptance evidence
- Release candidate.
- Launch readiness checklist.
- Final KPI baseline.
- Incident response plan.
- Complete grant evidence archive.

## KPI framework

| KPI | Definition | Measurement stage |
|---|---|---|
| D1 retention | % of new players returning the next day | External alpha onward |
| D7 retention | % of new players returning after seven days | External alpha onward |
| Session length | Median time per session | Prototype onward |
| Expedition completion | % of started expeditions reaching a valid ending | Vertical slice onward |
| Squad completion | % of missions completed with cooperative squad behavior | Vertical slice onward |
| AI fallback rate | % of Director decisions served by deterministic fallback | Technical validation onward |
| Critical error rate | Critical errors per 1,000 sessions | Internal QA onward |
| Mobile frame-time budget | P95 frame time by device tier | Prototype onward |
| Reconnect success | % of valid reconnects recovering session state | Validation |
| ARPDAU / payer conversion | Commercial performance after monetization activation | Soft launch onward |

## Gate decision rules

A failed milestone does not automatically trigger more scope. The team first fixes the blocking issue, re-tests, and records the result. New features enter production only after the vertical slice has demonstrated stable core loop performance.
