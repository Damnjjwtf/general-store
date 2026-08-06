# Research stack

The tools that feed `research/` (real-world inspiration → texture for the fiction). Built up in layers; this is the running record so we don't mistake plans for working integrations.

## Wired now

### last30days — `last30days@last30days-skill`
[mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill). Researches a topic across Reddit, X, YouTube, HN, Polymarket, arXiv, and the web, then writes a **cited** summary.

- **Enabled** as a plugin in `.claude/settings.json` (loads each session like ponytail).
- **Invoke:** `/last30days <topic>` — e.g. `/last30days period dramedies that sold in 2026`.
- **Keys:** none required (free sources work out of the box). Optional keys unlock more sources (X/Twitter, ScrapeCreators for TikTok/IG, Brave, Perplexity); they live in `~/.config/last30days/.env`, never in this repo.
- **Runtime:** needs Python 3.12+. This environment ships 3.11 but has `uv`, which the skill uses to bootstrap its own 3.12 on first run. If a run complains about Python, that's the fix to check.

**Best use for *this* project (a period piece):** recency isn't for researching the past — it's for the **market and the audience**. Use it at pitch/deck stage for comps ("what warm period dramedies are selling / how did *Lessons in Chemistry*, *Julia* land"), casting-climate, and buyer appetite. Not a source of 1950s–70s texture.

### Exa — semantic web search (MCP) — *wired, pending key*
[exa-labs/exa-mcp-server](https://github.com/exa-labs/exa-mcp-server) (`exa-mcp-server@3.x`). Semantic search that finds period detail, archival sources, and tonal comps keyword search misses — **the real research engine for `research/`.**

- **Config:** `.mcp.json` at repo root runs `npx -y exa-mcp-server` with `EXA_API_KEY` pulled from the environment (the key is **never** committed). Note: this is the Claude-Code-native path — independent of GenLens's own `GENLENS_EXA_ENABLED` flag.
- **Tools it adds:** web search, research-paper search, company research, URL crawling — callable directly by the agent.
- **To switch on:** add `EXA_API_KEY` to the environment variables (Claude Code web env settings), same place as the GBrain keys. On next session, Claude Code will ask you to approve the `exa` project MCP server — approve it once.
- **Status now:** config committed; `EXA_API_KEY` not yet in the environment, so the tools won't load until you add it.

### Browser Use — agentic browser (MCP) — *wired, pending key*
[browser-use/browser-use](https://github.com/browser-use/browser-use). An LLM-driven browser that navigates, clicks, and extracts — for **deep archival digs** Exa can't reach on its own (digitized catalogs behind pagination, newspaper/museum collections, gated archives).

- **Config:** `.mcp.json` runs `uvx --from browser-use[cli] browser-use --mcp`. First launch uses `uvx` to install browser-use (one-time, needs network). Pointed at this environment's **pre-installed Chromium** (`PLAYWRIGHT_BROWSERS_PATH=/opt/pw-browsers`, `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1`) so it doesn't hit the blocked Playwright download.
- **Needs an LLM key** to drive the browser — set `OPENAI_API_KEY` in the env (also covers GBrain embeddings). Browser Use can be pointed at Anthropic/Gemini instead via its own config if you prefer.
- **Note:** this is the Claude-Code-native MCP path — independent of GenLens's `GENLENS_BROWSER_ENABLED` VPS flag.
- **Status now:** config committed; `OPENAI_API_KEY` not yet in the environment, so it won't load until you add it.

### NotebookLM — source synthesis (MCP) — *wired, pending Google auth*
[teng-lin/notebooklm-py](https://github.com/teng-lin/notebooklm-py). Unofficial NotebookLM client: ingest a pile of period sources into a notebook, then **query and synthesize** them (grounded answers with citations, even audio overviews) — the "make sense of the research pile" layer.

- **Config:** `.mcp.json` runs `uvx --from notebooklm-py[browser] notebooklm-mcp` (stdio). First launch `uvx`-installs it once.
- **Auth is the gate, not an API key.** NotebookLM has no official API — the tool drives your logged-in Google session. This headless container has no browser session, so the only workable path is the **inline cookie payload**:
  1. On **your own machine**: `uv tool install "notebooklm-py[browser]"` then `notebooklm login` (or `notebooklm login --browser-cookies chrome`). Verify: `notebooklm auth check --test`.
  2. That writes `storage_state.json`. Put its **entire contents** into the env var `NOTEBOOKLM_AUTH_JSON` in the Claude Code web env settings (it's your Google session — env only, never committed, and it expires, so it'll need refreshing).
- **Status now:** config committed; `NOTEBOOKLM_AUTH_JSON` not set, so it won't load until you complete the login and paste the payload.

## Environment inputs — switch the whole stack on

Add these in the Claude Code web env settings (never in chat, never in the repo). Then, next session, approve each project MCP server once.

| Env var | Turns on | Where it comes from |
| --- | --- | --- |
| `EXA_API_KEY` | Exa semantic search | Exa dashboard |
| `OPENAI_API_KEY` | Browser Use (drives the browser) **+** GBrain embeddings | OpenAI |
| `GBRAIN_DATABASE_URL` | GBrain persistent memory | Supabase Session Pooler URL |
| `NOTEBOOKLM_AUTH_JSON` | NotebookLM | `notebooklm login` on your machine → `storage_state.json` contents |

Priority order for a period piece: **Exa** (broad semantic reach) → **Browser Use** (deep archival) → **NotebookLM** (synthesis). last30days is the market-intel corner, not period texture.

## Where research goes
Everything gathered lands in `research/` as **inspiration, not canon** (see `research/README.md`). It only becomes binding when a detail is deliberately moved into `bible/`.
