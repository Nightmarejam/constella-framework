# Universal Civic Floor (UCF)

The Universal Civic Floor ensures baseline dignity and access for all participants.

## Core Principle

> Every verified participant receives baseline access to essentials, regardless of contribution level.

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

## Related Documents

- [Token Mechanics](tokens_astris_auctor.md) - Astris/Auctor system
- [Civic Tome](civic_tome.md) - UCF precedents and rulings
