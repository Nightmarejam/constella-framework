# Constella Framework

![Docs CI](https://github.com/Nightmarejam/constella-framework/actions/workflows/docs-ci.yml/badge.svg)

A civic governance framework built around one question: **what would a system look like
if it refused to treat anything as true — or act on it — without a checkable receipt?**

It is also the **logic basis** for my AI companion ([FAITHH](https://github.com/Nightmarejam/faithh-pet-terminal)):
the reasoning discipline the companion runs on is the same discipline this framework
proposes for a polity.

> One node in a personal AI ecosystem — see the [ecosystem map](https://github.com/Nightmarejam).
> A **framework and design**, human-directed and AI-assisted. See [PROVENANCE.md](PROVENANCE.md).

---

## The idea (one concept)

Most systems — technical or civic — drift because claims get treated as fact without a
trail. Constella's core move is **attestation**: every claim carries a tier —
`confirmed` (with a receipt), `asserted`, or `speculative` — and confidence only rises
when independent sources corroborate. Governance, money, and identity are all rebuilt on
that one honesty rule.

## What makes this different: earned, not asserted

Most governance proposals are essays — principles asserted from the armchair. Constella runs an **ALife
sandbox** (the companion [`alife`](https://github.com/Nightmarejam/alife) repo: a bit-exact, deterministic
Rust simulation) that *earns* its principles as **reproducible receipts.** Each design claim is tested
across many random seeds; it becomes a **confirmed word** only if it reproduces — and it is honestly marked
**refuted** if it doesn't (the retired "89.2%" figure is kept and struck, never hidden).

~16 confirmed words back the constitution today — e.g. *civic-floor → resilience*, *reintegration beats
exclusion*, *a persistent niche maintains the diversity a uniform standard converges away* — each with its
boundary conditions and a runnable command. The [evidence bridge](docs/governance/alife_evidence_mapping.md)
maps every claim to its receipt at **zero drift.** It is the framework's own honesty rule applied to
itself: a claim is only as strong as its receipt.

## The concepts, one at a time

Read in this order — each builds on the last:

1. **[Founding hypothesis](docs/governance/founding_hypothesis.md)** — the honest starting assumption
   (labeled *unprovable* on purpose, not hidden).
2. **[Confirmability / the attestation layer](docs/reference/confirmability.md)** — the epistemic floor:
   tiers, receipts, precedence. The one idea everything else inherits.
3. **[Tokens — Astris & Auctor](docs/governance/tokens_astris_auctor.md)** — participation (outward) and
   accountability (grounding); a system needs both or it starves or drifts.
4. **[Universal Civic Floor](docs/governance/ucf.md)** — a baseline of dignity, denominated in **joules**
   (energy already spent), not fiat. Its sibling: the **[Temporal Floor](docs/governance/temporal_floor.md)**
   — a floor on *time* (the right to fallow time), against attention-extraction.
5. **[Penumbra Accord](docs/governance/penumbra_accord.md)** — dissent turned into accountability — extended
   by **[Harm & Repair](docs/governance/harm_and_repair.md)**, a deliberately *non-judicial* harm gradient
   (Constella refuses the moral high ground).
6. **[Governance Cadence](docs/governance/governance_cadence.md)** — the loose, multi-zone rhythm the polity
   runs on, so people can anticipate cheaply and never be forced.
7. **[Observability Layer](docs/governance/observability_layer.md)** + **[Civic Tome](docs/governance/civic_tome.md)**
   — how Constella *sees* (count → condition, with a privacy dial) and *records* (a confirmable, tiered ledger).
8. **[Proof of Life](rfcs/001-proof-of-life-consensus.md)** + **[PoW basis & attestation](rfcs/002-pow-basis-and-attestation.md)**
   — identity as *verified human presence*, secured by hardware attestation, not raw compute.
9. **[Constella–Harmony Bridge](harmony/docs/constella_harmony_bridge_v1.0.0.md)** — why the civic
   architecture and a body-resonance model turn out to be the same shape.
10. **[The Adaptive Loop](docs/governance/adaptive_loop.md)** — the capstone: how sandbox → constitution →
    record → dataset → model → **self-amendment** closes into a loop (the model *proposes*, humans *decide*).

The **[canonical index](docs/governance/INDEX.md)** lists every spec with its status; **[concept lineage](docs/reference/concept_lineage.md)**
traces each idea from origin to today.

## Status & scope (honest)

- This is a **framework and design** — specs, RFCs, and hypotheses. It is **not** a live
  or deployed governance system, and it has run **zero pilots** so far.
- The founding hypothesis is an honest assumption, not a proven claim.
- Work tagged `speculative` (much of the attestation, PET-device, and chain material) is
  **thinking on paper** — the tiers tell you what's what.
- The structural design work is at a natural completeness (see [STATUS.md](STATUS.md)); the current
  frontier is the training dataset (gated by hardware) and grounding the newer value-boundaries in real
  cases (the [comparative deep-dive](docs/reference/real_world_harm_cases.md), just begun).

## Contributing, structure & review

- **How to contribute:** [CONTRIBUTING.md](CONTRIBUTING.md)
- **Reviewing this repo:** [REVIEW.md](REVIEW.md) — the coherence + honesty checklist, plus CI
  (markdownlint / codespell / lychee) and `scripts/check_coherence.sh`.
- **Living docs** vs. **frozen version snapshots**: `docs/constella/` vs `docs/frameworks/`
- **Governance index:** [`docs/governance/INDEX.md`](docs/governance/INDEX.md) · **Vision:** `docs/vision/` · **RFCs:** `rfcs/`

---

© Constella — v1.6.0 · consumes the [Celestial Equilibrium](https://github.com/Nightmarejam/celestial-equilibrium) doctrine as a submodule.
