# AGENTS.md — General Store

Toolchain notes for a one-hour period dramedy (fiction inspired by Chuck Williams). Claude Code owns **both** lanes here — prose/world *and* tooling. See `CLAUDE.md` for the editorial side.

> **Note (2026-08-04):** an earlier draft split this repo's tooling to a separate "Codex" agent. That split is retired. Claude Code executes both lanes. The tool *specs* below stand on their own regardless of who runs them.

---

## 1. Conventions

- Node for tooling unless there's a reason otherwise. Keep dependencies minimal — this repo outlives its dependencies.
- Every tool gets a `--help` and a one-paragraph README. A tool nobody remembers how to run is dead code.
- Deterministic output. No network calls at lint time.
- Credentials in a gitignored `.env`, never committed, never echoed to logs.
- Commit messages state what changed and why.

---

## 2. Continuity lint

`continuity-lint` (lives in the **gstack** repo). The fiction must agree with itself. This checks the world against itself — **not** against history. There is no source-verification here (see `CLAUDE.md` §1).

### What it checks

1. **Dangling entity** — a reference in `scripts/` to a named character, place, or institution that has no entry in `bible/` (derived from the bible on each run).
2. **Timeline / fact contradiction** — obvious internal collisions (a character in two places, an age that doesn't add up against the bible timeline). Best-effort, heuristic.
3. **Real-name advisory** — a mention of a real, named person or brand from gstack's `continuity-lint/real-names.txt`, pointing the writer at `legal/notes.md`. Advisory only; never a hard failure.

Expect false positives. Provide `<!-- lint:ignore -->` for single lines and a `lint:ignore-block` fence. Every ignore is logged to gstack's `continuity-lint/ignores.log` so suppression stays visible.

### Interface

```
# from the gstack repo, pointed at this project:
npm run lint:continuity -- --project ../general-store
npm run lint:continuity -- --project ../general-store --report  # markdown summary
```

**Warn-only** to start (exit 0 on findings). Flip to fail-hard once the bible is substantial; the switch is a single constant at the top of the entry file.

---

## 3. Fountain pipeline

`script-build` (lives in the **gstack** repo).

- Source of truth: `scripts/pilot/pilot.fountain` (no real pilot yet — build validated against gstack's small fixture).
- Output: title-page-correct PDF, industry-standard formatting.
- Renderer: **afterwriting** CLI (confirmed maintained as of 2026-08; `screenplain` is the Python fallback).
- `npm run build:script` → PDF into `dist/`, gitignored.
- Page-count report on every build; flag if a pilot drifts outside a configurable range (default 52–62 pages).

---

## 4. Structure import

`structure-import` (lives in the **gstack** repo). The Structure Lab is a separate app; this repo consumes its exports.

- Parse a Lab session dump into `structure/candidates.md` with stable ids.
- Additive only — never mutate a shared Lab corpus.
- Currently a documented stub; wire it up when the first Lab export exists.

---

## 5. Repo map

```
research/     real-world inspiration — NOT canon
bible/        the invented world; the show's canon
structure/    Structure Lab exports; selected.md is locked output
scripts/      Fountain source
deck/         pitch materials — downstream of a working script
legal/        clearance notes, rights posture
tools/        project-local glue only; real toolchain lives in the gstack repo
dist/         build output, gitignored
```

---

## 6. Never

- Never edit prose to satisfy a lint rule; if a tool forces a prose change, the tool is wrong — fix the tool.
- Never turn continuity-lint into a historical-source verifier. This project doesn't verify history.
- Never silently downgrade a failure to a warning without noting it.
- Never commit `dist/` or `.env`.
