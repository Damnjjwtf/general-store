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
| `tools/` | Project-local scripts only (workflow layer is ponytail + gstack, installed globally). |
| `dist/` | Build output (gitignored). |

Read `CLAUDE.md` (editorial) and `AGENTS.md` (tooling) first.

## The workflow layer: ponytail + gstack

We reuse two standard Claude Code repos across almost every project. They are **not** part of this repo — they install into `~/.claude`:

- **ponytail** — https://github.com/DietrichGebert/ponytail — "write the minimum viable code / don't over-build."
  ```
  /plugin marketplace add DietrichGebert/ponytail
  /plugin install ponytail@ponytail
  ```
  (Also wired for this project in `.claude/settings.json`.)
- **gstack** — https://github.com/garrytan/gstack — the opinionated slash-command workflow suite.
  ```
  git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && (cd ~/.claude/skills/gstack && ./setup)
  ```

**Why re-install every session?** This is an ephemeral cloud environment — `~/.claude` resets when the session ends, so a global install doesn't survive. Put both commands in the **environment's setup script** (Claude Code web → environment settings) and every session, on every project, gets them automatically. `ponytail` also persists per-project via the `.claude/settings.json` above.

## Workflow (one-directional)

```
research/ → structure/ → bible/ → scripts/pilot/ → deck/
```

Don't write beats until `structure/selected.md` is locked.
