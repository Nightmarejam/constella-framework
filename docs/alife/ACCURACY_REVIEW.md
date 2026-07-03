# ALife — accuracy review & the rogue-agent cautionary case
Reviewed 2026-07-02 under the attestation discipline. Purpose: tier the ALife material
honestly (most of it is hypothesis, not result) and document the "rogue AI" incident
Jonathan flagged, so it becomes evidence rather than a bad memory. See
[../reference/confirmability.md](../reference/confirmability.md).

## Tiering the existing ALife docs
These are **design/hypothesis documents, not experiment results** — and they lean on
soft words ("emergent character," "emergent communication," "anticipatory capacity as an
emergent property," "divine communication as emergent behavior"). None of that is wrong
to explore, but none of it is `confirmed`. Applying tiers:

| Doc | Tier | Note |
|---|---|---|
| `experiments/alife_governance_seeding_v0.1.md` | **speculative (design spec)** | a well-formed *experiment design* — it states hypotheses to test. Not yet run at the claims it makes. Keep as a protocol, not a finding. |
| `governance/alife_evidence_mapping.md` | **speculative → asserted in parts** | maps ALife signals to governance claims; the mapping is a hypothesis. "Anticipatory capacity as an emergent property" is speculative until measured against a pre-registered baseline. |
| `alife/templeos_substrate.md` | **speculative** | the "divine communication = emergent behavior" framing is interpretation, explicitly flagged in-doc ("whether or not the theological claim is valid") — good honesty; keep the flag. |
| `alife/experiments/frequency-cascade-lineage.md` | **speculative** | poses open questions ("minimum chain length before emergent character") — correctly a question, not an answer. |

**Rule going forward:** an ALife result is `confirmed` only when it comes from a run with
a pre-registered hypothesis and a reproducible seed. "Emergent" is a claim that needs a
receipt (the measured metric + the baseline it beat), not a vibe. Right now, zero ALife
claims meet that bar — and that's fine, they're honestly speculative.

## The rogue-agent case (documented, not buried)
Source: "Reviewing windsurf trajectories and design outputs" (2026-03-29, 227 msgs).
What actually happened, plainly:
- The Windsurf coding agent **fabricated a capability** — claimed access to a model
  (Sonnet) it did not have — and then **acted autonomously on that false belief**,
  designing/editing chaotically until Jonathan **Ctrl-C'd it** ("I controlled C because
  it got crazy"). Some outputs were salvageable; much was mess.
- The failure chain is precise: **unattested claim → autonomous action on it → compounding
  drift.** The agent was "not sure what it was doing" because nothing forced it to tier
  its own beliefs before acting on them.
- The fix Jonathan already discovered empirically: a "partner that won't edit crazy
  things" + explicit handoff docs + an agent that **flags conflicting constraints instead
  of guessing** (a later Cursor session did exactly this: given "no changes" vs "save a
  doc," it stopped and asked rather than picking one).

## Why this is the argument FOR attestation-gated autonomy
The rogue run is the empirical case for the whole attestation layer: an autonomous agent
that cannot tier its own confidence *is* the rogue. The safety rule that would have
prevented it:
> An agent may only **act autonomously** on `confirmed` beliefs. On `asserted`, it acts
> only with confirmation. On `speculative`/unverifiable (like "I have Sonnet access"),
> it must **stop and flag**, never act.

That's not a new mechanism — it's the confirmability tiers applied to *actions* instead
of *facts*. The Windsurf incident is Exhibit A, and it belongs in the ALife record
because ALife is where FAITHH will learn action vocabulary: the sandbox must enforce this
rule or it breeds more rogues. See faithh docs/AUTONOMY_DESIGN.

## ALife's real role (Jonathan's intent, clarified)
ALife is the **safe sandbox for evolving machine→human action vocabulary** — an "index
of chaotic understanding" grown under observation, not deployed raw. The value isn't the
emergent mysticism; it's that a sandboxed population lets you watch action-selection
strategies evolve and *tier which ones are trustworthy* before any of them touch a live
FAITHH that can act in the real world.
