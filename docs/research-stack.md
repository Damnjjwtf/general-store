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

## Roadmap (next layers)

| Layer | Repo / flag | What it adds here | To switch on |
| --- | --- | --- | --- |
| **Browser Use** | [browser-use/browser-use](https://github.com/browser-use/browser-use) (`GENLENS_BROWSER_ENABLED`) | deep archival digs (digitized catalogs, newspaper/museum collections) | enable flag + provision the VPS venv |
| **NotebookLM** | [teng-lin/notebooklm-py](https://github.com/teng-lin/notebooklm-py) | ingest a pile of period sources, query/synthesize them (even audio overviews) | complete Google auth |

Priority order was **Exa** first (done — broad semantic reach), then **Browser Use** (deep archival), then **NotebookLM** (synthesis). last30days is the market-intel corner, not the period-texture corner.

## Where research goes
Everything gathered lands in `research/` as **inspiration, not canon** (see `research/README.md`). It only becomes binding when a detail is deliberately moved into `bible/`.
