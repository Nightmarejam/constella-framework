# Civic Tome

The Civic Tome is Constella's versioned corpus of protocols, precedents, and rulings.

## Purpose

The Civic Tome serves as the authoritative record of:
- **Protocols** - Standard operating procedures
- **Precedents** - Past decisions that guide future ones
- **Rulings** - Formal governance decisions

---

## Structure

### Threads
Located in `/tome/threads/`
- Active project charters
- Thread-specific protocols

### Intents
Located in `/tome/intents/`
- Declared goals and purposes
- UCF and governance intents

### Outcomes
Located in `/tome/outcomes/`
- Completed thread results
- Archived decisions

### Precedents
Located in `/tome/precedents/`
- Notable rulings
- Edge case resolutions

### Vaults
Located in `/tome/vaults/`
- Resource allocation records
- Budget histories

---

## Claim Labels

All entries in the Tome are labeled:

| Label | Meaning |
|-------|---------|
| **stable** | Established, well-tested |
| **contested** | Under active debate |
| **speculative** | Experimental, not for policy |

---

## Amendment Process

```
Proposal → Auctor Vote → Validator Concurrence → Tome Diff
```

1. **Proposal**: Any participant can propose changes
2. **Auctor Vote**: Equal voice voting
3. **Validator Concurrence**: Technical review
4. **Tome Diff**: Version-controlled change record

### Red Team Window

- **7–14 days** for high-impact changes
- Allows critical review before finalization

---

## Versioning

The Civic Tome follows semantic versioning:

```
MAJOR.MINOR.PATCH
```

Per module, with:
- 1-epoch notice for deprecations
- Migration notes provided
- Archived with reason

---

## API Access

The Civic Tome is accessible via API:

| Endpoint | Purpose |
|----------|---------|
| `/threads` | Active thread charters |
| `/charters` | All charter documents |
| `/datasets` | Associated data |
| `/audits` | Audit records |
| `/tome/changes` | Version history |

Format: JSON, signed

---

## Related Documents

- [Penumbra Accord](penumbra_accord.md) - Conflict resolution precedents
- [UCF](ucf.md) - Funding allocation records
- [Tokens](tokens_astris_auctor.md) - Astris/Auctor transaction log
