# Observability Layer

*How Constella *sees* — the shared, confirmable record of conditions the whole system reads from. Draft
(2026-07-11), for Jonathan's revision.*

## The goal: from *count* to *condition*

The first stone computers — tally sticks, the abacus, the census — counted **quantity** (how many bushels,
how many head). This layer makes the harder leap: from *counting* to **seeing the condition** — not "300
crops" but "300 crops, this many tossed, why, at what margin." The moment you flatten a condition into a
single number, you lose the thing you were trying to observe. So the layer is built to **preserve nuance,
not collapse it.**

## Same tool, second substrate

This is not a new invention — it is the `WORD_SCHEMA` discipline pointed at civic reality instead of the
sandbox. Every earned word carries `tier / holds-when / fails-when / receipt`; it is never a bare number
and it always states its confidence and conditions. A civic **observation** carries the same shape. (One
architecture, two substrates — the same move as the Harmony bridge.)

## The observation (the atom of the layer)

| field | holds | discipline |
|---|---|---|
| **condition** | the state, *in words* — not a count | the nuance lives here (the "condition of the crop") |
| **measure(s)** | quantities where they apply (count, rate, margin, waste) | numbers *serve* the condition, never replace it |
| **context** | circumstances, the "why" | what a raw tally throws away |
| **scope** | individual / family / community / population | the privacy dial (see below) |
| **provenance** | who/what observed it, when, how | the receipt — makes it *confirmable*, not asserted |
| **confidence** | observed-directly / reported / inferred | tiered, so it stays honest |

There is deliberately **no "fault" field.** *Observe, don't judge* is baked into the data structure — the
layer physically cannot record a verdict. (This is `harm_and_repair.md`'s commitment made structural.)

## The privacy dial (proposed default — revise this)

Observation collides with the **[Temporal Floor](temporal_floor.md)'s right to be left alone.** The
resolution, as a *starting position* for you to change:

- **Default: OFF.** Nothing about an individual is observed without their consent. Being unobserved is the
  baseline, not something you have to earn.
- **Individual scope → opt-in, revocable.** A person may *choose* to be observed (e.g. to access help, or
  to contribute their story to the ledger), and may withdraw it. Consent is the key that turns it on.
- **Population scope → aggregate-only, untraceable.** To see the extremes (the truly privileged, the truly
  downtrodden) and *locate the middle*, observations are aggregated so **no individual is recoverable** from
  the pattern. The society is visible; the person is not.
- **Harm records → owned by the harmed.** In the historical/harm ledger, the affected party controls whether
  and how their trauma is recorded ("own that pain"). Never imposed observation of someone's wound.

The line, in one sentence: **see enough in the aggregate to locate harm and help; see an individual only
when they hand you the key.**

## What reads from it

- **Locating the middle** (`harm_and_repair.md`, band 1) — the aggregate view of the two extremes.
- **The floors** — the UCF/diversity pulse and Temporal Floor recalibrate against observed conditions.
- **The cyclical work** — the "Net Navi" arms populate and attest the layer on the **Governance Cadence**
  beats; the layer is *what they produce*, and the cadence is *when*.

## Tiers / boundaries

- **Receipt-backed (method):** the confirmability discipline is the same one proven across the sandbox —
  tiered, provenance-tracked observation is what keeps a claim honest.
- **Asserted values:** the privacy dial (off-by-default, consent, aggregate-only, self-owned) is a
  values choice, set here as a default — *yours to revise.*
- **Beyond the sandbox:** how nuance is actually captured in words at scale (vs collapsed by lazy metrics)
  is a genuine open engineering + human problem, not a solved one.
