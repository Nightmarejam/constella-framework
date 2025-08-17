---
version: v1.5.6
id: rme
title: Research Matchmaking Engine (RME)
tier: 🧭
status: consensus-draft
updated: 2025-08-16
---

# RME — Consensus Scroll

## One-paragraph brief
Create a lightweight, transparent **review engine** (AI + human) that sequences pilots, surfaces **partner overlap** and **bottlenecks**, and publishes succinct outputs to the **Civic Tome** on a 12-week cadence.

## Why now
RME is the **credibility & prioritization layer** for everything else. It prevents wasted work, forces decisions, and produces public artifacts that partners can trust.

## Success criteria (12 weeks)
- One full review cycle completed for **Eden** (+ optional Harmony).
- Published **leaderboard (3-2-1)** and **partner overlap** & **bottleneck clustering**.
- **Data hygiene & privacy** note published (minimum fields, retention, access).
- 3–5 external reviewers confirmed; **versioned prompt templates** in repo.

## Implementation notes
- Data hygiene & privacy (min fields, retention, access, consent).
- Reviewer **cadence & capacity**; clear intake (CSV/TSV) and return format (≤500 words).
- Versioned prompt templates; reproducible “bundle → drops → consensus” pipeline.
- Publish summaries to Civic Tome (can start manual; automate later).

## Suggested partners
- **Primary:** Policy lab  
- **Alternates:** Civic tech nonprofit; University research office

## Next steps (30–90 days)
- **Weeks 1–2:** Finalize templates & guide; recruit 3–5 reviewers; set cadence; stabilize tracker columns; publish data-hygiene note.  
- **Weeks 3–6:** Run full cycle centered on **Eden**; produce leaderboard/overlap; tune prompts; prep Harmony packet if capacity allows.  
- **Weeks 7–12:** Recruit next cohort; publish **v1.5.6** summary to Civic Tome; log lessons; queue v1.5.7 scope.

## Dependencies & interfaces
Consumes: raw AI drops + human replies → tracker (Responses).  
Produces: consensus scrolls + leaderboard/overlap CSVs → Civic Tome.

## Consensus snapshot
- **Priority:** #1 (RME), #2 (Eden), #3 (Harmony)  
- **Top partners:** Policy lab; Civic tech nonprofit; University research office; Municipal energy office; Community land trust  
- **Common bottlenecks:** Data hygiene; reviewer capacity; municipal coordination; energy audits; waivers/insurance.
