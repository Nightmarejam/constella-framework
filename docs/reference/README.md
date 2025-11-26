# Constella Reference Documents

This folder contains the authoritative technical specifications for the Constella Framework.

## Documents

| File | Version | Description |
|------|---------|-------------|
| `v1.5.4_HR1.md` | v1.5.4 | **Token mechanics** - Astris/Auctor formulas, UCF allocation, governance edge cases, pilot specs |
| `Robustness_Pack_v1.3.md` | v1.3 | **Operations & Safety** - Evidence levels (E0-E5), validation pipeline, data governance, ethics |
| `Framework_Master_v1.2.md` | v1.2 | **Module definitions** - Echo Code, Sky Lattice, Black-Hole Analogs, threads |

## Key Formulas (Quick Reference)

### Astris (Merit Token)
```
A_gain = B * C_q * V_p * R_s
  B = base bounty
  C_q = contribution quality (0.6–1.4)
  V_p = verified proof factor (0.8–1.2)
  R_s = redundancy score (1.0–1.1)

Decay: A_new = A_prev * (1 - 0.02)^w  (2%/week if inactive)
```

### Auctor (Civic Voice Token)
```
Base: 1 Au per verified person
Decay: Au_new = Au_prev * (1 - 0.05)^q  (5%/quarter if inactive)
Floor: 0.5 Au minimum
```

### UCF (Universal Civic Floor)
```
UCF = min( BasePop * H, 0.25 * Surplus_total )
  H = per-capita floor (pilot: $200/mo equivalent)
```

## For FAITHH Integration

These documents should be indexed with:
- `category: constella_master`
- `priority: highest`

See `/scripts/discovery/` for indexing tools.
