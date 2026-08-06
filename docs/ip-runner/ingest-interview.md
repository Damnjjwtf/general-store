# Ingest interview — IP Runner

The intake at the front of a project. It establishes what kind of IP this is **before** anything is written, and hands the project the strategy and structure frameworks that actually fit it.

The model already exists: Structure Lab's 10-section workbook is a working ingest interview. Generalizing it — **premise-neutral spine + per-project overrides** — is the shortest path to IP Runner's version. Don't invent a second interview; lift the one that works.

## The branch

The first question is what form the IP takes, because it changes which frameworks are even relevant.

| Branch | The structural problem | Gets |
| --- | --- | --- |
| **Series** | A machine that must keep producing itself | The TV/streaming corpus — Format · Structure · **Engine** decks (`corpus/tv-streaming/`) |
| **Feature** | One closed text that must land once | The base 30-system corpus, used as designed |
| **Franchise / transmedia** | A world that must support many properties across media over time | World-first frameworks, below |

> **Terminology, because it collides.** "Franchise" in TV craft means a story-generating engine (the cop-show franchise) — that's our **Engine deck**, id 401–414. "Franchise" *here* means the business sense: a multi-property IP that spans media. Two different words, same spelling. The interview should never use the bare term without qualifying it.

## Series branch — the questions that matter

Beyond the Lab's existing spine, series-specific intake:

1. **What generates episode 12?** (Not episode 1. If unanswerable, it isn't a series yet.) → Engine deck
2. **What's the weekly unit, and does it self-complete?** → Structure 303 vs 310
3. **Is the format load-bearing?** Would swapping it change the beat-map? → Format deck
4. **Primary and secondary engine** — the week vs. the season. Same card twice runs thin.
5. **How does it end?** A series that can't die can't mean anything.

## Feature branch

Uses the base corpus as built. Intake establishes closed-text concerns — protagonist's want, the single dramatic question, the ending it's arguing toward. No engine question; a feature needs a story, not a machine.

## Franchise / transmedia branch — world-first

Only relevant if the ambition is genuinely multi-property. Asking these of a single pilot is overbuilding, and the interview should say so rather than flatter the ambition.

1. **Kernel** — what is the smallest thing that *is* the IP? Usually a world-rule or a relationship, rarely a plot. If the kernel is a plot, it won't franchise.
2. **What travels?** Which elements survive medium change — world, character, tone, rule-set? Anything that only works in one medium isn't franchise material.
3. **Property sequencing** — what is built first, and what does it have to prove? The first property is a thesis about the world, not just a story in it.
4. **Canon architecture** — one continuity or many? Who arbitrates? This is a *graph* problem, and it's why `bible/graph.md` exists — a franchise bible is a knowledge graph or it's a contradiction generator.
5. **Expansion joints** — where is the world deliberately unspecified so a later property has room? Over-specification is the most common franchise-killing mistake.
6. **Rights and control** — which pieces must stay owned, which can be licensed. Belongs in `legal/` from day one, not retrofitted.

**Honest caution:** most projects are not franchises, and designing for franchise before one property works is the classic way to make the first property worse. IP Runner should offer this branch and then *argue against it* unless the kernel test passes cleanly.

## Where the interview writes to

- Answers → the project's `bible/premise.md` frame and `structure/` inputs
- Structural stars → Structure Lab (the branch decides which decks are in play)
- Franchise answers → `bible/graph.md` (canon architecture) and `legal/` (rights posture)

## Status

Specced, not built. The build is a generalization of the existing Lab workbook (`content/workbook.ts` split into premise-neutral spine + per-project overrides), which is already item one on the Structure Lab reuse list.
