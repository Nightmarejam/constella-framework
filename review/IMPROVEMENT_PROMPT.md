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
