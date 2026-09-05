# Aetheria: Echa Upadku — Grant Budget V1

## Budget policy

This budget is a planning model, not a claim about the current Roblox Game Fund award ceiling. The final request must be set only after the active program terms are confirmed.

## Proposed 18-month production envelope

| Cost category | PLN |
|---|---:|
| Core production team | 2,124,000 |
| Office + utilities | 90,000 |
| Hardware / software / testing infrastructure | 120,000 |
| Legal / accounting / IP / tax support | 90,000 |
| QA / localization / accessibility / external testing | 150,000 |
| Marketing / community / launch assets | 150,000 |
| Contingency | 276,000 |
| **Total planning envelope** | **3,000,000** |

## Team model

The initial working team is seven people:

| Role | Monthly planning cost | 18-month planning cost |
|---|---:|---:|
| Technical Lead / Luau Architect | 22,000 PLN | 396,000 PLN |
| Senior AI / Systems Engineer | 24,000 PLN | 432,000 PLN |
| Producer / Project Manager | 18,000 PLN | 324,000 PLN |
| Level Designer / Technical Artist | 15,000 PLN | 270,000 PLN |
| 3D Artist / Animator | 14,000 PLN | 252,000 PLN |
| UX/UI Designer | 14,000 PLN | 252,000 PLN |
| Junior Engineer / QA | 11,000 PLN | 198,000 PLN |
| **Total** | **118,000 PLN** | **2,124,000 PLN** |

These are internal planning assumptions. Before submission they should be replaced or validated with actual quotations, contracts, payroll assumptions, and applicable Polish tax/social-security treatment.

## Reallocation logic

The budget is intentionally milestone-driven. Capital should move first to the systems that de-risk the project:

### Phase I — Foundation
Engineering setup, repository, CI, networking prototype, profiling harness, first multiplayer test.

### Phase II — Vertical slice
Playable mission, Director AI adapter, one environment, one enemy family, social hub prototype, performance baseline.

### Phase III — Expansion
Additional environments, progression, economy, live-ops hooks, analytics, content pipeline.

### Phase IV — Validation
External QA, mobile device matrix, accessibility, exploit testing, stability and recovery.

### Phase V — Launch
Store assets, community operations, localization, launch campaign, support readiness, analytics review.

## Grant accountability

Every grant-funded purchase should map to:

- a work package;
- a named owner;
- a milestone;
- an acceptance test;
- evidence that can be supplied to the funder.

## Financial corrections relative to the earlier draft

The earlier planning document treated $750,000 at a fixed 4 PLN/USD conversion as exactly 3,000,000 PLN. That relationship is mathematically convenient but should not be used as the final grant basis without a current FX assumption and a documented treatment of foreign-exchange risk.

The earlier draft also placed 421,000 PLN into a single contingency line. V1 distributes part of that reserve into concrete operating categories and retains 276,000 PLN as contingency so that the financial model is easier for a reviewer to audit.

## Revenue model assumptions

The game is designed around free access with platform-native monetization. Roblox currently documents several applicable mechanisms, including passes, developer products, subscriptions, paid access, advertising, avatar items, and Creator Rewards. citeturn516321search8turn516321search10

Passes sold by the experience creator currently return 70% of Robux spent. citeturn516321search8

DevEx economics are not treated as an immediate source of grant repayment. Current Roblox documentation specifies the standard exchange rate and eligibility thresholds; those figures are maintained in the source register rather than hard-coded into revenue forecasts without a sensitivity analysis. citeturn516321search0

## Required financial validation before submission

- confirm active Game Fund terms and whether the program currently accepts applications;
- confirm eligible applicant structure for an individual applicant versus a company/group;
- confirm whether grant funds may cover contractor fees, hardware, marketing, legal costs, or indirect costs;
- confirm tax/VAT treatment and foreign-currency payment mechanics;
- obtain vendor quotations for major CAPEX items;
- build USD and PLN versions using a documented FX assumption;
- prepare low/base/high burn scenarios;
- prepare 18-month cash-flow schedule tied to milestones;
- identify all assumptions separately from confirmed facts.
