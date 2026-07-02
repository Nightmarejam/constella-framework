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
2. Rewrite ucf.md with joule anchor (concept notes: docs/research/
   proof_of_useful_work_session_notes.md, extracted from the 2026-05-22 thread)
3. Advance rfcs/001-proof-of-life-consensus.md from DRAFT (telemetry inputs exist:
   gpu_telemetry CSV + SensorBridge health API — see SensorBridge repo pivot doc)
4. Extract the "Constella framework accuracy review" thread (2025-12-10, 409 msgs —
   densest in the whole conversation corpus, never mined) and reconcile against
   current docs
5. Doc-tree clarity: docs/frameworks/ = versioned snapshots (1.6 etc.),
   docs/constella/ = living docs. Not duplicates — label each README accordingly.

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
