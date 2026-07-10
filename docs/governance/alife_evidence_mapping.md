# ALife Evidence Mapping — Constella Constitutional Basis

*Version: 1.2 — drafted March 2026; Rust civic-floor update (see §2026-07); reconciliation pass 2026-07-08*
*Status: Living document. Updated after each experiment series. The 2026-07-08 pass corrected a refuted
figure (the Exp 3 "89.2%") and added the anticipation / seasons / predictability findings with tiers.*
*Evidence type: Computational simulation (ALife series, Exps 0–9)*
*Epistemic status: Simulation-derived. Findings are consistent with
real-world governance literature where noted. Not empirically validated
in human systems. Treat as mechanistic hypotheses with supporting
precedent, not proven policy.*

---

## Purpose

This document maps findings from the ALife experiment series
(the alife repo (github.com/Nightmarejam/alife), Exps 0–9) to specific Constella
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

> **Scope caveat (2026-07-10).** This three-mechanism result was established under an **adaptive/
> co-evolving adversary** (directional, variation-*removing* pressure) — the regime where the
> diversity floor is decisively load-bearing (confirmed in Rust: `targeted-floor`, 10-seed). The 2026-07
> seasons work found the floor's benefit is **context-dependent**: under purely **cyclical drain** (which
> removes no variation to preserve) a diversity floor is marginal-to-harmful (overshoot). So the
> three-mechanism system is scoped to adversity that *removes variation*; it is not a universal law for
> every stressor. See the seasons boundary + the predictability law below.

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

> **2026-07-09 — direct receipt for the *core* restorative-justice claim.** A Rust agent-vs-agent
> experiment (`pen` mode) confirmed *restorative over punitive*: harm ignored → collapse; restorative
> (repair + reintegrate) beats punitive (exclude) on survival, population and diversity, decisively. See
> `reintegration-over-exclusion` in the 2026-07-09 §C1/C2 below. This is the first *direct* test of the
> Accord's central claim (prior Penumbra evidence was about diversity-maintenance, not restorative justice).

---

### 3. Civic Tome

*Constella doc: docs/governance/civic_tome.md*

**ALife evidence:** Exp 3 (Anticipation Gap)

**What the experiment showed:**

> ⚠️ **[CORRECTED 2026-07 — the `89.2%` figure below is REFUTED.]** The bit-exact Rust
> re-run (exp3 V1–V3) could not reproduce it: the "89.2%" was an unbacked claim. Anticipation
> is real but **conditional** — it emerges reproducibly only under *global/predictable* pressure
> (5/5 seeds under global waves) and **fails** under local/patchy waves (2/5). See the reconciled
> entry in the 2026-07 §"Anticipation" below. The March text is retained per the never-delete rule.

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

*Added 2026-07. Evidence: `~/Projects/alife` (Rust `alife-core`, bit-exact port of
exp0) + its `CONSTELLA_TO_EXPERIMENTS.md`. Per the "never delete" rule this supplements, not
replaces, the March 2026 entries.*

**Cross-repo link (the two halves of the whitepaper).** This bridge doc holds the *claims*;
the fresh *receipts* and the concept→experiment→vocabulary pipeline live in the alife code repo:
`~/Projects/alife/CONSTELLA_TO_EXPERIMENTS.md`. Keep them in sync.

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

## 2026-07-08 Reconciliation pass — anticipation corrected + seasons/predictability added

*Added 2026-07-08. Evidence: `~/Projects/alife` — `CONSTELLA_TO_EXPERIMENTS.md`,
`SEASONS_EXPERIMENT_SPEC.md`, `SYNTHESIS.md`. Supplements, does not replace. **Churn is kept at THIS
evidence-bridge layer by design** — a word is not bound into a governance mechanic (`ucf.md`,
`civic_tome.md`, …) until it is confirmed AND boundary-stable. That is what makes ongoing refinement
safe: corrections edit an entry here instead of cascading through the constitution.*

### Anticipation (Civic Tome) — the `89.2%` refuted; a bounded confirmation kept

The bit-exact Rust exp3 re-run tested the March "89.2%" claim directly:

- **V1 (local waves):** `PROC_PREDICT` evolved but negative anticipation-gaps fired only 2/5 seeds —
  not emergence at the strict bar. The "89.2%" never held.
