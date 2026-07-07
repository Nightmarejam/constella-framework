# ALife Evidence Mapping — Constella Constitutional Basis

*Version: 1.0 — drafted March 2026*
*Status: Living document. Updated after each experiment series.*
*Evidence type: Computational simulation (ALife series, Exps 0–9)*
*Epistemic status: Simulation-derived. Findings are consistent with
real-world governance literature where noted. Not empirically validated
in human systems. Treat as mechanistic hypotheses with supporting
precedent, not proven policy.*

---

## Purpose

This document maps findings from the ALife experiment series
(projects/alife/experiments, Exps 0–9) to specific Constella
constitutional mechanisms. It establishes the evidentiary basis
for each design decision — distinguishing findings that emerged
from simulation data (earned) from principles imported from
external frameworks (asserted).

The goal is a constitution grounded in observed dynamics, not
only in normative theory. Where ALife findings converge with
established literature, that convergence is noted as external
validation.

---

## Core Finding: The Three-Mechanism System

No single mechanism produces long-run stability. The ALife series
identified three interlocking requirements:

1. **Founding diversity** — multiple participation strategies must
   be present before the system faces its first major stress event
2. **Targeted maintenance floor** — a minimal support mechanism
   that activates when diversity drifts below critical threshold
3. **Tolerance of minimum-compliance participation** — agents doing
   the minimum required must be structurally included, not filtered
   out, during the founding and consolidation phases

Any two without the third produces a lesser outcome. All three
together produced the only experiment that reached genuine long-run
stability (Exp 9, survived 50K ticks, predator adapt=0.00 final).

---

## Mechanism Mapping

### 1. Universal Civic Floor (UCF)

*Constella doc: docs/governance/ucf.md*

**ALife evidence:** Exps 5, 6, 7, 9

**What the experiments showed:**

Exp 5 (no floor, drain=1.5): collapse tick 8,743. Baseline
failure mode — sustained pressure without support produces
attrition collapse.

Exp 6 (unconditional floor): collapse tick 7,410 — earlier
than no floor. Unconditional support inflated population beyond
carrying capacity (833/848 agents simultaneously on floor).
Predator adapted to the inflated population. Collapse
accelerated, not prevented.

Exp 7 (tight gate, window=500): survived 50K ticks via
strategy escape, but gate was too tight — entire population
excluded from floor by tick 1,000. Floor was mechanically
present but practically unused.

Exp 9 (15% diversity floor): survived 50K ticks. Adapt reached
0.00 twice. Floor activated ~60 times across 50K ticks, each
activation lasting 17–130 ticks. Minimal intervention,
maximum effect.

**Constitutional principle derived:**

UCF must be a *targeted* floor, not a universal one.
Eligibility requires demonstrated participation signal —
not existence alone. The gate threshold must be calibrated
to actual participation frequency in the target environment,
not set theoretically.

The floor should activate automatically when participation
diversity drops below a minimum threshold, then deactivate
when diversity recovers. It functions as a pulse, not a
constant subsidy.

**External validation:** Elinor Ostrom's commons governance
design principles (1990) independently document that
unconditional resource access without participation
requirements causes commons collapse. The ALife simulation
reproduced this dynamic without citing Ostrom.

---

### 2. Penumbra Accord

*Constella doc: docs/governance/penumbra_accord.md*

**ALife evidence:** Exps 7, 8b, 9

**What the experiments showed:**

The Penumbra state was originally designed as individual
mediation — a liminal zone for participants between active
engagement and exclusion. The ALife findings reveal a second,
systemic function that was not anticipated in the original design.

Exp 8b: the oscillating equilibrium that held for 28,000 ticks
broke when NAKED fraction drifted to zero through random
defender reproduction advantage. Late mutations (ticks 40,000,
43,000) could not re-establish because they arrived into
adapt=1.50 — the founding window had closed.

Exp 9: a floor that specifically maintained minimum NAKED
fraction above 15% prevented this drift. The population of
agents responding to floor activation — the GAMER category —
peaked at 80% of total population during the fragile founding
phase (ticks 5,000–10,000), then naturally declined to near-zero
as stability was established. By tick 30,000, gamers were
essentially absent. The system no longer needed them.

**Constitutional principle derived:**

The Penumbra Accord serves two distinct functions:

*Individual function (original):* mediation zone for
participants experiencing participation difficulty.
Transition support rather than immediate exclusion.

*Systemic function (ALife-derived):* structural maintenance
of minimum participation diversity during founding and
consolidation phases. The Penumbra population is not a
problem to be resolved — it is the mechanism that prevents
strategic monoculture during the periods when the system
is most vulnerable to it.

Governance designs that aggressively resolve all Penumbra
cases toward either full engagement or exclusion may be
removing the diversity maintenance function at exactly the
moment it is most needed.

