# Constella status
Last updated: 2026-07-02

## Role (elevated 2026-07-02)
Constella is the **basis of the AI logic stack**: FAITHH's reasoning discipline, the
conversation pipeline's tiers, and any future coalition governance (Floating Garden
pivot) all reference this repo. Sequencing across all repos: homelab REPO_GATES.md.

## What this is
See docs/vision/what_we_are_building.md

## Core pass (the active milestone)
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
- tokens_astris_auctor.md — DONE
- ucf.md — needs joule anchor rewrite (core pass #2)
- penumbra_accord.md — DONE (case-duplicate stubs removed 2026-07-02)
- founding_hypothesis.md — DONE
### RFCs
- 001-proof-of-life-consensus.md — DRAFT (core pass #3)
### PET device — design phase, parked behind core pass (VisionFive 2 not ordered)
### FAITHH node — OFFLINE since ~late June (Gen8/PVE tailscale keys expired;
  physical access ~mid-July). Telemetry/mining state frozen as of last session.

## Next actions
1. Core pass items 2–5 above, in order
2. When Gen8 returns: wire Grafana to telemetry CSVs (moves to faithh/SensorBridge work)
3. FGS coalition decision: is Floating Garden the first real Constella governance
   pilot? (see tomcat-sound kb/floating-garden-coalition-pivot.md)
