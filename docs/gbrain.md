# GBrain — persistent memory for General Store

[GBrain](https://github.com/garrytan/gbrain) is Garry Tan's markdown-first, Postgres-backed agent-memory layer that pairs with gstack. It ingests markdown and **auto-wires a typed knowledge graph** (no LLM calls for extraction), then exposes it to the agent over MCP so continuity, characters, and decisions survive across sessions instead of starting blank every time.

For this project it's the memory for `bible/` + `research/`: the graph defined in `bible/graph.md`, made queryable.

## Status

**Substrate ready, runtime not yet live.** The bible is being written brain-ready (`bible/graph.md`, `bible/characters/_TEMPLATE.md`), so GBrain will produce a rich graph the moment it's pointed here. The live runtime needs two things this ephemeral cloud session can't supply safely:

1. **A persistent database.** This environment wipes `~/.gbrain` / `~/.gstack` between sessions, so a local PGLite brain would evaporate each session. The brain must live in **cloud Postgres (Supabase)** to persist — that's Path 1 below.
2. **Secrets** — the DB connection string and an embedding-provider key. These are yours; I should not paste or hold them. You run the one-time init.

## One-time setup (you run this — it needs your secrets)

From the gstack skill suite (installed via the workflow-layer hook):

```
/setup-gbrain
```

Pick **Path 1 (Supabase, existing connection string)** so the brain persists across these ephemeral sessions. You'll paste your Supabase Session Pooler URL (port 6543); the skill reads it with echo off and never writes it to shell history. It then:
- runs `gbrain init` against that DB,
- registers the MCP server for Claude Code (`claude mcp add gbrain -- gbrain serve`),
- sets this repo's trust policy — choose **read-write** (our own project),
- writes a `## GBrain Search Guidance` block into `CLAUDE.md`.

Embedding key: set `OPENAI_API_KEY` (or `VOYAGE_API_KEY`) before `/sync-gbrain` so the graph/embeddings can build.

> Prefer to try it with zero cloud first? Path 3 (`gbrain init --pglite`) works with no account, but the brain won't survive this environment's session reset — fine for a one-session demo, not for real continuity.

## Keeping it current

```
/sync-gbrain            # incremental, seconds on a clean tree
/sync-gbrain --full     # full reindex
```

Run it after substantial `bible/` or `scripts/` changes so the graph reflects new canon.

## What we get, mapped to this project

- `gbrain search "what did we decide about the protagonist's sister?"` → finds the prior bible page/decision, not a blank slate.
- The typed graph from `bible/graph.md` powers the continuity queries listed there (dangling refs, timeline drift, engine coverage) as real queries, not grep heuristics.
- Cross-session memory of plans/retros/decisions via the gstack ↔ GBrain integration.

## What I need to flip it live (two inputs, both secrets → not via chat)

Checked this environment: `gbrain` isn't installed, the `claude` CLI **is** present (so MCP registration will work), but there is **no embedding key and no DB URL** available. Both are yours to supply. The safe way is to add them as **environment variables** in the Claude Code web env settings (never pasted into chat, never committed):

- `GBRAIN_DATABASE_URL` — your Supabase **Session Pooler** URL (port 6543). Cloud, so the brain persists across these ephemeral sessions.
- `OPENAI_API_KEY` (or `VOYAGE_API_KEY`) — for embeddings during sync.

Once those exist in the environment, I (or the workflow-layer hook) run `/setup-gbrain` (Path 1) → `/sync-gbrain`, set this repo's policy to **read-write**, and I confirm a write→search round-trip. A one-session PGLite demo is possible too, but it still needs an embedding key and won't persist — so cloud is the right call.
