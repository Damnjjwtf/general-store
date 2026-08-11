# IP Runner — PRD v0.1

*Self-contained product requirements document. Written to be fed to an AI builder with no other context. Read `BRIEFING.md` for narrative background; this doc is the build contract.*

---

## 1. Product

**IP Runner** is an opinionated operating system for developing intellectual property — it runs a project from spark → structure → bible → script → deck → visual identity, with memory and consistency as first-class citizens.

**Positioning:** what gstack is to shipping code, IP Runner is to developing IP. The tools are commodities; the product is the enforced method.

**Problem it solves:** creative development loses the thread. Premises drift, bibles contradict themselves, structure gets chosen by taste, comps make projects derivative, decks get written to justify beats that don't work, and every new project rebuilds its scaffolding from scratch.

## 2. Users

- **Primary:** a solo creator/producer developing multiple IPs (single-seat).
- **Secondary:** two-person creative partnerships (two-seat — already supported by the existing Structure Lab, whose generative method depends on author divergence).
- **Tertiary (later):** AI agents operating stages autonomously (research digests, continuity sweeps).

## 3. What already exists (do not rebuild)

| Asset | State | Location |
| --- | --- | --- |
| **Structure Lab** — two-seat structural invention workbook | **Shipped**: Next.js 16 (App Router), TypeScript, Tailwind v4, Prisma 7 + Postgres, Vercel. 10-section workbook, 30-system structure library + 20 tone cards, morphological-box synthesis via Anthropic API, kill rules, keep/kill/mutate voting, markdown export | `Damnjjwtf/A-Halloween-Story` |
| **TV/streaming corpus** — 3 decks, 41 cards | Written, Lab-schema-compatible | `general-store:docs/ip-runner/corpus/tv-streaming/` |
| **ALA spec** ("it's like…") | Specced | `general-store:docs/ip-runner/ala.md` |
| **Ingest interview spec** | Specced | `general-store:docs/ip-runner/ingest-interview.md` |
| **Method + reference project** | Live: graph ontology (`bible/graph.md`), pipeline gates, research/canon split, legal guardrail, Obsidian vault, MCP research stack | `Damnjjwtf/general-store` |
| **Want Engine** | Empty repo (README only) — out of scope for v1 | `Damnjjwtf/want-engine` |

**Hard constraint: wrap the Lab, don't rebuild it.** Its corpus (ids 1–30) and tone cards (101–120) are co-owned with a second author — **never modify them; extensions are additive only, in new id ranges.**

## 4. v1 scope

Four workstreams, in priority order.

### WS1 — Generalize Structure Lab (multi-project)

The Lab is hard-wired to its first project in exactly five places. Fix each:

| # | Hard-wiring | Where | Requirement |
| --- | --- | --- | --- |
| 1 | Premise constraints baked into synthesis prompt header | `prompts/synthesis.txt` | Load per-project constraint block from project config |
| 2 | `clockBorder` premise-specific column | `prisma/schema.prisma` → `Candidate` | Replace with generic `premiseAnchors` (array of label+value per project) |
| 3 | Project-specific question wording | `content/workbook.ts` | Split into premise-neutral spine + per-project override file |
| 4 | Oblique deck keyed to first project | `content/oblique.ts` | Per-project decks; keep the rule "structural provocation, not mood" |
| 5 | Two fixed seats (`jj`, `stefan`) | `lib/session.ts`, seed | Seat count 1–2 from project config. **Single-seat mode:** one author answers; divergence pressure is replaced by an AI "sparring seat" whose answers are generated to *maximize productive disagreement* and are clearly labeled as AI |

Plus:
- **Project entity**: the Lab must support N projects, each with its own workbook answers, stars, runs, votes, config, and corpus *extensions* (base library shared read-only).
- **Corpus loader**: ingest the TV/streaming decks (Format 201–212, Structure 301–315, Engine 401–414) as additive library families, selectable per project type. Card schema is identical to existing (`mechanism / engineers / example / failsWhen`).
- **Series kill rules** added to synthesis when project type = series: (a) candidate cannot name what generates episode 12 → kill; (b) format swappable without changing the beat-map → kill.

