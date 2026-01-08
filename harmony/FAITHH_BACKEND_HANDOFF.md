FAITHH Temporary Backend – Handoff Document

Status: Working / Incremental / Safe to Reset
Last Verified: Local WebUI provider responding correctly on port 7001 via backend on 5560

1. Purpose of This Backend

This backend (faithh_backend_temp_v2.py) is a temporary but production-shaped API layer for FAITHH, intended to:

Sit between the FAITHH PET UI (HTML frontend) and multiple LLM providers

Route requests honestly and transparently

Provide clean upgrade points for:

project context injection

RAG

tool execution

Be safe to break, reset, or replace entirely after Opus review

It is not the final architecture — it is a scaffold.

2. What Is Currently Working (Confirmed)
2.1 Runtime

Python backend running inside a virtual environment

Flask + CORS enabled

Port configurable via environment variable (currently 5560)

2.2 Providers

The backend supports three provider classes:

Provider	Status	Notes
local_webui	✅ Working	text-generation-webui OpenAI-compatible API on port 7001
ollama	⚠️ Enabled but secondary	Available, not primary for FAITHH
groq	❌ Disabled	No API key configured

Routing metadata is returned on every response.

2.3 Confirmed Endpoints
Health
GET /health


Returns:

provider availability

default models

backend OK status

Chat
POST /api/chat


Payload example:

{
  "message": "Ping",
  "provider_preference": "local"
}


Confirmed behavior:

Routes to local_webui

Responds correctly

Returns routing + usage metadata

3. Current Limitations (By Design)

The system does NOT currently:

Read local files

Inspect the filesystem

Execute shell commands

Modify files

Know anything about the FAITHH project unless explicitly told

This is intentional for safety and clarity.

Any AI interacting with FAITHH must assume zero ambient knowledge unless context is injected.

4. Why the Model Answered “I Don’t Know”

This behavior is correct.

Example:

“List the files in ~/ai-stack and summarize ARCHITECTURE.md”

The model responded:

It cannot see the filesystem

It requires file contents to be provided

This confirms:

No accidental tool access

No hallucinated authority

Backend honesty is intact

This is a success condition, not a failure.

5. UI Connectivity Status

FAITHH PET v4 HTML was patched via sed to point to backend on http://localhost:5560

Connectivity confirmed

UI → Backend → WebUI chain works

This is functionally equivalent to using the older backend on 5557, but cleaner and more modular.

6. Architectural Shape (Mental Model)
FAITHH PET UI (HTML)
        |
        v
FAITHH Flask Backend (5560)
        |
        |-- local_webui → text-generation-webui (7001)
        |-- ollama      → localhost:11434
        |-- groq        → api.groq.com (disabled)


The backend:

Normalizes request format

Selects provider

Adds routing metadata

Is the only place future tools should be attached

7. Planned / Next Additions (Not Yet Implemented)

These were discussed but not yet merged, and should be added incrementally:

7.1 Project Context Injection (Highest Priority)

Goal:

Allow FAITHH to understand the project without lying

Mechanism:

Environment variable:

FAITHH_CONTEXT_FILES="ARCHITECTURE.md;README.md;START_HERE.md"


Backend reads files

Injects them as a system message before user message

Truncated to safe token length

This is not RAG — it is deterministic context seeding.

7.2 /api/status and /api/capabilities

Purpose:

Allow UI (and humans) to query:

what FAITHH can do

what it explicitly cannot do

which providers are available

This prevents:

hallucinated abilities

UI mismatch

silent backend drift

7.3 RAG / Chroma (Deferred)

Not needed yet.
Context injection alone is sufficient for current phase.

8. Reset Philosophy (Important)

This backend is designed so that:

If broken → delete and recreate

If confused → re-read this file

If upgraded → replace entirely

No hidden state should ever exist outside:

environment variables

explicit config

code

This keeps FAITHH auditable and explainable.

9. Guidance for Future AI (Opus or Otherwise)

If you are an AI reading this:

Do not assume filesystem access

Do not assume prior conversation context

Treat FAITHH as:

a routing backend

with honest capability boundaries

Prefer explicit additions over implicit behavior

If in doubt: add a status endpoint before adding power

10. Current Verdict

✅ Connectivity confirmed
✅ Routing honest
✅ Local model responding
✅ Safe baseline established

This is the correct point to pause, archive chat history, and continue later.