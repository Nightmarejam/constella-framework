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

### Accrual Formula (joule-anchored)

Astris is a **receipt for energy already spent in verified useful work** — not a bounty
someone assigns. The base is *metered in joules*; human judgment only modulates it. This is the
same joule primitive the UCF is denominated in (see [ucf.md](ucf.md)) and the
"energy-already-spent" framing from the PoUW session
([notes](../research/proof_of_useful_work_session_notes.md)).

```
A_gain = (J_v / R_JA) × C_q × V_p × R_s
```

Where:

- `J_v` = **verified joules of useful work** in the contribution — energy actually expended in
  human-interactive useful work (compute, care, infrastructure), captured as a
  proof-of-useful-work receipt. **This replaces the old assigned base bounty `B`: the base is
  now measured, not negotiated.**
- `R_JA` = **joule→Astris rate**, governance-set (one Astris = `R_JA` joules of verified useful
  work). This is the *single* political knob, set in the open via the Civic Tome — never per task.
- `C_q` = contribution quality (0.6–1.4 via rubric) — a **bounded modulator**: judgment trims the
  metered base ±40%, it cannot *be* the base.
- `V_p` = verified proof factor (0.8–1.2; repo links, QR/NFC logs) — attestation that the work
  occurred and was done by a Proof-of-Life-verified person (see
  [proof_of_life_consensus.md](proof_of_life_consensus.md)). Confirms **occurrence**, not worth.
- `R_s` = redundancy score (1.0 if unique; 1.1 if verified backup role).

**Why the anchor is load-bearing (headroom):** the old `B` let whoever set the bounty control
issuance — political capture with extra steps. With the base metered in joules, the objective
term dominates and human judgment (`C_q`) can only trim ±40%. `V_p` ("did it happen, by a real
person") is kept separate from `C_q` ("was it good") so **occurrence and worth never collapse
into one number** — the founding-hypothesis goal of making worth legible without making it
dictatable.

### Decay

```
A_new = A_prev × (1 - 0.02)^w
```

- **Rate**: 2% per week if inactive
- **Activity**: ≥1 verified action/week prevents decay
- **Uniform decay — no permanent exemptions.** Decay applies to all Astris equally regardless
  of past impact. (The former "plateau protection" and "Legacy Astris: no decay" carve-outs were
  removed 2026-07: non-decaying merit for top contributors is an entrenchment/stasis vector —
  the ALife sandbox showed that unconditionally protected incumbents freeze the system and kill
  adaptation. Recognition of foundational work belongs in the record/Tome, not in an
  ever-accruing token that confers permanent curation and queue advantage.)

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
