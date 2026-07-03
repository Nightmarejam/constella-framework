# Confirmability schema — the Attestation layer
Status: v1 — committed 2026-07-02. **ADOPTED as the ecosystem's main layer 2026-07-02:
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

## Rules
1. **No promotion without a receipt.** A fact moves to `confirmed` only when checked
   against the system it describes (or a durable artifact like git history). Tagging
   discipline: `[VERIFY]` marks asserted facts queued for promotion.
2. **Precedence.** confirmed > asserted > speculative. When two docs disagree
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
