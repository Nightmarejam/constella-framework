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

## Entry Format

Every substantive entry — a ruling, an edge-case resolution, an observed outcome — is recorded in the
shared **observation shape** (see `observability_layer.md`), so real cases accumulate
*confirmably and with nuance* instead of being flattened into a tally or a verdict:

| field | holds |
|---|---|
| **condition** | what happened, in words — the case/situation, not a judgment |
| **measures** | quantities where they apply (counts, amounts, durations) — serving the condition, not replacing it |
| **context** | the circumstances, the "why" |
| **scope** | individual (consented) / community / population (aggregate-only) — the privacy dial |
| **provenance** | who recorded it, when, from what source — the receipt |
| **resolution** | how it was *delegated or resolved* (the process taken and its outcome) |
| **claim label** | `stable` / `contested` / `speculative` (from Claim Labels above) — its confidence tier |

There is deliberately **no separate "fault/verdict" field** beyond the recorded resolution — *observe,
don't judge* is baked into the structure (see [Harm & Repair](harm_and_repair.md)).

**How boundaries mature from entries.** The value-boundaries in the newer mechanisms — the privacy dial,
the harm gradient, the floors — are held as *drafts pending evidence*, not settled by decree. They **earn**
their final form as these entries accumulate: enough real precedents and resolutions is what backs a
boundary, the same way multi-seed reproduction earns a sandbox word. **The Tome is where civic reality
gets its receipts** — the container the boundaries develop *out of*, rather than being asserted into.

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
