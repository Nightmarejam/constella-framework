# Universal Civic Floor (UCF)

The Universal Civic Floor ensures baseline dignity and access for all participants.

## Two floors under one name (do not conflate)

The ALife evidence (Exp 6 vs Exp 9; see
[alife_evidence_mapping.md](alife_evidence_mapping.md)) forced a distinction. "Floor" was doing
two jobs that behave *oppositely* under stress, and running them as one caused every
unconditional-floor failure (Exp 6 collapsed at tick 7,410; the Rust sandbox froze at 787/43).
They are now separated:

1. **Dignity Floor** (this document, below) — the *survival* floor: food, shelter, care.
   **Unconditional by right** (a values commitment per the UDHR — not derivable from simulation),
   but **funded and bounded** so it cannot drive overshoot. Existence is the only eligibility.
2. **Diversity-Maintenance Pulse** (§ below) — a *systemic* mechanism preserving strategic
   participation diversity during fragile phases. **Targeted and threshold-activated** (Exp 9):
   it activates when diversity drops below a floor and deactivates on recovery. A pulse, not a
   subsidy. It is *not* a survival mechanism and carries no dignity claim.

The dignity floor is unconditional because it is a *right*; the diversity pulse is targeted
because the *evidence* says an untargeted version destroys the system. Both are true — they are
different mechanisms that were previously collapsed into one number.

## Core Principle (Dignity Floor)

> Every verified participant receives baseline access to essentials, regardless of contribution
> level. Eligibility is existence, not merit. The floor is **inviolable** but **bounded** — it is
> funded from surplus (see Allocation) and can never be inflated past the system's carrying
> capacity, which is exactly what collapsed the unconditional floor in Exp 6.

---

## Denomination: the joule anchor

The UCF is denominated in **joules**, not fiat. (Rewritten 2026-07-02 from the
2026-05-22 proof-of-useful-work session — see
[proof_of_useful_work_session_notes](../research/proof_of_useful_work_session_notes.md).)

- **What a UCF unit represents:** energy *already expended* in verified useful work —
  a receipt for work done, not a claim on reserves. This is the anti-Petro rule: no
  "value in the ground," only value already spent and verified. (Confirmability
  discipline applied to money: the receipt makes the unit portable.)
- **Why energy:** the floor is physical — food, shelter, heat, transit, care are all,
  at bottom, energy deliveries. Denominating in joules keeps the floor honest across
  fiat inflation and across pilots in different economies.
- **Fiat is a display conversion**, not the anchor: `H_fiat = H_joules × local
  energy price`. The pilot default below is a conversion snapshot, re-priced
  periodically, never the definition.
- **Paper-token layer:** participation must survive zero technology (a stated design
  requirement — EMP-resilient, device-free access). Paper tokens carry the same
  joule denomination; verification happens at redemption, not issuance.

---

## Allocation Formula

```
UCF = min(BasePop × H, 0.25 × Surplus_total)
```

Where:

- `BasePop` = base population count
- `H` = per-capita floor, **denominated in joules/month**
  (pilot display default: ~**$200/month** equivalent in goods/services at current
  local energy prices — a conversion, not the anchor)
- `Surplus_total` = total available surplus from all sources, joule-denominated

---

## Funding Sources

1. **Vault surpluses** - When Coverage Ratio ≥ 1.5
2. **Open Palm (OPP) pledges** - Voluntary contributions
3. **Genesis interest** - Returns from founding reserves
4. **Partner grants** - External institutional funding
5. **Proof-of-useful-work receipts** - Verified energy expenditure (compute, care work,
   infrastructure) entering as joule-denominated credits — see
   [rfcs/001](../../rfcs/001-proof-of-life-consensus.md) for the liveness/verification side

---

## Priority Allocation

UCF funds are allocated in priority order:

1. **Food** - Nutritional essentials
2. **Shelter** - Housing stability
3. **Utilities** - Power, water, connectivity
4. **Transit** - Mobility access
5. **Basic care** - Health and wellness

### Delivery Method

- **In-kind first** - Direct provision of goods/services
- **Cash last** - Only when in-kind is impractical

---

## Cross-Vault Rebalancing

When one vault runs low, the system can rebalance:

### Signal

```
CR = Reserves / (3 × AvgMonthlyOutflow)
```

### Action Trigger

If `CR < 0.8` for 2 consecutive weeks:

- Auto-proposal to move up to `min(5%, gap)` from vaults with `CR > 1.2`
- Requires Auctor vote + Astris weighted advisory

### Guardrail

Single move cannot drop any donor vault below `CR = 1.0`

---

## Hybrid Universal Civic Floor Model

The UCF operates as a hybrid system:

### Baseline (No Contribution Required)

All verified participants receive:

- Basic shelter access
- Food security
- Utility access (power, water, transit)
- Healthcare basics
- Civic voice (Auctor participation)

### Merit Enhancement Layer

Additional benefits through Astris:

- Multiplier effects on UCF benefits
- Curation roles
- Priority access to specialized resources

---

## Diversity-Maintenance Pulse (targeted — distinct from the Dignity Floor)

*Evidence: Exp 9 (survived 50K ticks; floor activated ~60 times, 17–130 ticks each — "minimal
intervention, maximum effect"). Contrast Exp 6 (unconditional floor collapsed, tick 7,410) and
Rust `alife-core` v3 (unconditional floor froze composition at 787/43, never adapting). See
[alife_evidence_mapping.md](alife_evidence_mapping.md).*

Separate from guaranteeing survival, the system must preserve a minimum of **strategic
participation diversity** during founding and consolidation — the periods when monoculture is
most likely and most fatal. This is a **pulse**, not a subsidy:

- **Trigger:** participation-strategy diversity drops below a minimum threshold (Exp 9 used ~15%).
  Calibrated to the target environment's actual participation frequency, not set theoretically.
- **Action:** targeted support to under-represented participation modes until diversity recovers.
- **Deactivate:** when diversity returns above threshold. It should be *absent* most of the time
  (in Exp 9 the supported cohort peaked ~80% during the fragile founding window, then faded to
  near-zero by tick 30,000 — the system stopped needing it).
- **Not a dignity claim:** eligibility is *strategic under-representation*, not existence. No
  one's survival depends on it — the Dignity Floor already guarantees that.

**Why it must be targeted (not universal):** an untargeted version inflates the system past
carrying capacity (Exp 6 → collapse) or freezes it against adaptation (Rust v3 → stasis).
Targeting is what made Exp 9 the only run to reach genuine long-run stability.

**Founding precondition:** the pulse cannot be introduced *after* the first major stress event —
by then specialization has locked in (Exp 8b: late diversity died without establishing). Multiple
participation modes must exist from day one; the pulse *maintains* founding diversity, it cannot
*create* it late.

## Related Documents

- [Token Mechanics](tokens_astris_auctor.md) - Astris/Auctor system
- [Civic Tome](civic_tome.md) - UCF precedents and rulings
- [ALife Evidence Mapping](alife_evidence_mapping.md) - the Exp 6/9 basis for the two-floor split
