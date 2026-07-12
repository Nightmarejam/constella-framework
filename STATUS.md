# Constella status

Last updated: 2026-07-11

## Where we are (2026-07-11)

Since the July-2 core pass (below), two major arcs landed:

**1. The sandbox earned its vocabulary.** The ALife repo (`~/Projects/alife`) reached **~16 confirmed
words**, each with boundaries — `civic-floor`, `anticipation`, `metabolic-thrift`, `targeted-floor`,
`founding-diversity`, `entrainment`, `adaptation-speed-limit`, `reintegration-over-exclusion`,
`transmission-trades-diversity`, `niche-maintains-diversity` — plus honest negatives (the discipline held;
no faked receipts). All synced into `docs/governance/alife_evidence_mapping.md` with **zero drift** (sync
PRs #62–65 + `WORD_SCHEMA`). The March "needs syncing" note in INDEX.md is now resolved.

**2. A new constitution layer — heart + record.** Five linked governance docs (2026-07-10/11):
`temporal_floor.md` (right to fallow time), `governance_cadence.md` (loose multi-zone clock),
`harm_and_repair.md` (non-judicial harm gradient), `observability_layer.md` (count→condition + privacy
dial), and the Civic Tome **entry format** — tied together by `adaptive_loop.md` (the full pipeline:
sandbox → constitution → record → dataset → two-tier model → **self-amendment** → back).

**Governing principle now:** the value-boundaries in these are **drafts pending evidence** — they earn
their form from real Civic Tome entries + sandbox receipts, not from decree (the attestation discipline
turned on the constitution itself).

**Gating:** the dataset + the merge into old `main` (on the Windows box + Gen8) wait on physical access in
Oregon — both offline, and the timeline has slipped further. The constitution's *structural* work is at a
natural completeness; the next real advances are the **dataset** (rig) or the **comparative world-policy
deep-dive** (banked).

## Role (elevated 2026-07-02)

Constella is the **basis of the AI logic stack**: FAITHH's reasoning discipline, the
conversation pipeline's tiers, and any future coalition governance (Floating Garden
pivot) all reference this repo. Sequencing across all repos: homelab REPO_GATES.md.

## What this is

See docs/vision/what_we_are_building.md

## Core pass (completed 2026-07-02 milestone — historical)

Make the logic core coherent and referenceable:

1. ~~Commit the confirmability schema~~ — DONE, docs/reference/confirmability.md
2. ~~Rewrite ucf.md with joule anchor~~ — DONE 2026-07-02 (joule denomination,
   fiat-as-display-conversion, paper-token layer, PoUW funding source)
3. Advance rfcs/001-proof-of-life-consensus.md from DRAFT (telemetry inputs exist:
   gpu_telemetry CSV + SensorBridge health API — see SensorBridge repo pivot doc)
4. ~~Extract the accuracy-review thread and reconcile~~ — DONE 2026-07-02:
   docs/reference/concept_lineage.md. Continuity verdict: good; one missing artifact.
5. ~~Doc-tree clarity~~ — DONE 2026-07-02 (both READMEs labeled: frameworks/ =
   frozen snapshots, constella/ = living docs)
6. ~~Write the Constella-Harmony Bridge document~~ — DONE 2026-07-02:
   harmony/docs/constella_harmony_bridge_v1.0.0.md (10-row mapping, design-checklist
   + FAITHH-reasoning + FGS-pilot uses, falsifiability boundary)

**Core pass: 5 of 6 items complete.** Remaining: item 3 (advance RFC 001) — best done
when Gen8 returns and the telemetry inputs are live again.

## Active tracks

### Governance specs (docs/governance/)

+ tokens_astris_auctor.md — DONE
+ ucf.md — needs joule anchor rewrite (core pass #2)
+ penumbra_accord.md — DONE (case-duplicate stubs removed 2026-07-02)
+ founding_hypothesis.md — DONE

### RFCs

+ 001-proof-of-life-consensus.md — DRAFT (core pass #3)

### PET device — design phase, parked behind core pass (VisionFive 2 not ordered)

### FAITHH node — OFFLINE since ~late June (Gen8/PVE tailscale keys expired

  physical access ~mid-July). Telemetry/mining state frozen as of last session.

## Next actions (2026-07-11)

1. **When back in Oregon (rig online):** build the training **dataset** from the constitution + receipts
   (already in `WORD_SCHEMA`/observation shape); merge the new work into old `main` on the Windows/Gen8
   boxes. See `docs/governance/adaptive_loop.md` steps 5–7.
2. **Pre-rig, optional:** scope the **comparative world-policy deep-dive** (the evidence that backs the
   harm-gradient / privacy-dial boundaries); let the value-boundaries stay drafts until then.
3. **Carried from the core pass:** advance `rfcs/001-proof-of-life-consensus.md` (needs live telemetry —
   Gen8) and resolve the PoL duplicate (rfcs/001 vs docs/governance/proof_of_life_consensus.md).
4. FGS coalition decision: is Floating Garden the first real Constella governance pilot?
