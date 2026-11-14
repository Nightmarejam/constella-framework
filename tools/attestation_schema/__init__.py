"""attestation_schema: the one place the ecosystem's verdict, resistance and epistemic vocabulary is defined.

In plain words
--------------
Three repos talk about how sure they are: the homelab learning loop (kind + resistance 0-4, five epistemic
types), FAITHH (what an answer rests on, what an action may do) and constella (the confirmability tiers:
confirmed / asserted / speculative / refuted). Until 2026-11-14 each repo spelled these out again in its own
code, and the ecosystem review found three tier enums and no written mapping. This package is the single
spelling. It is **nature**: a fixed schema with a version and a fingerprint, changed only by a deliberate,
versioned edit here. What the loop learns (rules, held statements, approvals) is **nurture** and lives in the
stores, never in this file.

How it is shared
----------------
Source of truth: homelab `attestation_schema/` (this directory, stdlib only, no dependencies). The loop imports
it directly. FAITHH and constella carry a byte-identical vendored copy plus a pin file with this package's
`fingerprint()`; a test in each repo fails when the copy drifts from the pin, and a sync script refreshes the
copy from a homelab checkout. There is no package index between these repos and the Gen8 receives the loop by
`git archive`, so a verified copy is the honest way to have one definition without a registry.

Technical
---------
- `EPISTEMIC` five types; `EVIDENCED` need an event; `PERSPECTIVE` are held as STATEMENT.
- `KINDS` conclusion|statement; `VERDICTS`; `verdict_of(kind, resistance)`.
- `LEVELS` 0-4 names; `OVERRIDABLE` (2, 3); the PLC-review prefix tables and `level_of(item)`.
- `TIERS` constella confirmability; `BASES` what an answer rests on (strongest first); `ENVELOPE` the two-axis
  mapping from the 2026-11 ecosystem review §5.3 (tier = provenance, resistance = gate friction).
- `fingerprint()` sha256 of the canonical JSON of everything above; `as_dict()` for non-Python readers;
  `describe()` a markdown table (constella's reference page is generated from it).
"""
from __future__ import annotations

import hashlib
import json

SCHEMA_ID = "attestation_schema"
SCHEMA_VERSION = "1.0"            # bump on any change below; every consumer pins the fingerprint

# ---- epistemic types (what kind of knowledge a lesson is) ------------------------------------------
EPISTEMIC = ("fact", "observation", "rule", "belief", "metaphor")
EVIDENCED = ("fact", "observation")        # claims about the world: need an event behind them
PERSPECTIVE = ("belief", "metaphor")       # held positions: STATEMENT, never fact by default
DEFAULT_EPISTEMIC = "belief"               # a lesson typed in by hand is a framing until shown otherwise

# ---- kind and verdict (what the PLC review concluded) ----------------------------------------------
KINDS = ("conclusion", "statement")
VERDICTS = ("CONCLUSION", "STATEMENT", "NEEDS-EVIDENCE", "REJECT")

# ---- resistance (how hard the gate pushes back; also the Act layer's scale) ------------------------
LEVELS = {0: "permissive, strong", 1: "permissive, standard", 2: "conditional", 3: "interlock", 4: "trip"}
OVERRIDABLE = (2, 3)                       # a named person with a written reason; never 4
ACT = {0: "run", 1: "run", 2: "needs a written reason", 3: "needs a named approval", 4: "never"}
# Which level a review item sits at, by its prefix. Anything else is a note (1).
TRIP = ("base:", "must_pass:", "interlock ", "eval faulted:")
INTERLOCK = ("no_breaks:", "fixes:", "score:", "contradiction:")
CONDITIONAL = ("untested:", "scope:", "evidence:")
# Gate reasons a level-3 override waives. base and must_pass never are.
WAIVABLE = ("no_breaks:", "fixes:", "score:")

# ---- constella confirmability (provenance of a stored claim) ----------------------------------------
TIERS = ("confirmed", "asserted", "speculative", "refuted")
NEVER_MINTED_BY_THE_LOOP = ("confirmed",)  # a receipt comes from a check against the world, not from a review

# ---- what an answer or an action rests on (strongest first) ----------------------------------------
BASES = ("CONCLUSION", "CONFIRMED", "ASSERTED", "STATEMENT", "SPECULATIVE", "BULK", "UNKNOWN")
ACT_ON = ("CONCLUSION", "CONFIRMED")       # act on confirmed
CONFIRM_FIRST = ("ASSERTED", "BULK")       # confirm on asserted
STOP = ("STATEMENT", "SPECULATIVE", "UNKNOWN")   # stop and flag on speculative (and perspective, and nothing)

