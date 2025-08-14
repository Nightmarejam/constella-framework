# Pilot: Gaia / Sky (Example Template)

**Goal:** Minimal public template showing how to propose, scope, and track a Constella pilot.

## Problem Statement
What resonance/dissonance are we addressing? Who is affected? What is the baseline?

## Hypothesis (Resonance Lens)
Which alignment should increase (body, mind, world)? What signals indicate improvement?

## Scope (30–90 days)
- **Milestones:** Week-by-week plan
- **Roles:** Steward(s), contributors, community reps
- **Dependencies:** Data access, venues, partners

## Metrics
- **Leading:** participation_rate, intervention_adherence
- **Lagging:** self_reported_alignment, environmental_noise_delta

## Risks & Safeguards
- Risks: data_privacy, placebo_effect, participation_fatigue
- Safeguards: anonymization, opt-in consent, weekly check-ins
- Ethical review: Penumbra Accord checklist

## Governance Touchpoints
- Cadence: Civic Orchestration (biweekly)
- Decision logs: Civic Tome path `civic_tome://pilots/gaia-sky`
- Closure criteria: Exit with report & public debrief

## Artifacts
- Data schema
- Templates
- Weekly notes

## YAML Quickstart
```yaml
id: gaia-sky-001
title: "Gaia/Sky – Community Resonance Mapping"
owner: "@your-handle"
duration_days: 60
objectives:
  - establish baseline resonance indicators
  - trial 2–3 micro-resonance interventions
metrics:
  leading: [participation_rate, intervention_adherence]
  lagging: [self_reported_alignment, environmental_noise_delta]
governance:
  cadence: biweekly
  logging: civic_tome://pilots/gaia-sky
risks: [data_privacy, placebo_effect, participation_fatigue]
safeguards: [anonymization, opt_in_consent, weekly_check_ins]
