# Governance Spine — Canonical Index

*Purpose: one place that says what each governance spec is, whether it's current, and where
its formulas live — so we stop re-deriving concepts that are already written down. Built
2026-07 after discovering the ALife sandbox work had been re-inventing the "targeted
maintenance floor" that `alife_evidence_mapping.md` already specified in March 2026.*

## Two repos, one system (the bridge)
- **Framework / constitution:** `constella-framework` (this repo) — the specs below.
- **Evidence / sandbox:** `~/ai-stack/projects/alife` (separate repo) — the ALife simulation
  (Rust port `alife-core`, Python exps 0–9) and `CONSTELLA_TO_EXPERIMENTS.md` (the
  concept→experiment→vocabulary pipeline + the 2026-07 UCF floor findings v1–v3).
- **The link doc:** `alife_evidence_mapping.md` (below) is the *only* file that currently
  crosses the gap. It cites `projects/alife` but predates the Rust findings — it needs syncing.

## The canonical specs
| Doc | Defines | Key mechanism / formula | Status |
|---|---|---|---|
| `core_framework.md` | Purpose & flow | resonant/regenerative; "prevent stagnation via feedback & renewal" (anti-stasis principle) | draft v1.0 |
| `founding_hypothesis.md` | The premise | "if everyone knew what worth was, fewer would take advantage" (honest unprovable start) | stable |
| `ucf.md` | Universal Civic Floor | joule-anchored; `UCF = min(BasePop×H, 0.25×Surplus)`; joule anchor DONE 2026-07-02 | **current** |
| `tokens_astris_auctor.md` | Dual token (merit/voice) | Astris `A_gain=B×C_q×V_p×R_s`, 2%/wk decay; Auctor 1/person/epoch, resets | **drift — see A** |
| `proof_of_life_consensus.md` | Personhood/consensus | verified human presence replaces raw compute; backs Auctor uniqueness | draft 2026-05-24 |
| `penumbra_accord.md` | Restorative justice | Declare Harm → Mediation → Repair Contract → Reintegration | present |
| `civic_tome.md` | Authoritative record | versioned protocols / precedents / rulings (amendment vehicle) | present |
| `constella_governance_v0.1.md` | Governance overview | separates fiat comp / Astris issuance / governance | draft v0.1 |
| `compliance_overlay_us.md` | US legal mapping | UCF↔poverty lines, Astris↔tax, Auctor↔voting (HARD-walled from elections), Penumbra↔RJ | draft v0.1 |
| `alife_evidence_mapping.md` | Sandbox → constitution | three-mechanism system: founding diversity + **targeted maintenance floor (threshold-activated)** + tolerance of minimum-compliance | **living — needs sync C** |
| `map_of_intent.md` | (intended: intent map) | — | **BROKEN — see B** |
| `README.md` | pointer index | links to the above | ok |

## Open drift / issues (the reasons to keep this index)
- **A — Astris is not joule-anchored.** `tokens_astris_auctor.md` mints on a human-assigned
  base bounty `B` + quality rubric `C_q`, while `ucf.md` already anchors value to *joules of
  verified useful work (a receipt for energy already spent)*. Fix: set `B = joules from the
  proof-of-useful-work receipt` (same primitive the UCF uses); let `C_q`/`V_p`/`R_s` only
  modulate. **Read `../research/proof_of_useful_work_session_notes.md` before rewriting** — the
  anchor reasoning likely lives there; don't re-derive it.
- **B — `map_of_intent.md` is corrupt** (contains a shell fragment, no content). Recover from
  git history or remove.
- **C — evidence mapping is behind the sandbox.** `alife_evidence_mapping.md` (March 2026)
  predates the Rust `alife-core` UCF findings (v1: floor→resilience via headcount; v2:
  diversity-reserve mechanism NOT supported under uniform shock; v3: unconditional floor →
  stasis, no-floor → brittle → the floor has a *calibration regime*). Those receipts are fresh
  support for its "targeted maintenance floor" and "founding diversity" mechanisms — sync them in.
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