**Gamer lifecycle finding:** minimum-compliance participants
(those doing the least required to maintain Penumbra status)
are transitional scaffolding. They peak during system
fragility and fade when stability is established. This is
structurally healthy behavior, not a failure mode.

---

### 3. Civic Tome

*Constella doc: docs/governance/civic_tome.md*

**ALife evidence:** Exp 3 (Anticipation Gap)

**What the experiment showed:**

Exp 3 seeded agents with 8-byte genomes containing a
threshold opcode and a pattern memory buffer — no explicit
prediction code. Result: 89.2% anticipatory shielding
emerged. Agents began pre-activating shields before wave
arrival based on remembered patterns. 74 distinct stable
rhythms coexisted without communication between agents.

The anticipatory capacity was not designed. It emerged from
memory plus threshold plus time for rhythms to stabilize.

**Constitutional principle derived:**

Collective governance anticipation — the ability of a
community to respond to threats before they fully materialize
— does not require sophisticated deliberative institutions.
It requires three things: memory of past patterns, clear
decision thresholds, and time for stable rhythms to form.

The Civic Tome's amendment history is the pattern memory.
Decision thresholds are already specified in the framework.
The implication is that a community maintaining its own
history and operating with clear thresholds will develop
genuine anticipatory capacity as an emergent property,
without requiring dedicated predictive infrastructure.

**Design implication:** the Civic Tome should be optimized
for pattern retrieval, not just archival. The history is
the anticipation mechanism.

---

### 4. Astris / Auctor Token System

*Constella doc: docs/governance/tokens_astris_auctor.md*

**ALife evidence:** Exps 5, 6, 7, 8b, 9

**What the experiments showed:**

The energy system in ALife is the closest analog to the
Astris/Auctor token economy. Energy represents participation
capacity — the resource that enables reproduction
(contribution) and shields (civic engagement).

Key dynamics observed across all drain experiments:

The collapse threshold is not the drain rate itself. It is
the ratio between governance complexity scaling speed and
participant adaptation speed. When complexity (predator
adaptation) scales faster than participants can develop
counter-strategies, collapse follows regardless of starting
energy levels.

**Constitutional principle derived:**

Astris decay rate (the drain analog) must scale at most as
fast as participant adaptation capacity, not faster. A
governance system that increases complexity demands faster
than participants can adapt will collapse even if the
absolute resource level appears adequate.

The token system should include a complexity-load monitor —
a measure of how fast governance demands are increasing
relative to demonstrated participant adaptation. When this
ratio exceeds a threshold, new complexity demands should
be paused until adaptation catches up.

---

### 5. Founding Principle — Diversity Before Crisis

*Applies to: core_framework.md, pilot onboarding design*

**ALife evidence:** Exp 8b

**What the experiment showed:**

Condition 3 (50/50 NAKED/DEFENDER seed): the seeded NAKED
agents personally died out by tick 2,000. But in the first
1,000 ticks — before the predator had adapted at all —
their lineage established 858 descendants and made NAKED
the default strategy. The predator never exceeded adapt=0.40
for the following 27,000 ticks because the founding
population had set the strategic mix before specialization
could form.

At tick 40,000 and 43,000, late NAKED mutations appeared
(12 and 4 agents respectively) and died without establishing.
Identical strategy, identical environment parameters —
different outcome solely because they arrived after
adapt=1.50 had formed.

**Constitutional principle derived:**

Structural diversity mechanisms must be present at system
founding, not introduced in response to crisis. A
participation floor, Penumbra zone, or diversity
requirement introduced after the system is already under
maximum governance stress arrives too late to establish
the founding population effect.

For Constella pilots: onboarding design must include
multiple participation modes from day one. The pilot
cannot begin with a homogeneous participant base and
introduce diversity mechanisms later. The founding window
is the pre-stress period — once the first major governance
challenge arrives, late diversity is fragile.

---

### 6. Strategy Escape — Dissolution as Survival

*Applies to: penumbra_accord.md, crisis response protocols*

**ALife evidence:** Exp 7

**What the experiment showed:**

Between ticks 7,000–8,000, the defender-dominant population
collapsed (180→18 defenders) but instead of system collapse,
NAKED strategy swept the population (243→1,160 agents in
3,000 ticks). With no shields in the population, the
adaptive predator had nothing to specialize against.
De-adaptation proceeded from max (1.50) to 0.00 by tick
20,000. Shields restored to 100% effectiveness. New stable
equilibrium held for 30,000 ticks.

**Constitutional principle derived:**

Governance mechanisms under sustained adversarial pressure
(regulatory capture, bad-faith participation, institutional
decay) sometimes survive not by strengthening the contested
mechanism but by temporarily dissolving it. The adversary's
specialization is trait-specific — remove the trait, remove
the selection pressure, allow specialization to decay.

Persistence in a losing defensive posture is itself a
collapse accelerant. The Penumbra Accord's crisis protocols
should include a formal dissolution pathway — the ability
to temporarily suspend a contested mechanism, allow
adversarial pressure to de-adapt, and restore the mechanism
when effectiveness returns.

