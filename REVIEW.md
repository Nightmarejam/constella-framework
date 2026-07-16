# Review System

*How this repository keeps itself coherent, current, and honest — the same attestation discipline the
framework proposes for a polity, turned on the repo itself. Run this pass before sharing the project or
cutting a release.*

## Why this exists

Constella's core claim is that systems drift when claims get treated as fact without a checkable receipt.
A framework that says that must **hold itself to it.** This review system is how: it keeps every doc
indexed, every link live, every claim tiered, and the front page current — so a reviewer finds a
consistent, honest project rather than a pile of drafts.

## 1. Automated (runs in CI + one local script)

Every pull request runs **`.github/workflows/docs-ci.yml`**:

- **markdownlint** — style consistency (`.markdownlint.json`).
- **codespell** — spelling (`.codespellignore` for intentional terms, e.g. *fallow*).
- **lychee** — every link resolves (catches broken cross-references and filename-case bugs).

And **`scripts/check_coherence.sh`** (run locally; can be wired into CI) adds the content checks a linter
can't see:

1. every governance spec in `docs/governance/` is listed in the canonical `INDEX.md` (nothing orphaned);
2. every file the `README.md` links to exists;
3. tier honesty — flags any doc carrying both a `stable` claim and an unresolved `[verify]` for a
   hand-check.

## 2. Coherence checklist (manual, ~5 min)

- [ ] `docs/governance/INDEX.md` lists every spec, each with a current status.
- [ ] `README.md`'s "read in this order" reflects the newest layer (a reviewer starts here).
- [ ] `STATUS.md` date is current and its "Where we are" matches reality.
- [ ] `adaptive_loop.md` (the capstone) still describes the actual pipeline.
- [ ] The GitHub repo **description + topics** match the content.

## 3. Honesty / logic audit (the differentiator)

This is the part that earns a reviewer's trust:

- [ ] **Every claim carries a tier** — `confirmed` / `asserted` / `speculative` (attestation), or the
      Civic Tome's `stable` / `contested` / `speculative`.
- [ ] **No `confirmed`/`stable` claim without a receipt** — a reproducible sandbox word (in the alife repo)
      or a cited primary source.
- [ ] **`[verify]` flags are not promoted** past `contested`.
- [ ] **Earned vs asserted vs beyond** are separated in each doc — sandbox-derived, values-asserted, and
      irreducibly-human are never blurred.
- [ ] **Refuted claims are marked, never silently deleted** (e.g. the retired "89.2%" figure).

## 4. Currency (per working session)

- [ ] New docs added to both `INDEX.md` and `README.md`.
- [ ] Resolved `INDEX.md` issues marked; open ones stated honestly.
- [ ] **Cross-repo sync at zero drift:** the alife repo's `CONSTELLA_TO_EXPERIMENTS.md` (receipts) ↔ this
      repo's `docs/governance/alife_evidence_mapping.md` (claims). Every earned word appears in both.

## The one-liner

**The review system *is* the thesis.** Nothing in this repo should read as more certain than its receipts
allow — and this pass is how we keep that true.
