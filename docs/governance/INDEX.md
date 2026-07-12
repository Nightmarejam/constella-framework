# Governance Spine — Canonical Index

*Purpose: one place that says what each governance spec is, whether it's current, and where
its formulas live — so we stop re-deriving concepts that are already written down. Built
2026-07 after discovering the ALife sandbox work had been re-inventing the "targeted
maintenance floor" that `alife_evidence_mapping.md` already specified in March 2026.*

## Two repos, one system (the bridge)

- **Framework / constitution:** `constella-framework` (this repo) — the specs below.
- **Evidence / sandbox:** `~/Projects/alife` (own repo: github.com/Nightmarejam/alife) — the ALife simulation
  (Rust port `alife-core`, Python exps 0–9) and `CONSTELLA_TO_EXPERIMENTS.md` (the
  concept→experiment→vocabulary pipeline + the 2026-07 UCF floor findings v1–v3).
- **The link doc:** `alife_evidence_mapping.md` (below) crosses the gap — now **fully synced** through the
  C-batch (~16 words, zero drift). The whole pipeline (sandbox → constitution → record → dataset → model →
  self-amendment) is mapped in `adaptive_loop.md` — the capstone.

## The canonical specs

| Doc | Defines | Key mechanism / formula | Status |
|---|---|---|---|
| `core_framework.md` | Purpose & flow | resonant/regenerative; "prevent stagnation via feedback & renewal" (anti-stasis principle) | draft v1.0 |
| `founding_hypothesis.md` | The premise | "if everyone knew what worth was, fewer would take advantage" (honest unprovable start) | stable |
| `ucf.md` | Universal Civic Floor | joule-anchored; `UCF = min(BasePop×H, 0.25×Surplus)`; joule anchor DONE 2026-07-02 | **current** |
| `tokens_astris_auctor.md` | Dual token (merit/voice) | Astris **joule-anchored** `A_gain=(J_v/R_JA)×C_q×V_p×R_s`, 2%/wk uniform decay; Auctor 1/person/epoch, resets | **current** |
| `proof_of_life_consensus.md` | Personhood/consensus | verified human presence replaces raw compute; backs Auctor uniqueness | draft 2026-05-24 |
| `penumbra_accord.md` | Restorative justice | Declare Harm → Mediation → Repair Contract → Reintegration | present |
| `civic_tome.md` | Authoritative record | versioned protocols / precedents / rulings (amendment vehicle); **entry format** added (the observation shape) 2026-07-11 | **current** |
| `temporal_floor.md` | Right to fallow time | a floor on *time* (sibling to UCF's floor on resources); anti-time-extraction; the civic Yin-return | draft 2026-07-10 |
| `governance_cadence.md` | The polity's clock | loose, published, multi-zone rhythm; few hard beats + many optional offered beats; phase-lock (`entrainment`) | draft 2026-07-10 |
| `harm_and_repair.md` | Non-judicial harm frame | the harm gradient (observe → dignity → restore → deliberate); **refuses the moral high ground** | draft 2026-07-11 |
| `observability_layer.md` | How Constella *sees* | count → condition; the observation atom; the privacy dial (aggregate / opt-in / off by default) | draft 2026-07-11 |
| `adaptive_loop.md` | Full pipeline + self-amendment | sandbox → constitution → record → dataset → two-tier model → **self-amend** → back; *model proposes, humans decide* | draft 2026-07-11 |
| `constella_governance_v0.1.md` | Governance overview | separates fiat comp / Astris issuance / governance | draft v0.1 |
| `compliance_overlay_us.md` | US legal mapping | UCF↔poverty lines, Astris↔tax, Auctor↔voting (HARD-walled from elections), Penumbra↔RJ | draft v0.1 |
| `alife_evidence_mapping.md` | Sandbox → constitution | three-mechanism system: founding diversity + **targeted maintenance floor (threshold-activated)** + tolerance of minimum-compliance | **living — needs sync C** |
| `map_of_intent.md` | (intended: intent map) | — | **BROKEN — see B** |
| `README.md` | pointer index | links to the above | ok |

## Open drift / issues (the reasons to keep this index)

- **A — Astris joule-anchor DONE ✅ (verified 2026-07-11).** `tokens_astris_auctor.md` now mints on
  `A_gain = (J_v / R_JA) × C_q × V_p × R_s`, where `J_v` = *verified joules of useful work* — the **same
  joule primitive the UCF is denominated in.** The old human-assigned base bounty `B` is gone; judgment
  (`C_q`) can only trim ±40%, and `V_p` ("did it happen") is kept separate from `C_q` ("was it good").
  Resolved (the anchor reasoning lives in `../research/proof_of_useful_work_session_notes.md`).
- **B — `map_of_intent.md` is a stub** (the corrupt shell fragment was replaced with a placeholder;
  no recoverable history). Still needs authoring — low priority.
- **C — evidence mapping fully synced (through the C-batch, 2026-07-11).**
  `alife_evidence_mapping.md` now carries **~16 confirmed words** with tiers + a word-status ledger, kept
  at **zero drift** from `~/Projects/alife/CONSTELLA_TO_EXPERIMENTS.md` via PRs #62–65 (claims here,
  receipts there). ✅ The **term-collision is RESOLVED** — `ucf.md` now has its "Two floors under one name"
  section (unconditional *dignity* floor vs targeted *diversity-maintenance* pulse). The three-mechanism
  finding also gained a scope caveat (context-dependent under cyclical drain).
- **D — Proof of Life is duplicated** across `docs/governance/proof_of_life_consensus.md` and
  `rfcs/001-proof-of-life-consensus.md`. Pick the canonical one.
- **E — Legacy Astris exemption removed** (2026-07, this session): non-decaying elite merit was
  an entrenchment/stasis vector the sandbox has a receipt against. Decay is now uniform.

## Already-answered (stop re-deriving these)

- **The "middle / calibrated floor"** = `alife_evidence_mapping.md` §"targeted maintenance floor"
  (activates when diversity drifts below threshold). Not an unconditional rescue.
- **Conflict resolution / "how politics happens"** = `penumbra_accord.md` (the four-step flow).
- **"What confers governance power"** = Auctor (1/person/epoch) + Proof of Life, firewalled from
  both money (Astris can't buy Auctor) and public elections (`compliance_overlay_us.md`).
- **Anti-stasis / turnover** = `core_framework.md` "feedback & renewal" + the sandbox stasis
  finding (v3). Applies to the Tome itself: it must stay amendable.
