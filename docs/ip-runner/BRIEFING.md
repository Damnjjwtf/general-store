# IP Runner — briefing

*Self-contained context document. Paste into a fresh AI chat to bring it up to speed.*

---

## What it is

**IP Runner is an opinionated operating system for developing intellectual property.** It runs a project from spark → bible → script → deck → visual identity, with memory and consistency as first-class citizens.

The tools are commodities. The product is the **method** — the discipline that turns a spark into a produceable, self-consistent IP and never loses the thread. Roughly: what gstack is to shipping code, IP Runner is to developing IP.

## Where it came from

It emerged while building **General Store**, a one-hour period dramedy — a fiction *inspired by* Chuck Williams (the Williams-Sonoma founder). The real man is a seed; the protagonist and world are invented, free to differ in name, race, city, and era. The premise is deliberately still open.

The scaffolding built for that show turned out to be the product. **General Store is now the reference project; IP Runner is the engine.** They're currently fused in one repo; extraction is pending.

## The method (the actual moat)

1. **Inspiration is not canon.** Real-world research lives in `research/` and enriches the fiction — it never binds it. The invented world lives in `bible/` and is what the work must stay consistent with. A one-directional `inspired-by` edge points *out* of canon into research, never the reverse.

2. **Continuity over verification.** For original or inspired-by IP you don't source-check a real person, because the protagonist is invented. The discipline is *the fiction agreeing with itself*. (A strict claim-tagging and source-ledger apparatus was built, then deliberately torn out when the project reframed from biography to inspired-by fiction — right rigor, wrong problem.)

3. **One-directional pipeline.** research → structure → bible → script → deck. If you're writing deck copy to justify a beat, you've inverted it.

4. **Gates, enforced not advisory.** No world detail before the premise is chosen. No beats before structure is locked. No deck before a script works.

5. **The IP is a knowledge graph.** Typed nodes (Character, Place, Object, Motif, Event, Episode, Inspiration) and typed edges (`teaches`, `pressures`, `appears-in`, `precedes`, `inspired-by`). Continuity questions become queries: dangling references, timeline contradictions, "which episodes lack the show's signature move." Materialized two ways from the same markdown — GBrain for the agent, Obsidian for the human.

6. **One light legal guardrail, stated once.** Don't present defamatory falsehoods as fact about real named people; don't reproduce real trademarks as genuine. That's the whole gate — one file, not every line.

## Components

**Structure Lab — BUILT AND SHIPPED** (Next.js 16, TypeScript, Prisma/Postgres, Vercel). A two-person structural invention workbook. Governing rule: *"the Lab generates structures, never scenes"* — enforced in the prompt itself.

- **Workbook**: 10 sections answered *independently* by two seats. **Divergence between the authors is the generative fuel**, explicitly treated as design tension to resolve, not error.
- **Library**: 30 structure systems across 8 families (LINEAR · NONLINEAR · ITERATIVE · ENSEMBLE · SPATIAL · POV · MODULAR · META) + 20 tone cards (T1–T12 registers, T13–T20 management systems). Starring cards *is* answering.
- **Synthesis**: a morphological box — parameters time / POV / space / knowledge / ritual / unit-of-repetition / tone-logic. **Bisociation** (every candidate must cross ≥2 families), TRIZ-style contradiction resolution, and an Oblique Strategies curveball dealt in as a hard constraint. **Tone is a full box parameter, not decoration** — "there is no separate Tone Lab"; a tonal engine must key to a structural feature or it's paint.
- **Selection**: binary **kill rules** (discard, don't score) plus human keep/kill/mutate votes. Mutation notes feed the next run.
- **Candidate anatomy**: `name`, `engineSummary`, `tonalEngine`, `beatMap` (6–10 structural stations), `failureMode`, `noveltyCheck` (anti-inflation rule: label recombination as recombination), `sourceAnswers` (derivation traceability).
- **Export**: markdown, designed to be pasted back into an AI chat for deeper development.

**TV/Streaming corpus — WRITTEN.** The Lab's library is film-shaped: it assumes a single closed text. A series must keep producing itself. Added as three decks, because TV conflates three independent axes:
- **Format** (201–212) — act architecture, runtime, release cadence
- **Structure** (301–315) — how story is arranged
- **Engine** (401–414) — *what renewably generates episodes*; the axis film has no equivalent for, and the usual reason a good pilot dies at episode 8
41 cards, matching the Lab's schema: `mechanism / engineers (the audience state it manufactures) / example / failsWhen`. Strictly additive — new id ranges, and TV moves that are really base systems reference the base card rather than cloning it. Two series-specific kill rules: **no engine → kill**; **detachable format → kill**.

**ALA ("it's like…") — SPECCED.** Turns the sentence everyone actually says into mechanism. *"It's like Cheers"* decomposes to Threshold engine (402) + Chosen Family (406) + multi-cam (206) + A/B braid (301) — so you can keep the engine and drop the format. A comp you can't decompose into cards is a mood, not a comp. Splits **creative comps** (DNA; may be obscure, old, foreign, even flops) from **market comps** (positioning; must be recent and legible to a buyer). Every entry requires a stated **divergence**. Pairs with the Lab's novelty check: the Lab stops you overclaiming invention, ALA stops you underclaiming derivation.

**Ingest interview — SPECCED.** Intake that branches on IP type — **Series / Feature / Franchise-transmedia** — each getting different frameworks. Built as a generalization of the Lab's existing workbook, not a second interview. *Terminology warning:* "franchise" means two things — in TV craft it's a story-generating engine; in business it's a multi-property IP. IP Runner means the second, and the franchise branch argues *against* itself unless a kernel test passes, because designing for franchise before one property works makes the first property worse.

**Want Engine — EMPTY REPO, unspecced.** Intended to handle what drives character and scene. Seam with structure: structure decides *where* want is expressed; the Want Engine decides *what* it is.

**Supporting stack:** memory/graph (GBrain), research (Exa · Browser Use · NotebookLM · last30days), art (higgsfield · Adobe · ComfyUI), workflow (ponytail · gstack).

## Status

| Piece | State |
| --- | --- |
| Structure Lab | Shipped — but hard-wired to one project in 5 places (premise constraints in the prompt header, a premise-specific DB column, question wording, the Oblique deck, two fixed seats). **Verdict: wrap it, don't rebuild.** Generalizing it is the main engineering job. |
| TV/streaming corpus | Written |
| ALA · Ingest interview | Specced |
| Want Engine | Greenfield |
| Not built | Script build (Fountain→PDF) · deck production · `ip-runner new <title>` bootstrap · cross-project rights management |

## Open questions

- **Ambition:** private operating system for one slate, or a shippable product?
- **Autonomy:** does an agent runtime (Hermes) *run* stages on a schedule — research digests, continuity sweeps — or does IP Runner stay hands-on?
- **Extraction:** pull the engine into its own repo now, or keep harvesting from the reference project first?
