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

## Roadmap (next layers — installed elsewhere in the operation but not on for this project)

| Layer | Repo / flag | What it adds here | To switch on |
| --- | --- | --- | --- |
| **Exa** | semantic web search (`GENLENS_EXA_ENABLED`) | finds period detail, archival sources, tonal comps that keyword search misses — the real research engine for `research/` | set the flag + Exa key in env |
| **Browser Use** | [browser-use/browser-use](https://github.com/browser-use/browser-use) (`GENLENS_BROWSER_ENABLED`) | deep archival digs (digitized catalogs, newspaper/museum collections) | enable flag + provision the VPS venv |
| **NotebookLM** | [teng-lin/notebooklm-py](https://github.com/teng-lin/notebooklm-py) | ingest a pile of period sources, query/synthesize them (even audio overviews) | complete Google auth |

Priority for a research-heavy inspired-by project: **Exa** first (broad semantic reach), then **Browser Use** (deep archival), then **NotebookLM** (synthesis). last30days is the market-intel corner, not the period-texture corner.

## Where research goes
Everything gathered lands in `research/` as **inspiration, not canon** (see `research/README.md`). It only becomes binding when a detail is deliberately moved into `bible/`.
