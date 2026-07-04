# Concept lineage — December 2025 accuracy review → repo today

Extracted 2026-07-02 from "Constella framework accuracy review" (2025-12-10, 409 msgs —
the densest thread in the conversation corpus). Purpose: verify continuity between the
ideas as originally laid out and the repo as it stands, and record the lineage so
sorting happens at the **concept** level (a dozen items), never the message level (15k+).

## Verdict summary

Continuity is GOOD. Of everything planned in that session, one artifact is missing,
one connection is undocumented, and nothing contradicts current docs.

| Concept (Dec 10 origin) | Where it lives now | Verdict |
|---|---|---|
| Harmony Framework v4.0.0 (3-layer structure: anatomy / functional / symbolic) | `harmony/docs/harmony_framework_complete_v4.0.0.md` + 6 SVGs | ✅ landed fully |
| Harmony-AI Bridge (4 mechanisms, return loop / "online resonance tuning") | `harmony/docs/harmony_ai_bridge_v1.0.0.md` + transformer spec + SVG | ✅ landed |
| FAITHH context file for Harmony | `harmony/harmony_faithh_context.md` | ✅ landed |
| Resonance gating | `harmony/docs/resonance_gating_architecture_note_v1.0.md` → implemented as the IME scaffold's resonance gating in ai-stack (SYSTEMS_MAP: "4 tests passing") | ✅ landed AND crossed into code — strongest continuity line in the corpus |
| **Constella-Harmony Bridge** (the governance mapping: head→civic perception, phase flip→Penumbra Accord, Yang intake/Yin return→Astris/Auctor, feet→local governance, hands→civic gestures) | **NOWHERE** — planned as "Phase 3" repeatedly, never written | ❌ the missing artifact; added to core pass |
| Active-citizenship / participation-as-practice framing (the reviewed "thought") | `docs/governance/founding_hypothesis.md`, `ucf.md` | ✅ consistent; the Dec review validated what the docs now say |
| Cross-system prediction (jaw-hyoid-C1 ↔ subtalar, gait-lab testable) | inside harmony master doc | ✅ preserved; still the framework's best empirical anchor |
| Review workflow ("GPT drafts, Claude reviews, only final master documents commit") | ancestor of homelab/REPO_GATES.md + the pipeline's stage-5 human review | ✅ evolved, not lost |
| RAG failure: 93k conversation chunks drowning 114 canonical doc chunks; category-metadata fix | became faithh commit `db3a2d6` ("penalize chat_export in reranking", May 2026) + the pipeline's never-trust-summaries rule | ✅ lesson institutionalized — receipt-traceable across 5 months |

## The one broken link, and why it matters

The Constella-Harmony Bridge is the document that makes Harmony *part of* Constella
rather than a lodger in its repo. Today `harmony/` sits in the repo with no doc
explaining the mapping — exactly the "connection between old and new" gap this review
was looking for. The full mapping already exists in the Dec 10 thread (table above is
the skeleton). Writing it is core pass item 6.

## Method note (the anti-overwhelm principle)

This file is the pattern for sorting at scale: don't sort information, track concepts.
Each concept gets one lineage row: origin thread → current home → verdict
(landed / evolved / missing / contradicted). ~15,000 messages reduce to ~10 rows.
When a future synthesis batch lands, extend the rows rather than re-reading history.

## Security note from the source thread

A Groq API key was pasted in plaintext in the Dec 10 conversation. It exists in the
chat exports (and possibly in Gen8's indexed conversation chunks). **Rotate it** at
console.groq.com if it hasn't been already.
