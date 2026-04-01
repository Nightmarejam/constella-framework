# Constella Governance v0.1

Status: Draft for internal review  
Scope: Contribution evaluation, compensation transparency, privacy safeguards, and appeals

## 1) Purpose

Constella needs a governance model that is both transparent and humane:

- Transparent enough that compensation and recognition are legible and auditable
- Private enough that contributors are not socially targeted or personally exposed
- Practical enough to run in small teams and later scale to wider community input

This document defines a layered policy for contribution review and reward allocation.

## 2) Layered Transparency Model

Constella uses three visibility layers instead of full-public or full-private extremes.

### Public Layer (fully visible)

- Reward formula and scoring rubric
- Role bands and eligibility rules
- Total rewards distributed per cycle
- Anonymized contribution summaries and impact metrics

### Review Layer (restricted panel)

- Identity-linked submissions
- Evidence packets and reviewer notes
- Conflict-of-interest declarations
- Scored decisions and rationale logs

### Private Layer (confidential)

- Individual compensation details
- Personal identifiers and sensitive context
- Safety concerns, harassment reports, and mitigation actions

## 3) Contribution Evaluation Framework

Each contribution receives a structured score:

`Reward Score = Impact x Verification x Effort Normalizer`

Where:

- Impact (0-5): measurable usefulness, leverage, and downstream value
- Verification (0.5-1.0): confidence based on reproducibility and independent validation
- Effort Normalizer: `log(1 + verified_hours)` to avoid over-rewarding inefficiency

Optional leverage adjustment:

`Final Score = Reward Score x (1 + Leverage Factor)`

Leverage Factor is tied to reused outputs, avoided costs, or system-level utility.

## 4) Compensation and Astris Issuance

Constella separates three domains that should not collapse into one number:

- Capability: what someone can do
- Market value: what labor is worth in current context
- Astris issuance: internal reward tied to verified contribution value

Policy:

- Astris issuance uses the contribution score system
- Fiat compensation is assigned by role band and market benchmarks
- High-impact low-time work is explicitly rewarded through leverage factors

## 5) Review Workflow

1. Submission
   - Contributor submits artifact + evidence packet
2. Verification
   - Reproduction check and evidence quality check
3. Scoring
   - Two reviewers score independently using rubric
4. Reconciliation
   - Large score deltas require panel reconciliation
5. Decision
   - Final score, rationale, and issuance recorded
6. Publication
   - Public layer summary is published without private identifiers

## 6) Appeals Process

- Appeal window: 14 days from decision
- Appeals must cite rubric misapplication, evidence omission, or procedural error
- Appeal reviewer cannot include original scoring pair
- Appeal outcomes: uphold, revise, or remand for re-review
- All appeal outcomes logged in review layer

## 7) Anti-Targeting and Privacy Safeguards

- No public individual payout disclosure by default
- No public release of personal profile data tied to compensation
- Reviewer identity rotation to reduce social capture
- Mandatory conflict-of-interest declarations
- Harassment reporting channel with private escalation path
- Sanctions for doxxing, coercion, or retaliation behavior

## 8) Community Participation Without High-Touch Social Burden

Constella supports asynchronous governance participation:

- RFC templates for proposals
- Evidence-first submissions
- Fixed review windows
- Written rationale requirements

This allows broad contribution while reducing dependence on synchronous persuasion and social bandwidth.

## 9) Initial Implementation Plan (v0.1 -> v0.2)

Phase A:

- Adopt rubric and layered transparency policy
- Run internal pilot with 5-10 contributions
- Validate scoring consistency and appeal throughput

Phase B:

- Publish anonymized cycle reports
- Add leverage metrics and audit checks
- Tune role bands and issuance limits

Phase C:

- Expand to external contributors
- Add periodic policy review cadence
- Formalize governance constitution references

## 10) Open Questions

- What issuance cap prevents reward inflation in early stages?
- Which contribution classes require stricter external verification?
- What minimum evidence quality threshold should auto-reject submissions?
- How should long-term maintenance work be weighted vs. net-new work?

---

Owner: Constella governance working draft  
Last updated: 2026-03-31
