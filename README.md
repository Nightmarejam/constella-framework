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

## The concepts, one at a time

Read in this order — each builds on the last:

1. **[Founding hypothesis](docs/governance/founding_hypothesis.md)** — the honest
   starting assumption (labeled *unprovable* on purpose, not hidden).
2. **[Confirmability / the attestation layer](docs/reference/confirmability.md)** — the
   epistemic floor: tiers, receipts, precedence. The one idea everything else inherits.
3. **[Tokens — Astris & Auctor](docs/governance/tokens_astris_auctor.md)** — participation
   (outward) and accountability (grounding); a system needs both or it starves or drifts.
4. **[Universal Civic Floor](docs/governance/ucf.md)** — a baseline of dignity, denominated
   in **joules** (energy already spent), not fiat.
5. **[Penumbra Accord](docs/governance/penumbra_accord.md)** — how dissent is turned into
   accountability instead of treated as failure.
6. **[Proof of Life](rfcs/001-proof-of-life-consensus.md)** + **[PoW basis & attestation](rfcs/002-pow-basis-and-attestation.md)**
   — identity as *verified human presence*, secured by hardware attestation, not raw compute.
7. **[Constella–Harmony Bridge](harmony/docs/constella_harmony_bridge_v1.0.0.md)** — why
   the civic architecture and a body-resonance model turn out to be the same shape.

Two reference docs tie it together: **[concept lineage](docs/reference/concept_lineage.md)**
(how each idea traces from origin to today) and the confirmability schema above.

## Status & scope (honest)

- This is a **framework and design** — specs, RFCs, and hypotheses. It is **not** a live
  or deployed governance system, and it has run **zero pilots** so far.
- The founding hypothesis is an honest assumption, not a proven claim.
- Work tagged `speculative` (much of the attestation, PET-device, and chain material) is
  **thinking on paper** — the tiers tell you what's what.
- Core design pass is 5/6 complete; the remaining item waits on live telemetry. See
  [STATUS.md](STATUS.md).

## Contributing & structure

- **How to contribute:** [CONTRIBUTING.md](CONTRIBUTING.md)
- **Living docs** vs. **frozen version snapshots**: `docs/constella/` vs `docs/frameworks/`
- **Governance index:** `docs/governance/` · **Vision:** `docs/vision/` · **RFCs:** `rfcs/`

---

© Constella — v1.6.0 · consumes the [Celestial Equilibrium](https://github.com/Nightmarejam/celestial-equilibrium) doctrine as a submodule.