This is not institutional failure. It is institutional
survival through strategic retreat.

---

## External Seeding Sources

The following external frameworks are recommended for
constitutional seeding alongside ALife evidence. These
represent the most empirically validated governance
literature that converges with simulation findings:

**UN Universal Declaration of Human Rights (1948)**
Foundational dignity and participation rights. Provides
the normative floor that ALife mechanics cannot derive
— values are asserted, not simulated.

**Elinor Ostrom — Governing the Commons (1990)**
Eight design principles for commons governance. Direct
empirical convergence with UCF and Penumbra findings.
Ostrom's "graduated sanctions" principle maps to the
Penumbra Accord. Her "participation in rule modification"
principle maps to the Civic Tome.

**UN Declaration on Rights of Indigenous Peoples (2007)**
Community self-governance and collective rights. Relevant
to pilot design — Constella pilots involve community-level
governance decisions.

**Santa Fe Institute — Complexity and Governance literature**
Particularly: Holland (1992) on adaptive agents, Axelrod
(1984) on evolution of cooperation. Direct analogs to
ALife dynamics.

---

## Epistemic Status Summary

| Finding | Evidence Type | External Validation |
|---|---|---|
| UCF requires participation gate | Simulation (Exp 6 vs 9) | Ostrom (1990), UBI literature |
| Penumbra as diversity maintenance | Simulation (Exp 9) | Novel — not in existing literature |
| Gamer lifecycle as scaffolding | Simulation (Exp 9) | Novel — not in existing literature |
| Founding diversity is load-bearing | Simulation (Exp 8b) | Organizational founding theory |
| Civic Tome as anticipation mechanism | Simulation (Exp 3) | Partial — pattern memory literature |
| Dissolution as survival strategy | Simulation (Exp 7) | Evolutionary escape, civil rights history |
| Complexity/adaptation ratio | Simulation (Exp 5) | Institutional complexity literature |

*Novel findings require empirical validation in human systems
before policy application. Simulation findings with external
validation can inform design decisions with higher confidence.*

---

## 2026-07 Update — Rust `alife-core` reproduction + the floor term-collision

*Added 2026-07. Evidence: `~/ai-stack/projects/alife` (Rust `alife-core`, bit-exact port of
exp0) + its `CONSTELLA_TO_EXPERIMENTS.md`. Per the "never delete" rule this supplements, not
replaces, the March 2026 entries.*

**Cross-repo link (the two halves of the whitepaper).** This bridge doc holds the *claims*;
the fresh *receipts* and the concept→experiment→vocabulary pipeline live in the alife code repo:
`~/ai-stack/projects/alife/CONSTELLA_TO_EXPERIMENTS.md`. Keep them in sync.

**What the Rust runs added (UCF, v1–v3):**

- v1: an unconditional floor gives *resilience* (5/5 seeds survive vs no-floor extinct 3/5) —
  but via **headcount buffering**, not a diversity reserve.
- v2/v3: under a *directional* shock the unconditional floor **froze** composition (787/43
  across 9 regime flips) — survived but never adapted; no-floor went **extinct** on the first flip.

**Reconciliation with Exp 6.** Exp 6's unconditional floor *collapsed* (tick 7,410) because an
**adaptive predator** exploited the inflated floored population; the Rust base sim has **no
adaptive predator**, so the same mechanism produced **stasis** instead. Same cause (unconditional
support → overshoot / over-protected incumbents), two failure modes by whether an adaptive
adversary is present. Both confirm the March conclusion: the floor must be **targeted/pulsed**
(Exp 9), not unconditional.

**Term-collision surfaced (open decision — affects `ucf.md`'s core stance).** "Floor" is doing
two jobs the evidence shows behave *oppositely*:

1. **Dignity/survival floor** (food, shelter, care) — a *values* floor (UDHR; asserted, not
   sim-derivable). Should be **unconditional by right** but **funded/bounded** so it can't drive
   overshoot (a contribution-funded floor is self-limiting — see the Astris joule anchor).
2. **Diversity-maintenance floor** — the Exp 9 pulse preserving strategic diversity. An
   *evidence* floor; must be **targeted/gated** (activate when diversity < threshold, deactivate
   on recovery).
`ucf.md` currently frames one unconditional floor "regardless of contribution"; the evidence
frames a targeted pulse. These are **two mechanisms under one name.** Recommend splitting them in
`ucf.md`. **Jonathan's call — not applied yet.**

**Next sandbox step (v4):** add an adaptive adversary + a threshold-activated (Exp 9-style) floor
to the Rust sim, to test the *targeted* floor directly rather than only the two extremes.

---

*Document owner: Jonathan Morales*
*Last updated: 2026-07 (was March 2026)*
*Next update: After Exp 10 or first pilot data*
*Never delete entries — mark as superseded if revised*