**Acceptance:** a second project (General Store) can run a full Lab cycle — workbook → stars → synthesis → votes → export — without touching the first project's data or the shared corpus, in single-seat mode.

### WS2 — Ingest interview

Front door of every project. A guided intake that:

1. Asks the ALA question first ("what's it like?") — feeds WS3.
2. Branches on IP type: **Series / Feature / Franchise-transmedia.**
   - *Series* → activates TV corpus decks + series kill rules; asks: what generates episode 12; weekly unit self-completing or not; is format load-bearing; primary/secondary engine; how does it end.
   - *Feature* → base 30-system corpus; closed-text questions (want, single dramatic question, ending argued toward).
   - *Franchise-transmedia* → kernel test (smallest thing that IS the IP; if it's a plot, it won't franchise), what travels across media, property sequencing, canon architecture (one continuity or many, who arbitrates), expansion joints, rights posture. **The branch must argue against itself:** if the kernel test fails, recommend the Series or Feature path instead of flattering the ambition.
3. Writes outputs to the project: premise frame, active corpus decks, starred systems, `bible/` skeleton, `legal/` posture.

Implementation: generalization of the Lab's existing 10-section workbook engine (premise-neutral spine + overrides = WS1 #3), not a second interview system.

**Acceptance:** creating a new project walks through the interview and lands the user in a scaffolded project with the right decks active; choosing "franchise" with a plot-shaped kernel produces a visible push-back with a recommended downgrade.

### WS3 — ALA ("it's like…")

A tab/lab for precedent. Data model:

```yaml
# ALA entry
title: string          # e.g. "Cheers"
year: int
medium: tv | film | book | game | podcast | other
kind: creative | market          # never both; split the entry
axis: [engine|tone|format|structure|world|character ...]   # what it's a comp ON
runsOn: [int]          # corpus card ids — the decomposition
takeaway: string       # transferable craft lesson
divergence: string     # REQUIRED — where this project must differ
failedAt: string       # how the precedent stumbled
marketSignal: string   # market entries only
tropes: [ {name, promise, stance: honoring|subverting|avoiding} ]
```

Behavior:
- **Decomposition assist:** given a title, the AI proposes `runsOn` card ids from the active corpus; user confirms/edits. A comp that can't be decomposed is flagged as "mood, not comp."
- **Validation (hard):** entry without `divergence` cannot be saved. `kind` is exclusive. Caps: ≤5 creative, ≤3 market per project (soft warning, override allowed with note).
- **Derivation alarm:** if ≥3 comps decompose to the same card set, surface "you've described an existing show, not a new one."
- **Flows out:** `runsOn` seeds Lab starring; market entries export to a deck comparables block; every entry becomes an `Inspiration` node in the project graph (edges point *out* of canon only).

**Acceptance:** entering "Cheers" produces a proposed decomposition (e.g. 402 + 406 + 206 + 301), refuses to save without a divergence, and its stars appear pre-seeded in the Lab.

### WS4 — Project bootstrap (`ip-runner new <title>`)

One command / one action that stamps a new project:

- Directory skeleton: `research/ bible/ structure/ scripts/ deck/ art/ legal/ tools/ dist/` + `CLAUDE.md`/`AGENTS.md` from method templates + `.gitignore`.
- Graph ontology (`bible/graph.md`), open `bible/premise.md` with gates stated, `legal/notes.md` guardrail.
- Obsidian vault config (committed `.obsidian/`, per-user state ignored).
- Workflow layer: `.claude/settings.json` (ponytail plugin), SessionStart hook (gstack provisioning), `.mcp.json` (Exa / Browser Use / NotebookLM, keys from env only).
- Registers the project in the Lab (WS1) and launches the ingest interview (WS2).

