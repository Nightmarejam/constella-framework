<!-- ===== PROMPT ===== -->
# Universal Improvement Prompt (Constella v1.x)

**Role:** You are revising a single “scroll” (project brief) to align with the latest consensus snapshot and make it execution-ready for the next **30–90 days**. Be decisive, concise, and operational.

## What you’re given
- **Original Scroll** (the current project brief)
- **Aggregation Snapshot** (consensus ranking, partner overlaps, bottlenecks, highlights)

## Your job
- **Reconcile:** If Snapshot and Scroll disagree, adopt the **Snapshot** facts and adjust the Scroll.
- **Tighten:** Remove fluff; keep headings/structure; make actions concrete.
- **Operationalize:** Specify partners (primary + 1–2 alternates), MoUs/permits, staffing, simple KPIs, and a 12-week outline (Week 1–2 / 3–6 / 7–12).
- **Safety/ethics:** Keep disclaimers; strengthen if Snapshot flags risks (PSL tiering, waivers, consent, IRB).

## Keep these intact
- The **Title** line and overall **section order** of the original scroll.
- Any existing **safety/ethics** sections (you may tighten/expand).
- The **tone** (public, decision-forcing).

## Hard constraints
- Do **not** remove sections; you may add brief clarifying bullets.
- No PII (no reviewer names/emails).
- Prefer crisp bullets over prose.
- If a Snapshot item contradicts the scroll, adopt the **Snapshot** version and note it in the changelog.

## Output format (return ONLY Markdown)
Return **just the revised scroll** (no preface/analysis). Start with the same `# Title` line as the original scroll.  
At the very end, append:

> **Changelog:** Updated from {old_version} → {new_version} by consensus (YYYY-MM-DD).

## Quality bar
- Public-repo ready.
- Actionable in **30–90 days** (MoUs, permits, staffing, KPIs).
- Partners list: **primary + 1–2 alternates**, aligned with Snapshot overlaps.<!-- ===== MULTI-MODEL REVIEW INSTRUCTIONS ===== -->
### Reviewer Task
You are one of several AI models reviewing this improvement bundle.

- Return ONLY the **revised scroll** in Markdown.
- Start with the same `# Title` line as the original.
- Preserve section order and tone.
- Adopt Aggregation Snapshot facts where they conflict with the original.
- Add a mini **Changelog** at the bottom:
  `> Updated from vX.Y.Z → vX.Y.Z by consensus (YYYY-MM-DD)`
- Length ≤800 words.
- No preface or analysis.

This output will be compared to other models (GPT-5, Claude-4, etc.) and consolidated.

<!-- ===== ORIGINAL SCROLL ===== -->
---
version: v1.5.5
id: rme
title: Research Matchmaking Engine (RME)
tier: 🧭
status: ready-for-review
---

# RME — Review Scroll

## One-paragraph brief
Create a lightweight, transparent **review engine** (AI + human) that sequences pilots and reveals partner overlap and bottlenecks.

## Why now
RME is the credibility layer for everything else—prevents wasted work and speeds decisions.

## Success criteria (12 weeks)
- 1 full review cycle completed for at least **Eden** (+ optional Harmony)
- Public summary published to **Civic Tome**
- Partner overlap + bottleneck clustering visible

## Implementation notes
- Data hygiene & privacy policy (minimum fields, retention, access)
- Reviewer capacity/cadence; prompt templates versioned

## Suggested partners
- Policy lab; Civic-tech nonprofit; University research office

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
