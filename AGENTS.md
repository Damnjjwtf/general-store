# AGENTS.md — General Store

Tooling notes for a one-hour period dramedy (fiction inspired by Chuck Williams). Claude Code owns the prose/world **and** any project-local tooling. See `CLAUDE.md` for the editorial side.

---

## 1. The workflow layer: ponytail + gstack

This project uses two standard Claude Code repos we reuse across almost every project. They are installed globally (into `~/.claude`), **not** vendored into this repo:

- **ponytail** — https://github.com/DietrichGebert/ponytail — the "write the minimum viable code / don't over-build" skill. Controls: `/ponytail lite|full|ultra|off`, `/ponytail-review`, `/ponytail-audit`.
- **gstack** — https://github.com/garrytan/gstack — the opinionated slash-command workflow suite (planning, review, ship, QA, docs, etc.).

Install / persistence is documented in the root `README.md` (§ "The workflow layer"). Because this is an ephemeral cloud environment, the durable place for these is the **environment setup script**, so every session has them without re-installing by hand.

---

## 2. Conventions

- Node for any project-local tooling unless there's a reason otherwise. Keep dependencies minimal — this repo outlives its dependencies.
- Deterministic output. Credentials in a gitignored `.env`, never committed, never echoed to logs.
- Commit messages state what changed and why.

---

## 3. Script format & build

- **Fountain** is the script format — plain text, git-diffable. One file per script. Source of truth: `scripts/pilot/pilot.fountain` (no pilot yet).
- A Fountain → PDF build (industry-standard formatting, page-count report) can live in `tools/` when a real script exists; `afterwriting` is the maintained CLI as of 2026-08. Output goes to `dist/` (gitignored).

---

## 4. Continuity, not verification

The fiction must agree with itself. This project's discipline is **continuity** — the world in `bible/` staying consistent — **not** source-verification of a real person (see `CLAUDE.md` §1). There is no claim-tagging or source-ledger system.

---

## 5. Repo map

```
research/     real-world inspiration — NOT canon
bible/        the invented world; the show's canon
structure/    Structure Lab exports; selected.md is locked output
scripts/      Fountain source
deck/         pitch materials — downstream of a working script
legal/        clearance notes, rights posture
tools/        project-local scripts only (workflow layer is ponytail + gstack, installed globally)
dist/         build output, gitignored
```

---

## 6. Never

- Never edit prose to satisfy a tool.
- Never treat continuity checks as historical-source verification — this project doesn't verify history.
- Never commit `dist/` or `.env`.
