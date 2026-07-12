# The Adaptive Loop — how the ecosystem builds (and eventually amends) itself

*The pipeline that connects the sandbox, the constitution, the record, and the model — and how the system
learns to propose its own policies once it is "out of one person's hands," positively and with receipts.
Tier: the first half is built; the second half (dataset → model → self-amendment) is design/aspiration,
marked as such.*

## It is a loop, not a line

Each layer feeds the next, and the last feeds back into the first:

1. **ALife sandbox → receipts.** The sandbox *earns* confirmable words (`tier / holds-when / fails-when /
   receipt`) by multi-seed reproduction. It also honestly *refutes* claims (nothing faked).
2. **Constitution (Constella) ← grounded in receipts.** Mechanisms are grounded in the earned words via the
   [evidence bridge](alife_evidence_mapping.md); the sandbox is the *processor's proving ground.*
3. **Constitution → new boundary → back to test.** When the constitution proposes a *new* boundary
   (from the heart), it goes **back to the sandbox** for whatever is testable — and to the **real world**
   for whatever isn't. This is the bidirectional edge: the constitution raises questions the sandbox and
   real cases answer. *(This is what the harm-gradient / privacy-dial boundaries are waiting on now.)*
4. **Civic Tome ← real cases accumulate.** What the sandbox can't test (human-values boundaries) is backed
   by real entries in the [Civic Tome](civic_tome.md), recorded in the shared
   [observation shape](observability_layer.md) — confirmable, nuanced, tiered.
5. **Dataset ← words + entries + nuance.** Everything — sandbox words *and* Tome entries — is already in one
   shape (`WORD_SCHEMA` / observation atom). That shape *is* the training-data row. No translation needed.
6. **Model ← trained on the constitution + its receipts.** The dataset trains FAITHH (see the two-tier
   design below).
7. **Model → helps amend the constitution → back to step 1.** The loop closes: the model the constitution
   trained helps the constitution *evolve* — the self-amendment mechanism below.

## The two-tier model (your "central processing unit + Net Navi arms")

- **Power unit** — a large central model: deep reasoning, reads the whole Tome, drafts amendment
  *proposals*, holds the full constitution. The "central human processing unit."
- **Navi arms** — small, efficient models that run on most devices: they do the *cyclical work* — populate
  the Tome, attest observations on the [Cadence](governance_cadence.md) beats, act as each person's local
  agent. Many small, reversible acts (the Harmony "micro-stabilizer"), not one big brain everywhere.

The two tiers are the same architecture you already named — one processor, many arms.

## The self-amendment loop (the heart of the question)

How the system helps build its own policies once it is out of one person's hands — **positively,
reflectively, and safely:**

1. **Reflect.** The power-unit model reads the accumulating Tome and *detects when a boundary is
   consistently backed by evidence* (or consistently failing) — the civic equivalent of a sandbox word
   confirming across seeds.
2. **Propose, with receipts.** It drafts an amendment **carrying its evidence** — *which* entries back it,
   at what tier — and frames it constructively (the Harmony return-loop: reflect on what the record shows,
   propose gently; not an adversarial ruling).
3. **Humans decide.** The proposal enters the *existing* [Civic Tome amendment process](civic_tome.md)
   — `Proposal → Auctor Vote → Validator Concurrence → Red-Team Window → Tome Diff`. **The model proposes;
   people ratify.** Out of *your* hands — never out of *humanity's.*
4. **Update, then relearn.** A ratified amendment updates the constitution; the model retrains/updates on
   it; the loop returns to reflection.

**Why this stays safe (the guardrails are already in the architecture):**

- **Evidence-gated.** Nothing is promoted without receipts; the `stable / contested / speculative` tiers
  govern promotion — an amendment can't jump from speculative to policy without accumulated backing.
- **Model proposes, humans decide.** The model is the *observability and reflection engine*, never the
  sovereign. The `Auctor Vote` + `Red-Team Window` are the human veto.
- **No moral high ground.** Amendments *observe and adapt*; they don't impose a new moral standard
  (`harm_and_repair.md`). The system stays a mirror and a proposer, not a judge.
- **Reversible + versioned.** Every change is a `Tome Diff` — auditable, revertible. Many small corrections
  over rare large ones.

## Where we are on the loop (honest status)

| step | status |
|---|---|
| 1 sandbox → receipts | ✅ built (~16 confirmed words) |
| 2 constitution grounded | ✅ built (evidence bridge, zero drift) |
| 3 new boundaries → test | 🟡 in progress (heart-layer drafted; boundaries await evidence) |
| 4 Civic Tome record | 🟡 structure built (entry format); real entries pending |
| 5 dataset | ⚪ gated by the rig |
| 6 model (two-tier) | ⚪ future |
| 7 self-amendment | ⚪ design/aspiration (this doc) |

The first half of the loop is real. The second half is the road ahead — and the self-amendment step is the
horizon: the point where the constitution you grounded in receipts learns to keep grounding *itself.*
