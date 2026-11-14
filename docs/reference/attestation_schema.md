# Attestation schema v1.0: one vocabulary for tier, verdict and resistance

Status: adopted 2026-11-14. Source of truth: `Nightmarejam/homelab` `attestation_schema/`
(vendored here as `tools/attestation_schema/`, checked in Docs CI against its fingerprint).

## In plain words

Three systems in this ecosystem describe how sure they are, and until now each had its own words.
This schema is the single spelling, and it says how the words line up:

- **Confirmability tier** (this repo, [`confirmability.md`](confirmability.md)): `confirmed`, `asserted`,
  `speculative`, `refuted`. A *provenance* ladder: what backs a stored claim.
- **Epistemic type** (the learning loop): `fact`, `observation`, `rule`, `belief`, `metaphor`. What kind of
  thing a lesson is.
- **Kind and resistance** (the loop's PLC review, and FAITHH's Act layer): `conclusion` or `statement`, with a
  resistance from 0 (go) to 4 (never). *Gate friction*: how hard the system pushes back before the thing is
  applied or an action is run.

The two ladders are different axes, so one record can carry both. The envelope below is the mapping the
November 2026 ecosystem review asked for; the loop never mints `confirmed` (a receipt comes from a check
against the world, not from a review), and resistance 4 is the one idea the loop adds that this schema's
`refuted` rule wanted but could not say.

## The tables (generated)

The tables live in [`attestation_schema.generated.md`](attestation_schema.generated.md), written by
`python -m attestation_schema describe` and compared by CI; never hand-edit them. In short:

| Resistance | Name | Means |
|---|---|---|
| 0–1 | permissive | approval only; for an action: run |
| 2 | conditional | a named person's written reason; for an action: a written reason |
| 3 | interlock | a named override; for an action: a named approval through Dispatch |
| 4 | trip | never, until the cause is cleared |

| Tier | Loop kind | Types | Resistance |
|---|---|---|---|
| confirmed | conclusion | fact, observation | 0–1, with a receipt |
| asserted | conclusion | fact, observation, rule | 0–2 |
| speculative | statement | belief, metaphor | 0–3, never applied |
| refuted | conclusion | fact, observation | 3–4, never offered as support |

## Nature and nurture

The schema is **nature**: fixed, versioned (`SCHEMA_VERSION`), fingerprinted (`PIN.json`), changed only by a
deliberate edit in homelab followed by a re-pin and a re-vendor. What the loop learns, what FAITHH is allowed
to do and what Jonathan approves are **nurture** and live in the loop's stores, never in this file.

## Refresh

From a homelab checkout:

```bash
python scripts/vendor_attestation_schema.py <constella>/tools/attestation_schema
python -m attestation_schema describe > <constella>/docs/reference/attestation_schema.generated.md
python tools/attestation_schema/check_vendored.py     # in constella: what CI runs
```
