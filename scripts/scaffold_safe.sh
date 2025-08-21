#!/usr/bin/env bash
set -euo pipefail

# Create folders (safe if they already exist)
mkdir -p docs/governance docs/doctrine docs/pilots docs/process docs/assets

create_if_missing () {
  local path="$1"
  shift || true
  if [ -e "$path" ]; then
    echo "✔ exists: $path (leaving as-is)"
  else
    echo "➕ creating: $path"
    # shellcheck disable=SC2129
    cat > "$path" <<EOF
$@
EOF
  fi
}

# --- Files (guarded) ---

create_if_missing docs/governance/core_framework.md '# Constella Core Framework — Purpose & Flow (v1.0)

## I. Foundational Purpose
Constella reimagines civic life as a **regenerative, resonant system**:
- **Continuity** across generations
- **Resonance** of contributions
- **Equity** via a dignified floor (UCF)

## II. Flow of the Framework
1. **Genesis Pool (Origin Flow)** → Astris minted from contribution enters circulation.  
2. **Thread Initiation (Idea Flow)** → proposals grouped into civic threads.  
3. **Civic Orchestration (Decision Flow)** → rotating facilitation; Auctor balances Astris.  
4. **Execution & Vaults (Resource Flow)** → funded threads execute; vaults hold pooled resources.  
5. **Civic Tome (Memory Flow)** → open record of decisions, precedents, outcomes.  
6. **Penumbra Accord (Shadow Flow)** → compassionate handling of edge cases/failures.  
7. **Feedback & Decay (Entropy Flow)** → Astris decay, audits, sunsets to prevent ossification.

**Starting Line:** Genesis → Threads → Orchestration. Everything else flows downstream.

## III. Pillars (Anchor Nodes)
- **Civic Orchestration** — thread governance, rotation, facilitation pool.  
- **Civic Tome** — transparent precedent/memory.  
- **Penumbra Accord** — compassionate law/ethics for edge cases.  
- **Astris / Auctor** — merit currency / equal civic voice.  
- **UCF** — voluntary floor via Open Palm Protocol.  
- **Eden / Mobility / Settlement** — applied infrastructure pilots.

## IV. Harmonized Pairings
- Genesis ↔ birth of possibility  
- Threads ↔ civic imagination  
- Orchestration ↔ collective rhythm  
- Vaults ↔ grounded resources  
- Tome ↔ memory against amnesia  
- Accord ↔ compassion in shadows  
- Decay ↔ renewal through release
'

create_if_missing docs/governance/map_of_intent.md '# Map of Intent — Civic Tome Inclusion (v1.0)

## Purpose
The Map of Intent clarifies **why actions are taken**, not only what they are. It functions as a guiding compass for participants by linking every civic effort to shared intent. This ensures that decisions, contributions, and experiments remain coherent across diverse contexts.

## Core Principles
1. **Intent Before Action** — Each proposal, thread, or vault begins with an explicit statement of intent.  
2. **Transparency of Motives** — Rationales are documented openly and mapped to pillars.  
3. **Flow over Fixation** — Intent evolves as understanding grows. Updates reflect refinement.  
4. **Resonant Coherence** — Intents align to framework pillars to create harmonics across efforts.

## Structure of the Map
- **Individual Intents** — each participant articulates purpose before engaging.  
- **Thread Intents** — each civic thread has a distilled intent guiding its scope.  
- **Collective Intents** — the broader map shows convergence points (shared aims).

## Function
- **Pre-commitment tool** (anchoring motivation)  
- **Conflict reference** (return to stated intent when disputes arise)  
- **Continuity mechanism** (future participants can understand original drivers)

## Lifecycle
1. **Declaration** → state intent clearly at the start.  
2. **Integration** → align intent with pillars and cross-threads.  
3. **Reflection** → evaluate outcomes against intent.  
4. **Revision** → update or retire to maintain coherence.

## Starting Line
- **Constella (meta-intent):** weave civic intelligence into a living framework for regenerative societies.  
- **Astris:** reward contribution and encourage ongoing vitality.  
- **Auctor:** preserve equality of civic voice.  
- **Penumbra Accord:** extend compassion and lawful balance to edge cases.  
- **Eden:** retrofit land and housing for livability and resilience.  
- **UCF:** guarantee dignity and survival through shared support.

These form the **anchors of intent** from which all subsequent civic actions branch.
'

create_if_missing docs/governance/tokens_astris_auctor.md '# Tokens: Astris & Auctor (v1.0)

## Astris — Contribution / Merit
- **Minting:** issued on accepted, verifiable contributions to civic threads.
- **Use:** fund vaults, back pilots, optionally pool into UCF.
- **Decay:** unused balances decay gradually → keeps circulation alive.

## Auctor — Civic Voting Weight
- **Allocation:** equal baseline per person; non-transferable.
- **Use:** steer thread priorities and guardrails.
- **Balance:** prevents Astris accumulation from dominating governance.

## Interplay
- Auctor (voice equality) balances Astris (merit incentive).
- All decisions + token flows logged in the **Civic Tome**.
'

create_if_missing docs/governance/ucf.md '# Universal Civic Floor (UCF) — Open Palm Protocol (v1.0)

**Intent:** Guarantee dignity and basic security for contributors without coercive taxation.

## Mechanism
- **Voluntary Pooling:** contributors can route a % of Astris to UCF.
- **Eligibility:** active participation or verified need via thread facilitators.
- **Transparency:** disbursements recorded in the Civic Tome.
- **Renewal:** periodic review; thresholds adapt to local costs.

## Outcomes
- Stabilizes early contributors.
- Reduces systemic fragility.
- Encourages re-entry after setbacks.
'

create_if_missing docs/governance/penumbra_accord.md '# Penumbra Accord — Compassionate Edge-Case Doctrine (v1.0)

**Intent:** Hold human dignity where rules fall short.

## Scope
- Harms, failures, ambiguity, dissent.

## Process
1. Context & intent review  
2. Restorative options first  
3. Minimal coercion; proportionality  
4. Record precedent in the Civic Tome
'

create_if_missing docs/governance/civic_tome.md '# Civic Tome (stub)

The Civic Tome is the public log of decisions, precedents, outcomes, and lessons.
- Purpose: transparency, memory, refinement.
- Format: decisions, intents, outcomes, precedent notes.

[Content WIP — populated as governance threads record outcomes.]
'

create_if_missing docs/process/flow.md '# Process Flow (v1.0)

**Spark → Filter → Weave → Elevate → Reflect**

- **Spark:** seed idea with an intent statement.
- **Filter:** align with pillars; tag dependencies.
- **Weave:** form a thread; assign facilitators.
- **Elevate:** resource via vault; execute pilot.
- **Reflect:** publish outcomes to the Tome; revise or sunset.
'

create_if_missing docs/pilots/gaia.md '# Project Gaia — Pilot

**Intent:** Explore ecological regeneration in housing, food, and energy.

- **Scope:** modular retrofits, ecological corridors, shared commons.
- **Links:** UCF on-ramps for trainees; Eden retrofits as infrastructure base.
- **Tome Hooks:** record ecological and social outcomes.
'

create_if_missing docs/pilots/sky.md '# Project Sky — Pilot [WIP]

**Intent:** Design civic mobility zones and aerial infrastructure concepts.

[Details pending development.]
'

# Keep assets folder tracked
[ -f docs/assets/.gitkeep ] || :> docs/assets/.gitkeep

echo "✅ Non-destructive scaffold complete."
