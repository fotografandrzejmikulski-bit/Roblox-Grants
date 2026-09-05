# Aetheria: Echa Upadku — Risk Register

| ID | Risk | Probability | Impact | Mitigation | Owner | Trigger / Evidence |
|---|---|---:|---:|---|---|---|
| R01 | Game Fund is not accepting applications or current terms differ from historical program | High | Critical | Verify current official application route and terms before submission; do not hard-code historical ceiling | Producer | Current Roblox application/contact confirmation |
| R02 | Proposed Roblox API/feature is unavailable, private, changed, or not documented | High | Critical | Adapter layer, feature flags, deterministic fallback, source register | Technical Lead | API documentation / developer access test |
| R03 | AI latency harms gameplay | Medium | High | Async orchestration, precomputed candidate actions, bounded decision windows, fallback | AI Engineer | P95 decision latency |
| R04 | AI produces invalid or unsafe action | Medium | Critical | Strict schema validation, allow-list, limits, server authority | AI Engineer | Validation rejection rate |
| R05 | Content-maturity classification limits audience | Medium | High | Design to a conservative target; complete current questionnaire accurately; avoid features that unnecessarily force Restricted status | Producer | Roblox maturity/compliance assessment |
| R06 | Mobile performance below target | High | Critical | Device-tier budgets, continuous profiling, content budgets from day one | Technical Lead | Frame time / memory / network benchmarks |
| R07 | Scope exceeds 18-month plan | High | High | Vertical-slice gate and explicit feature freeze | Producer | Milestone variance |
| R08 | Insufficient production experience | Medium | High | Recruit documented senior contributors; external specialist review; prototype before scaling | Producer | Team evidence |
| R09 | Budget assumptions prove unrealistic | Medium | High | Quotes, scenario analysis, monthly cash flow, contingency | Producer | Budget variance |
| R10 | IP ownership or contractor assignment gaps | Medium | Critical | Written IP assignment, licensing review, legal counsel | Legal | Signed agreements |
| R11 | Monetization negatively affects retention or fairness | Medium | High | Cosmetic-first design, controlled experiments, price sensitivity testing | Product | Payer conversion + retention deltas |
| R12 | Platform policy changes before launch | Medium | High | Continuous primary-source monitoring; compliance checkpoint at every milestone | Producer | Policy/source-register change |
| R13 | AI service outage | Medium | High | Deterministic gameplay fallback and kill switch | Technical Lead | Chaos/failure test |
| R14 | Privacy / excessive telemetry | Low-Medium | Critical | Data minimization, retention limits, access control, no unnecessary free-form user data | AI Engineer | Privacy review |
| R15 | Launch acquisition costs exceed plan | Medium | High | Organic community testing first; staged paid acquisition with stop rules | Marketing/Producer | CAC / activation / retention thresholds |

## Risk acceptance principle

The project should avoid dependencies where failure would make the core game unplayable. Experimental platform technologies can accelerate quality, but the minimum viable game must remain functional without them.

## Grant-reviewer framing

The risk register is not a disclaimer. It demonstrates that the team understands the technical and commercial uncertainties and has converted them into measurable engineering and production controls.
