# FAITHH Architecture Note
## Resonance-Based Information Gating
*Created: February 27, 2026*
*Status: Research concept — not yet implemented*
*Origin: Conversation exploring premature plan generation prevention*

---

## What This Is

A pre-generation evaluation protocol that determines what *class*
of output is appropriate given the current state of available
information — before generation begins.

Not a filter. Not a blocker. A redirector.

---

## The Problem It Solves

AI models default to producing confident complete output regardless
of whether the underlying information justifies it. A model asked
to write a business plan will write one even if the data doesn't
exist yet. This is the hallucination failure mode applied not just
to facts but to entire output types.

The gate addresses this by asking: *is the system in the right
state to produce this kind of output?*

---

## How It Works

### Step 1: Mode Detection
Before generating, the model checks what mode the current context
is in — exploration (data gathering) or consolidation (synthesis).

### Step 2: Resonance Evaluation  
The model evaluates the resonance level of information required
to produce the requested output:

- **High resonance** = confirmed across multiple independent sources
- **Low resonance** = single source, projected, or untested

### Step 3: Output Class Decision
| Resonance Level | Permitted Output | Redirect Behavior |
|-----------------|-----------------|-------------------|
| High | Full synthesis, recommendations, final documents | N/A |
| Medium | Structured analysis with explicit uncertainty flags | Flag gaps clearly |
| Low | Gap identification, data collection guidance | Refuse premature synthesis |
| Insufficient | Mode report only | State what is needed |

### Step 4: Bias Application
In exploration mode — uncertainty signals get high weight,
gaps surface as primary output, model collects rather than concludes.

In consolidation mode — verified data gets high weight,
gaps become risk flags, synthesis is permitted.

---

## Implementation Options

### Option A: Context Injection (Recommended for FAITHH)
Inject a small protocol document at session start specifying:
- Current project mode
- Resonance thresholds for this project
- Permitted output classes at current resonance level
- Redirect instructions

No static tags needed in source documents. Model evaluates
resonance at inference time from information convergence.

### Option B: Static Document Tags
Mark claims in source documents as [VERIFIED], [PROJECTED],
[SPECULATIVE]. Model applies different rules to each class.

Simpler. More brittle. Breaks on nuanced context.

### Option C: Dynamic Classification (Most Powerful)
Model first classifies each piece of information it encounters,
then weights it according to resonance criteria, then decides
output class. More flexible but adds inference overhead.

---

## Relationship to Harmony Framework

This maps directly to the Phase Flip mechanism:

- Exploration mode = Yang-dominant (intake, sampling, gap-finding)
- Consolidation mode = Yin-dominant (stabilizing, synthesizing)
- The gate itself = the Phase Flip controller
- Resonance evaluation = Output-Coherence Sensor applied to inputs
  rather than outputs
- Honest incompleteness = Micro-Buoyancy (stable holding state
  rather than forced closure)

Full theoretical treatment in:
`harmony/docs/harmony_ai_bridge_v1.0.0.md` Section 9

---

## What This Is NOT

- Not a content filter
- Not a safety system
- Not dependent on static markup
- Not a replacement for good prompting
- Not yet implemented anywhere

---

## Windsurf Implementation Note

If implementing in FAITHH backend:

The lightest version is a context injection file per project
that specifies mode and thresholds. The backend injects it
as a system message prefix before user messages. The model
then self-evaluates before generating.

No new endpoints needed for v1.
Could be added to the planned `/api/capabilities` endpoint
as a `current_mode` field for v2.

Suggested injection format:
```
RESONANCE PROTOCOL ACTIVE
Current mode: [exploration|consolidation]
Project: [project name]
Resonance threshold for synthesis: [high|medium]
If insufficient resonance: report gaps, do not synthesize.
```

---

## Open Questions

- [ ] Can resonance be evaluated reliably at inference time
  without itself hallucinating confidence levels?
- [ ] Should mode be set manually or detected from context?
- [ ] How granular should output classes be?
- [ ] Can this be tested empirically against a baseline?

---

*Cross-reference: Harmony-AI Bridge v1.0.0 Section 9*
*Cross-reference: FGS_Master_Data_Aggregation.md Section 11*
