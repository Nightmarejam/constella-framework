# Token Mechanics: Astris & Auctor

Constella uses a dual-token system to separate merit from civic voice.

## Separation of Powers

> **Astris (merit) ≠ Auctor (voice)**
> 
> Validation is independent from funding and governance.

---

## Astris (Merit Token)

Astris represents earned contribution merit within the Constella ecosystem.

### Minting

- Minted upon **G3** (Archive gate) completion
- Partial minting at **G2** with escrow
- Amounts determined per thread impact table

### Accrual Formula

```
A_gain = B × C_q × V_p × R_s
```

Where:
- `B` = base bounty for task
- `C_q` = contribution quality (0.6–1.4 via rubric)
- `V_p` = verified proof factor (0.8–1.2; repo links, QR/NFC logs)
- `R_s` = redundancy score (1.0 if unique; 1.1 if verified backup role)

### Decay

```
A_new = A_prev × (1 - 0.02)^w
```

- **Rate**: 2% per week if inactive
- **Activity**: ≥1 verified action/week prevents decay
- **Plateau protection**: Foundational contributions (>95th percentile impact) capped at max 10% total decay lifetime
- **Legacy Astris**: Capped, no decay for major public goods

### Use Cases

- Curation rights (what gets attention)
- Queue priority
- Service access
- **NOT** voting power

---

## Auctor (Civic Voice Token)

Auctor represents equal civic participation rights.

### Distribution

- **1 Au per verified person** per epoch
- Equal distribution regardless of contribution level

### Decay Formula

```
Au_new = Au_prev × (1 - 0.05)^q
```

- **Rate**: 5% per quarter if inactive
- **Floor**: 0.5 Au minimum
- **Reactivation**: Any two governance actions in a quarter restore to pre-decay level (up to 1.0)

### Use Cases

- Policy decisions
- Budget allocation votes
- Steward selection
- Constitutional amendments

### Reset

- Balances zero each epoch
- No trading or carryover

---

## Anti-Gaming Measures

1. **Rotating validator pools** - Prevents capture
2. **Blinded reviews** where possible
3. **Anomaly detection** - Flags suspicious patterns
4. **Public audit log** - Transparency
5. **Conflict-of-interest declarations** - Required disclosure

---

## Key Principle

The dual-token system prevents plutocracy: high contributors (Astris) cannot buy governance power (Auctor), and equal voice holders cannot claim unearned merit.