# ---- the envelope: one record can carry both axes (review §5.3) -------------------------------------
# tier (provenance ladder)  <->  loop kind + epistemic type + resistance (gate friction)
ENVELOPE = (
    {"tier": "confirmed", "kind": "conclusion", "types": ("fact", "observation"), "resistance": (0, 1),
     "needs": "a receipt: a check against the system, a commit, a benchmark", "basis": "CONFIRMED"},
    {"tier": "asserted", "kind": "conclusion", "types": ("fact", "observation", "rule"), "resistance": (0, 1, 2),
     "needs": "the loop's NEEDS-EVIDENCE or a promoted rule without a receipt", "basis": "CONCLUSION"},
    {"tier": "speculative", "kind": "statement", "types": ("belief", "metaphor"), "resistance": (0, 1, 2, 3),
     "needs": "nothing; held as perspective, never applied", "basis": "STATEMENT"},
    {"tier": "refuted", "kind": "conclusion", "types": ("fact", "observation"), "resistance": (3, 4),
     "needs": "a receipt of the negative result; never offered as support", "basis": "UNKNOWN"},
)


def level_of(item: str) -> int:
    for lvl, prefixes in ((4, TRIP), (3, INTERLOCK), (2, CONDITIONAL)):
        if item.startswith(prefixes):
            return lvl
    return 1


def verdict_of(kind: str, resistance: int) -> str:
    if kind not in KINDS:
        raise ValueError(f"kind {kind!r} is not one of {KINDS}")
    if not 0 <= int(resistance) <= 4:
        raise ValueError("resistance is 0-4")
    if resistance >= 3:
        return "REJECT"
    if resistance == 2:
        return "NEEDS-EVIDENCE"
    return kind.upper()


def tier_for(kind: str, etype: str, has_receipt: bool = False) -> str:
    """The constella tier an exported loop lesson gets. The loop never mints `confirmed` itself."""
    if kind == "statement" or etype in PERSPECTIVE:
        return "speculative"
    return "asserted"


def as_dict() -> dict:
    return {
        "schema": SCHEMA_ID, "version": SCHEMA_VERSION,
        "epistemic": EPISTEMIC, "evidenced": EVIDENCED, "perspective": PERSPECTIVE, "default_epistemic": DEFAULT_EPISTEMIC,
        "kinds": KINDS, "verdicts": VERDICTS,
        "levels": {str(k): v for k, v in LEVELS.items()}, "overridable": OVERRIDABLE, "act": {str(k): v for k, v in ACT.items()},
        "prefixes": {"trip": TRIP, "interlock": INTERLOCK, "conditional": CONDITIONAL, "waivable": WAIVABLE},
        "tiers": TIERS, "never_minted_by_the_loop": NEVER_MINTED_BY_THE_LOOP,
        "bases": BASES, "act_on": ACT_ON, "confirm_first": CONFIRM_FIRST, "stop": STOP,
        "envelope": ENVELOPE,
    }


def fingerprint() -> str:
    return hashlib.sha256(json.dumps(as_dict(), sort_keys=True).encode()).hexdigest()


def describe() -> str:
    """A markdown reference, generated so no repo hand-writes the table again."""
    out = [f"<!-- generated by attestation_schema.describe(); schema {SCHEMA_VERSION}, fingerprint {fingerprint()[:16]} -->",
           "", "| Level | Name | Review items that raise it | For an action |", "|---|---|---|---|"]
    raised = {0: "nothing", 1: "notes (anything not below)", 2: ", ".join(CONDITIONAL), 3: ", ".join(INTERLOCK), 4: ", ".join(TRIP)}
    for k in sorted(LEVELS):
        out.append(f"| {k} | {LEVELS[k]} | {raised[k]} | {ACT[k]} |")
    out += ["", "| Constella tier | Loop kind | Epistemic types | Resistance | Needs | Basis label |", "|---|---|---|---|---|---|"]
    for e in ENVELOPE:
        out.append(f"| {e['tier']} | {e['kind']} | {', '.join(e['types'])} | {'-'.join(str(r) for r in (e['resistance'][0], e['resistance'][-1]))} | {e['needs']} | {e['basis']} |")
    out += ["", f"Epistemic types: {', '.join(EPISTEMIC)} (evidenced: {', '.join(EVIDENCED)}; perspective: {', '.join(PERSPECTIVE)}; "
            f"default when typed by hand: {DEFAULT_EPISTEMIC}). Verdicts: {', '.join(VERDICTS)}. "
            f"Bases, strongest first: {', '.join(BASES)}.", ""]
    return "\n".join(out)
