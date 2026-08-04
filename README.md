# General Store

One-hour period **dramedy**. Working title. A **fiction inspired by** Chuck Williams and the specialty-retail revolution — not a biography. The real man is a seed; the protagonist and world are invented.

**Premise is open.** No setting is committed yet (a Black proprietor in 1970s Chicago is one live possibility, not a decision). See `bible/premise.md`.

## How this repo is organized

| Folder | What it is |
| --- | --- |
| `research/` | Real-world **inspiration**. Not canon. Mine it for texture. |
| `bible/` | The **invented world** — the show's canon. Continuity lives here. |
| `structure/` | Structure Lab candidates + the locked `selected.md`. |
| `scripts/` | Fountain source (`scripts/pilot/pilot.fountain`). |
| `deck/` | Pitch materials — downstream of a working script. |
| `legal/` | The short real-person / trademark guardrail. |
| `tools/` | Project-local tooling stubs (the real toolchain lives in **gstack**). |
| `dist/` | Build output (gitignored). |

Read `CLAUDE.md` (editorial) and `AGENTS.md` (tooling) first.

## The two companion repos

This project is built with a reusable IP & story-development setup, split into two repos so the expertise carries to future projects:

- **ponytail** — a Claude Code plugin: the skills (`/story-research`, `/world-bible`, `/structure-lab`, `/character-bible`, `/fountain-draft`, `/pitch-deck`) and subagents (`research-scout`, `continuity-checker`, `script-doctor`) that drive the work.
- **gstack** — the Node toolchain: `continuity-lint`, `script-build` (Fountain → PDF via afterwriting), `structure-import`.

Enable the plugin: `/plugin marketplace add <ponytail-repo-url>` then `/plugin install`. See `.claude/settings.json`.

## Workflow (one-directional)

```
research/ → structure/ → bible/ → scripts/pilot/ → deck/
```

Don't write beats until `structure/selected.md` is locked.
