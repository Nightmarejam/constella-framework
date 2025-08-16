# Review Scroll — v1.5.3 “Cosmic” (Living Notes)

**Scope:** Threaded notes capturing decisions, rationales, and open items during the pre-v1.5.5 alignment.

---

## Context Snapshot
- Established repo scaffolding for Constella docs and working notes.
- Brought AI + Human review pipelines online (pure-text AI bundle, committee packet, matrix tracker).
- Agreed on 72-hour review cadence (Day 1 AI, Day 2 Human, Day 3–4 synthesis).

## Key Decisions (echoed to Decisions Log)
- **D-C01:** Civic Orchestration metaphor adopted → *open field / meta-skin / biotic field*.
- **D-C02:** Document “field functions”: signal insulation, nutrient/resource distribution, coordination networks.

## What Landed Well (external feedback)
- “Dual-track review” (AI + human) with identical output shapes for easy comparison.
- Human Committee packet tone + rubric (Impact/Feasibility/Readiness/Equity/Risk) improved response quality.
- Pure-text AI bundle produced consistent, paste-ready outputs for the Matrix Tracker.

## Artifacts Created (during this block)
- `docs/constella/` structure with stubs:
  - `overview.md`, `civic-orchestration.md`, `decisions.md`, `open-questions.md`, `structures.md`, `README.md`
  - `_inbox/constella_raw.md` (large raw import)
- Repo hygiene/scripts:
  - `.gitignore` updated to exclude macOS `.DS_Store`
  - `scripts/cleanup_docs.sh` (dry-run + apply) to normalize links/badges and tidy docs tree
- Review infrastructure:
  - AI Review Package (pure text)
  - Human Committee packet with response template + rubric
  - Matrix Tracker CSV (points: 1st=3, 2nd=2, 3rd=1) and consensus mini-guide

## Open Questions (carried forward)
- How to ground the metaphors in civic practice without overextending bio parallels?
- Most legible diagram for **signal insulation vs. resource flow** in Civic Orchestration?
- Which near-term case studies best validate the metaphor (Eden, Harmony, or RME first)?

## Next Actions (hand-off to v1.5.5)
- Launch parallel review cycles; log all results into the Matrix Tracker.
- Synthesize top-3 priorities, partner overlap, and repeated bottlenecks.
- Produce Decision Summary slide + 30–90 day plan for #1 priority.