**Acceptance:** from zero to an interview-completed, gates-enforced, graph-ready project in under 5 minutes, with no secrets written to the repo.

## 5. Method invariants (non-negotiable, enforce in software wherever possible)

1. **Inspiration is not canon.** `research/` and ALA entries never bind the fiction; `inspired-by` edges point out of canon only.
2. **One-directional pipeline:** research → structure → bible → script → deck.
3. **Gates:** no world detail before premise chosen; no beats before `structure/selected.md` locked (a human writes it — the Lab never auto-selects); no deck before a working script.
4. **The Lab generates structures, never scenes** (already prompt-enforced; keep it).
5. **Additive-only shared corpus.** Ids 1–30 and 101–120 are read-only.
6. **Kill rules discard; humans vote.** No numeric scoring rubrics.
7. **Secrets in env vars only** — never in repos, never echoed.
8. **Legal guardrail** stated once per project: no defamatory falsehoods as fact about real named people; no real trademarks reproduced as genuine.

## 6. Out of scope for v1

- **Want Engine** (spec first, separately — repo exists, empty).
- Script build (Fountain → PDF), deck production/typography system, art generation pipelines.
- Autonomous agent scheduling (Hermes-run stages).
- Cross-project rights management.
- Multi-tenant / commercial productization (v1 is the owner's instrument; keep the door open, don't build for it).

## 7. Technical constraints

- Extend the existing Lab codebase: Next.js 16 App Router, TypeScript, Tailwind v4, Prisma 7 + Postgres, deployed on Vercel; synthesis via Anthropic API with hot-editable prompts.
- Migrations must preserve the first project's existing data (answers, runs, votes, share links).
- Export format is a stability contract: markdown, sections for answers/stars/runs/votes, candidate fields `name / engineSummary / tonalEngine / premiseAnchors / beatMap / failureMode / noveltyCheck / sourceAnswers`. Downstream consumers parse it; version it.
- New corpus data ships as data (seed files), not code.

## 8. Milestones

| M | Deliverable | Done when |
| --- | --- | --- |
| M1 | Lab multi-project + de-hardwiring (WS1 #1–4, project entity) | Second project runs a full cycle; first project unaffected |
| M2 | Single-seat mode + AI sparring seat (WS1 #5) | Solo workbook → synthesis works; AI seat clearly labeled |
| M3 | TV corpus loaded + series kill rules | Series project stars 201–414 cards; kill rules fire in synthesis |
| M4 | Ingest interview (WS2) | Branching intake produces a configured project; franchise push-back works |
| M5 | ALA (WS3) | Decomposition, validation, derivation alarm, Lab seeding all live |
| M6 | Bootstrap (WS4) | `ip-runner new` end-to-end under 5 minutes |

## 9. Risks

- **Corpus governance:** the shared library is co-owned; any write path that can touch ids 1–30 / 101–120 is a relationship risk, not just a bug. Enforce read-only at the DB layer, not convention.
- **AI sparring seat quality:** if its answers are bland, single-seat mode loses the Lab's core mechanism (divergence). Prompt it to disagree *structurally*, and let the user regenerate.
- **Terminology collision:** "franchise" (TV craft: story engine) vs. "franchise" (business: multi-property IP). UI copy must always qualify which is meant.
- **Spec drift:** ALA and ingest are specs, not code; where this PRD and the spec files disagree, the spec files win (`ala.md`, `ingest-interview.md`).

## 10. Reference materials for the builder

In `Damnjjwtf/general-store` under `docs/ip-runner/`: `BRIEFING.md` (narrative context) · `structure-lab.md` (reconciled Lab description + generalization table) · `corpus/tv-streaming/` (README + 3 card decks) · `ala.md` · `ingest-interview.md`. Method exemplars at repo root: `CLAUDE.md`, `AGENTS.md`, `bible/graph.md`, `bible/premise.md`.
