# Confirmability schema — the Attestation layer

Status: v1.1 — committed 2026-07-02; `refuted` tier added 2026-07-31. **ADOPTED as the ecosystem's main layer 2026-07-02:
"Attestation" is the umbrella name; confirmability is its epistemic half.** This was
designed in conversation (April–June 2026) and has been operating uncommitted ever
since: the conversation pipeline, homelab extraction docs, and FAITHH doc-correction
workflow all already use it. This file makes it canonical. Constella is the basis of the
AI logic stack; attestation is its floor.

## Attestation — the main layer (adopted name)

**Attestation = attaching checkable provenance to something and refusing to treat it as
true (or act on it) without it.** Three faces, one rule:

- **Epistemic** (this schema): tier + cite + corroborate a *claim*. FAITHH's "show your
  receipts."
- **Action** (autonomy): tier-gated action — act on `confirmed`, confirm on `asserted`,
  STOP on `speculative`. The safety rail for FAITHH's autonomy (faithh docs/AUTONOMY_DESIGN;
  cautionary case: docs/alife/ACCURACY_REVIEW).
- **Physical** (Constella PoL / PET): hardware-rooted proof a node is a live, unique human
  (rfcs/001, rfcs/002, docs/vision/pet_attestation_device).
The tiers below are the shared vocabulary across all three.

## Tiers

Every stored fact, extracted entry, and system-state claim carries exactly one tier:

- **confirmed** — backed by a receipt: a live-system check, a git commit, a benchmark
  output, a document. The receipt is cited next to the fact. Receipts make facts
  portable — anyone (human or model) can re-verify without trusting the writer.
- **asserted** — stated from memory or conversation, plausible, unverified. The default
  tier for anything extracted from chat history. Asserted facts may guide work but may
  not overwrite confirmed facts.
- **speculative** — hypothesis, exploration, design intent. Never feeds
  reasoning-as-fact; lives in research-notes and idea docs.
- **refuted** — *added v1.1, 2026-07-31.* Checked against the system and found
  **false**. Carries a receipt like `confirmed` does; the receipt just records a
  negative result. Distinct from `speculative`, which is merely untested, and from
  deletion, which loses the finding. A refuted claim is retrievable but never
  offered as support.

  The gap was found by using the schema: the 2026-07-31 [VERIFY] sweep checked all
  five CORRECTIONS.md items against the live box and **none survived** — two were
  tagged `[git] safe to apply now` and were still wrong, because commit history
  proves an action was *attempted*, never that the system reached the stated state.
  Those corrections were not speculative; they had been tested and had failed, and
  the schema had no tier that said so. Without one the only options are to delete
  the record — inviting someone to re-derive the same wrong answer — or to leave it
  looking actionable.

## Rules

1. **No promotion without a receipt.** A fact moves to `confirmed` only when checked
   against the system it describes (or a durable artifact like git history). Tagging
   discipline: `[VERIFY]` marks asserted facts queued for promotion.
2. **Precedence.** confirmed > asserted > speculative, with refuted excluded
   outright rather than ranked last — a claim known false must not be offered as
   weak support. When two docs disagree
   (the ChromaDB `.243` vs `.10` drift that motivated this rule), the one with the
   newer receipt wins; if neither has a receipt, both demote to asserted and the
   conflict is flagged rather than silently resolved.
3. **Receipts age.** A confirmed fact about a mutable system decays back to asserted
   when the system is known to have changed since the receipt (e.g., every IP/count in
   FAITHH docs while the P2V/Proxmox rebuild happened). Date your receipts.
4. **Tier the source, not the confidence.** A fact you're 99% sure of from memory is
   still asserted. The tier records provenance, not vibes.

## Where it's already applied (receipts for this schema itself)

- homelab: docs/hardware/*.md, docs/repairs/*.md (tiered extraction entries)
- faithh-pet-terminal: CORRECTIONS.md workflow — [git] items applied, [VERIFY] held
- research-notes: README stance (everything speculative until sourced)
- Pipeline stage-3 output format requires a tier line per entry
- **Enforced in code 2026-07-31**, not just documented:
  - `homelab/pipeline/extract.py` — floors entries at `speculative`, lifts to
    `asserted` on concrete claims, and **refuses to assign `confirmed` at all**,
    because a script cannot hold a receipt.
  - `homelab/pipeline/promote.py` — stage 5 refuses to promote an entry claiming
    `confirmed` whose receipts are still unticked. Rule 1 as a gate.
  - `faithh-pet-terminal/backend/source_tier.py` — retrieval weights hits by tier
    (confirmed 3.0 / asserted 1.0 / speculative 0.8 / bulk 0.15) and drops
    `refuted`. Rule 2 as a ranking function.

## Tiers are tiers, not tags

Asked 2026-07-31: should these be tags instead? No. A tag is orthogonal and
unordered — `domain: infra`, `topic: dns` — and a thing may carry many. A tier is
**ordered, exclusive, and has transition rules**: exactly one per fact, precedence
when two disagree (Rule 2), and decay when a receipt ages (Rule 3). None of that
is expressible as a tag. Tag the subject; tier the provenance.