- **V2 (global waves — predicted in advance from V1's mechanism):** anticipation **CONFIRMS** — 5/5
  seeds fire negative gaps, unseeded. Caveats: episodic/boom-bust, extinction risk under stealth.
- **V3:** mapped the open reaction repertoire (shield/flee/idle/toxin) under global waves.

**Corrected constitutional principle:** emergent collective anticipation is real but **conditional on
the pressure being GLOBAL/PREDICTABLE enough to carry a rhythm to learn.** Memory + threshold + time is
necessary, not sufficient; patchy/local pressure starves it. The Civic Tome's "history is the
anticipation mechanism" stands *only* where a community's threats are regular enough to pattern.

### Seasons — three findings on cyclical (predictable) pressure

Evidence: `SEASONS_EXPERIMENT_SPEC.md` (Rust, multi-seed).

- **`metabolic-thrift` (confirmed refinement).** Under chronic cyclical drain, selection favors the
  *cheapest* regulation; the intuitive "active downregulation / torpor" op is **purged** because its
  per-tick cost outweighs its saving. Cheap inaction beats costly adaptation.
- **Buffering (confirmed pattern).** A population absorbs a predictable cycle *internally* (energy +
  birth-timing), holding headcount roughly flat rather than tracking the cycle in numbers. The system is
  bistable (buffer-flat vs collapse) — no stable large-amplitude population cycle.
- **★ Floor BOUNDARY on UCF (refines the confirmed civic-floor).** Under *cyclical* drain — as opposed
  to the *directional/shifting* shocks where the floor is a clean win — moderate floors give **no**
  survival benefit (within noise, 16 seeds × 2 season shapes) and in sharp winters *lower* mean
  population via food **overshoot**. **The floor's benefit is context-dependent:** it protects against
  adversity that *removes variation* (directional shock → preserve the diversity reserve) but is
  marginal-to-harmful against adversity that *starves a crowd* (cyclical drain → feeds overshoot). This
  bounds `ucf.md`'s scope: the floor is not universally protective.

### Convergence, and the predictability law (asserted synthesis)

Evidence: `SYNTHESIS.md`.

- **Convergence-under-cycles (confirmed).** *Predictable* cyclical pressure — intensity cycles AND
  direction-flipping cycles — drives the population to **converge** on one robust strategy, not diversify.
- **The predictability law (ASSERTED — a pattern across confirmed results, not itself confirmed):**
  *predictability of environmental change governs the optimal strategy and the value of every
  intervention.* Predictable → converge (a diversity floor is overhead). Unpredictable, niche-opening
  shift → diversify (the floor is load-bearing insurance). **Spine SUPPORTED:** under directional flips
  (periodic *and* random) a floor took survival to 14/14 in every floored arm — reaffirming civic-floor
  for shifting pressure.
- **`metronome-vs-reprieve` → REFUTED as general; the effect is STRUCTURE-DEPENDENT (B1, 2026-07-09).**
  The confirmation experiment (a single *global* pulsed stressor, 14 seeds) reversed it: timing-variance
  **monotonically hurts** survival (periodic 11 > inter 6 > random 5). A global stressor kills everyone
  synchronously — no surviving *reservoir* for a reprieve to rescue. The directional-flip crux showed the
  opposite only because *half* the population is stressed at a time. → **new asserted principle: the value
  of unpredictability is STRUCTURE-DEPENDENT** (variance helps only with a differentially-exposed
  reservoir); clean sub-finding *regularity buffers uniform stress*.

### 2026-07-09 — B2 / B3 / B4 confirmations (adaptive adversary + entrainment)

*Three confirmed words earned as bit-exact Rust receipts — reproducing the March Python findings (Exp 9,
Exp 8b) and extending anticipation. Written in the word schema: word / claim / tier / holds-when /
fails-when / receipt. `~/Projects/alife/CONSTELLA_TO_EXPERIMENTS.md` holds the full logs.*

**`targeted-floor` → stable-adaptive regime (CONFIRMED, 10-seed) — reproduces Exp 9.** → `ucf.md`.

- *claim:* a floor preserving only MINORITY strategies keeps an adaptive adversary from ever specializing
  (its `adapt` stays low) → the system stays both ALIVE and ADAPTIVE.
- *holds when:* adaptive/co-evolving adversary + founding diversity — targeted arm adapt LOW (≤0.13 in
  6/10), survives 8/10.
- *fails when:* a non-adaptive stressor (nothing to keep from specializing); not bulletproof (2/10 extinct).
- *paired negatives, reconfirmed in Rust:* `unconditional-floor → stasis` (adapt maxes 1.50 in **10/10** —
  survives, but pure life-support) and `no-floor → gamble` (extinct 3/10). The UCF tension quantified:
  **survival** uncond > targeted > none; **adaptiveness** targeted ≫ none > uncond — only the targeted
  floor is alive *and* adaptive. This is the direct Rust confirmation the March UCF section (Exp 9) rested on.

**`founding-diversity` (load-bearing) (CONFIRMED, 10-seed) — reproduces Exp 8b.** → core_framework.md
"Diversity Before Crisis."

- *claim:* strategic diversity must exist **at founding**; a floor can *preserve* a reserve but cannot
  reliably *create* one after the adversary has begun specializing.
- *holds when:* diverse-founded + targeted floor survives 8/10 (adapt low); mono-founded + same floor only
  5/10, adapt mostly high (predator specialized despite the floor).
- *fails when (boundary):* the floor *occasionally* bootstraps late diversity from mutation → load-bearing,
  not strictly required. Pairs with `targeted-floor` (floor = maintenance, founding diversity = substrate).

**`entrainment` (CONFIRMED, 8-seed).** → ~~Civic Tome~~ **needs a home** (see 2026-07-09 audit note below).

> **RE-HOME (2026-07-09 audit).** An audit survey found `entrainment` does **not** belong in the Civic Tome
> (a *records* system of protocols/precedents/rulings — not a cadence). Entrainment is **rhythmic
> phase-locking to a periodic cycle**, which points at a **missing Constella mechanism: governance cadence
> / rhythm** — regular, scheduled cycles (reviews, renewals, elections) that a community phase-locks to,
> cheaply and anticipatorily, once they are *predictable*. Do not sync entrainment into a mechanic doc
> until that home exists. (`anticipation` *does* stay near the Civic Tome as a soft-match: precedents guide
> future decisions ≈ pattern-memory.)

- *claim:* under a predictable periodic resource rhythm, a population's internal clock **locks to the
  environment period and tracks it**; phase alignment is nurture-dominant (environmental calibration) with
  nature (heritable phase) adding on top.
- *holds when:* the rhythm is a *meaningful* fitness factor (short-enough period). P=40 & 60 → 100%
  period-lock (15/16), internal period follows P. Nature/nurture gradient (harvest/agent/pulse):
  **neither 0.64 < nature 0.84 < nurture 0.97 < both 1.02** — always both, at a nurture-dominant ratio.
- *fails when (boundary):* long period / gentle economy (P≥80 → the pulse is optional → nothing selects
  for locking → entrainment collapses). *Entrainment needs the rhythm to matter.*
- *governance note:* grounds "nature vs nurture is always both, in different ratios"; extends
  `anticipation` from **reflexive** (react to a sensed threat) to **rhythmic** (run on an internal clock
  the environment calibrates).

### 2026-07-09 — C1 / C2 confirmations (Astris speed-limit + Penumbra restorative justice)

**`adaptation-speed-limit` (CONFIRMED, 12-seed ratio grid) — reproduces Exp 5.** → `tokens_astris_auctor.md`.

- *claim:* under an adaptive adversary, collapse is set by the **ratio** of the adversary's specialization
  speed to the agents' adaptation speed — not by absolute resources. A *speed* limit, not a resource limit.
- *holds when:* survival falls as adversary rate `RISE` climbs AND rises as agent mutation rate `MUT`
  climbs; the ~50%-survival threshold `RISE` **scales with `MUT`** (0.5→≈0.01, 1.0→≈0.02, 2.0→≈0.05).
- *fails when (boundary):* extreme adversary speed defeats even fast agents; very high `MUT` destabilizes
  (loses good genomes) — the ratio law holds in a mid-range.
- *governance note:* **Astris decay / governance-complexity must scale at most as fast as participant
  adaptation** — else collapse regardless of resource level.

**`reintegration-over-exclusion` (CONFIRMED, 10-seed) — first agent-vs-agent test.** → `penumbra_accord.md`.

- *claim:* harm must be addressed (ignoring it collapses the community), and a **restorative** response
  (repair the victim + rehabilitate & keep the harm-doer) preserves the community diversity that a
  **punitive** response (exclusion) erodes.
- *holds when:* harm is fatal-if-ignored + recurs. At HARM=40/DETECT=0.1: **none 1/10** (collapse) <
  **punitive 7/10, pop 350, diversity 12.4** < **restorative 10/10, pop 836, diversity 32.7.** Restorative
  wins on survival, population, AND diversity; the punitive/restorative gap **widens with recurrence**
  (exclusion's cost is cumulative).
- *fails when (boundary):* if harm is *survivable*, laissez-faire scores fine and intervention costs some
  diversity — the claim needs harm that actually threatens the community.
- *provenance note:* this experiment exists because an **AUDIT survey** caught that an earlier candidate
  mapping (Exp 7 "strategic-dissolution") did **not** match `Penumbra_Accord.md` (restorative justice).
  Realigning onto the doc's real mechanism gave `Penumbra_Accord.md`'s central claim (restorative over
  punitive; reintegration returns participants to full standing) its first sandbox receipt. It also is the
  first activation of the dormant `toxin` op. (The Exp 7 "dissolution" idea is a *crisis-response* finding,
  not restorative justice — do not file it here.)

### 2026-07-09 — C3 confirmation (cultural transmission) + C4 in progress

**`transmission-trades-diversity` (CONFIRMED, 10-seed) — resolves Exp 8's mixed 2/4.** → `civic_tome.md`
(Precedents).

- *claim:* horizontal copying of the currently-successful strategy (cultural transmission / precedent-
  following) is a **bounded, double-edged** mechanism: a *narrow* dose coordinates the community and lifts
  survival, but it **monotonically erodes standing diversity** and past a threshold causes brittle collapse.
- *holds when:* adaptive adversary. Survival is a **hump with a cliff** (TRANSMIT 0→0.005 lifts 8/10→10/10
  via coordinated "dodging"; 0.01→0.02→0.05 falls 8→6→**0/10**); diversity collapses monotonically
  (7.1→2.0→0). Even the beneficial band is a near-monoculture *in motion*.
- *explains:* Exp 8's **2/4** = rate-dependent, not a flaky experiment.
- *governance note:* **precedent-following must be bounded** — it coordinates fast but homogenizes → erodes
  the diversity reserve → brittleness. Balance precedent with preserved dissent/diversity. (A cleaner
  Civic-Tome receipt than the `anticipation` soft-match.)

**C4 — `interface → diversity` (IN PROGRESS, honest negative so far).** Tests the predictability law's
untested diversity-half. First design (penalty-defined spatial zones) does **not** maintain diversity — one
strategy floods both zones (competitive exclusion / **Gause's principle**), even at near-lethal penalty.
Redesign pending: true **resource partitioning** (separate per-zone carrying capacity). No word yet.

### Word-status ledger (this bridge = the revisable layer)

| word / finding | tier | receipt |
|---|---|---|
| civic-floor → resilience (directional/shifting pressure) | **confirmed** | `ucf.md`; §above (14/14) |
| civic-floor is context-dependent (cyclical drain → overshoot) | **confirmed boundary** | SEASONS Step 3 |
| anticipation (conditional on global/predictable pressure) | **confirmed (bounded)** | exp3 V2 — supersedes 89.2% |
| metabolic-thrift (cheap regulation wins; torpor purged) | **confirmed refinement** | SEASONS Step 1 |
| buffering; convergence-under-cycles | **confirmed** | SEASONS Steps 2 & 4 |
| targeted-floor → stable-adaptive regime | **confirmed** | B2 (Exp 9 in Rust); `ucf.md` |
| unconditional-floor → stasis; no-floor → gamble | **confirmed negatives** | B2 |
| founding-diversity (load-bearing; must precede the crisis) | **confirmed** | B4 (Exp 8b in Rust) |
| entrainment (internal clock locks to & tracks the environment rhythm) | **confirmed** (re-home: needs a *governance cadence* mechanism, not Civic Tome) | B3 |
| transmission-trades-diversity (precedent-following is bounded & double-edged) | **confirmed** | C3 (resolves Exp 8's 2/4); `civic_tome.md` |
| adaptation-speed-limit (collapse is the adversary/agent speed ratio) | **confirmed** | C1 (Exp 5 in Rust); `tokens_astris_auctor.md` |
| reintegration-over-exclusion (restorative beats punitive; harm must be addressed) | **confirmed** | C2 (agent-vs-agent); `penumbra_accord.md` |
| predictability law (predictable→converge / unpredictable→diversify) | **asserted** (spine supported) | SYNTHESIS.md |
| unpredictability's value is structure-dependent | **asserted** | B1 + flip crux |
| regularity-buffers-uniform-stress | **candidate** | B1 (14-seed monotonic) |
| metronome-vs-reprieve (predictable-relentless deadlier than random) | **refuted (general); bounded to differential stress** | B1 |
| "89.2% anticipatory shielding" | **REFUTED** | see §Civic Tome correction above |

**Toward the confirmed-vocabulary goal:** only *confirmed*-tier words should inform mechanic design;
*asserted* and *candidate* entries stay in this bridge until their receipts harden. This layer is where
the count of confirmed words is tracked as the sandbox earns them.

---

*Document owner: Jonathan Morales*
*Last updated: 2026-07-09 (C3 word-sync + entrainment re-home; was March 2026)*
*Next update: After Exp 10 or first pilot data*
*Never delete entries — mark as superseded if revised*
