# Obsidian vault

This repo **is** an Obsidian vault. The `.obsidian/` config is committed so the graph view and link behavior travel with the project; only per-user UI state (`workspace*.json`) is gitignored.

## Open it
Obsidian → "Open folder as vault" → pick the repo root. Start at [[HOME]].

## Why the repo root is the vault
`research/` and `bible/` are separate top-level folders, and an Obsidian vault is a single folder — so the vault has to be their common parent (the repo root). The graph view is filtered (in `.obsidian/graph.json`) to hide non-narrative folders (`tools/`, `templates/`, `.claude/`, `docs/`, `dist/`, READMEs), so what you see is the *story*, not the scaffolding.

## Link conventions (these also feed GBrain)
- **Wikilinks, vault-root-absolute.** Configured via `app.json` (`useMarkdownLinks: false`, `newLinkFormat: "absolute"`). Link as `[[bible/characters/<Name>]]`, `[[research/<file>]]`.
- **One bullet = one typed edge** in a page's `## Relationships` / `## Inspired by` sections (`teaches → [[…]]`, `inspired-by → [[research/…]]`). This is what makes the graph legible to both Obsidian (backlinks) and GBrain (typed nodes/edges). See [[bible/graph]].
- **`inspired-by` points only out of the bible into `research/`.** Never link `research/` → `bible/`; that keeps "inspiration is not canon" true and queryable.

## Graph colors
- amber = `bible/characters` · blue = `bible/world` · grey = `research` (the ore) · green = `structure`.

## Attachments
Mood-board images / references drop into `assets/` (set as the attachment folder). Keep real brand/real-person imagery out of anything audience-facing per [[legal/notes]].
