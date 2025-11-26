# Universal Civic Floor (UCF)

The Universal Civic Floor ensures baseline dignity and access for all participants.

## Core Principle

> Every verified participant receives baseline access to essentials, regardless of contribution level.

---

## Allocation Formula

```
UCF = min(BasePop × H, 0.25 × Surplus_total)
```

Where:
- `BasePop` = base population count
- `H` = per-capita floor (pilot default: **$200/month** equivalent in goods/services)
- `Surplus_total` = total available surplus from all sources

---

## Funding Sources

1. **Vault surpluses** - When Coverage Ratio ≥ 1.5
2. **Open Palm (OPP) pledges** - Voluntary contributions
3. **Genesis interest** - Returns from founding reserves
4. **Partner grants** - External institutional funding

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
