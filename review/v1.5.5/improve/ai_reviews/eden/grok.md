<!-- ===== PROMPT ===== -->
# Constella — Improvement Prompt (v1.5.x)

## Inputs you will receive (below, in this order)
1) **Original Scroll (MARKDOWN)** for a single project/thread.
2) **Aggregation Snapshot (MARKDOWN)**: consensus priorities, partners, bottlenecks, and 30–90 day steps derived from AI/human reviews.

## Your task
Produce a **fully revised scroll** that:
- **Corrects facts** and resolves inconsistencies using the Snapshot as ground truth.
- **Reflects consensus** priority, partners, and near-term steps.
- **Keeps structure & headings** intact (same section order, same tone).
- **Adds a changelog note** at the bottom:  
  `> Updated from vX.Y.Z → vX.Y.Z by consensus (date).`

## Hard constraints
- Do not remove sections; you may add small clarifying bullets.
- Prefer **concise, operational** language (decision-forcing).
- Keep any safety/ethics disclaimers intact; tighten if Snapshot flags risks.
- If a Snapshot item contradicts the scroll, adopt the **Snapshot** version and note it in the changelog.

## Output format (return ONLY Markdown)
Return **just the revised scroll** (no preface, no analysis). Start with the same `# Title` line as the original scroll.

## Quality bar
- Fit for public repo (no PII, no reviewer names/emails).
- Actionable in **30–90 days** (MoUs, permits, staffing, KPIs).
- Partners list: **primary + 1–2 alternates**, aligned with Snapshot overlaps.

<!-- ===== ORIGINAL SCROLL ===== -->
---
version: v1.5.5
id: eden
title: Project Eden (Housing Retrofits)
tier: 🧭
status: ready-for-review
---

# Project Eden — Review Scroll

## One-paragraph brief
12-week pilot: baseline audit → PSL-1 measures (weather-seal, LEDs, flow fixtures, thermostat tuning) → weekly reporting → public results.

## Why now
High feasibility, visible community value, trust-building.

## Success criteria (12 weeks)
- Baseline energy audit + MoU with host site
- PSL-1 measures installed
- Weekly logs + public outcome summary (Civic Tome)

## Implementation notes
- Municipal permits/coordination
- Insurance/waivers; contractor vetting
- Utility data access

## Suggested partners
- Municipal energy office; Community land trust; Public housing authority

## Review return format (≤500 words)
- Top 3 across threads (1→2→3) with rationale
- Implementation considerations
- Partners (primary + alt)
- Next steps (30–90 days)

<!-- ===== AGGREGATION SNAPSHOT ===== -->
# Aggregation Snapshot — v1.5.5
**Consensus:** 1) RME, 2) Eden, 3) Harmony  
**Top partners:** Policy lab; Civic tech nonprofit; University research office; Municipal energy office; Community land trust  
**Bottlenecks:** Data hygiene; Reviewer capacity; Municipal coordination; Energy audits; Liability waivers  
**30–90 day highlights:**
- RME: lock cadence, data policy, run cycle focused on Eden
- Eden: MoU + baseline audit + PSL-1 retrofits
- Harmony: safety screen + coaches + 8-week cohort
