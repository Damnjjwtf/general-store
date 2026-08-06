# ALA — "it's like…"

*à la* — in the style of. The feature that takes the sentence every creative actually says — **"it's like X meets Y"** — and turns it into something structurally useful.

Sits beside Structure Lab. The Lab invents structure from first principles; ALA works from **precedent**. Both feed the same project, and they argue with each other on purpose.

---

## 1. The core move: vibe → mechanism

"It's like *Cheers*" is how people talk and it is structurally useless as stated. ALA's job is to decompose it:

> **"It's like *Cheers*"** → Threshold engine (`402`) + Chosen Family secondary (`406`) + Multi-cam format (`206`) + A/B braid (`301`)

Now it's actionable. You can keep the engine and drop the format. You can see that what you loved was the *door*, not the laugh track. **A comp you can't decompose into cards is a mood, not a comp** — and moods are why projects drift.

This is the bridge between how creatives speak and what the Lab consumes.

## 2. Two comp lists, never one

The most common comp mistake is running one list for two incompatible jobs.

| | **Creative comps** | **Market comps** |
| --- | --- | --- |
| Answers | what do we learn from? | what does a buyer need to hear to place this? |
| Can be | obscure, old, foreign, cross-medium, a failure | recent, successful, legible, same platform tier |
| Optimizes | craft precedent and DNA | positioning and proven appetite |
| Lives in | the bible / the Lab | the deck |
| Failure | none — steal from anywhere | naming a flop, or a comp the buyer hasn't seen |

A 1972 film nobody remembers is a superb creative comp and a terrible market comp. Keep them separate; label every entry.

## 3. Tropes

A project participates in tropes whether it knows it or not. ALA names them so the choice becomes deliberate:

- **Honoring** — the trope is a promise to the audience; deliver it well.
- **Subverting** — you must first *invoke* it, or the subversion reads as incompetence.
- **Avoiding** — name it so it can be caught in the room, not in the notes.

Every trope entry states **what it promises the viewer**. That's the useful part — a trope is an audience expectation with a name.

## 4. Guideposts

Each precedent carries what it *teaches*, stated as an instruction rather than admiration:

- **takeaway** — the transferable craft lesson
- **divergence** — where our project must differ. **Required.** A comp without a stated divergence is a plan to make a copy.
- **failedAt** — how the precedent stumbled. Negative guideposts are usually more useful than positive ones; nobody learns much from "it was great."

## 5. Entry schema

Matches the Lab's card discipline so entries stay terse and comparable.

```yaml
title: Cheers
year: 1982
medium: tv
kind: creative | market            # never both — split the entry if it's both
axis: [engine, tone]               # which dimension it's a comp ON
runsOn: [402, 406, 206, 301]       # corpus card ids — the decomposition
takeaway: <transferable lesson>
divergence: <where we must differ — required>
failedAt: <how it stumbled>
marketSignal: <market entries only: performance, platform, what it proves>
```

## 6. Guards

ALA is the feature most likely to make a project derivative, so it carries its own kill rules:

- **No divergence → kill the entry.** A comp you only admire is a comp you'll plagiarize.
- **If the comp list *is* the show, there's no show.** Three comps that decompose to the same cards means you've described an existing series, not a new one.
- **≤5 creative comps, ≤3 market comps.** More is not richer, it's undecided.
- **Comps calibrate; they don't authorize.** "Because *Succession* did it" is not a reason.

**Seam with the Lab.** The Lab's synthesis has an anti-inflation novelty check — *name the nearest existing structure and the one real departure.* ALA supplies the nearest existing structure with evidence. The two are designed to catch the same lie from opposite directions: the Lab stops you overclaiming invention, ALA stops you underclaiming derivation.

## 7. Where it sits

- **Ingest** — "what's it like?" is the easiest question to answer at intake and the fastest route to a project's real DNA. Feeds the interview (`ingest-interview.md`).
- **Lab** — comps decompose to card ids, which seeds starring rather than starting from thirty blank cards.
- **Deck** — market comps become the comparables page. Downstream of a working script, per the pipeline.
- **Graph** — a comp is an `Inspiration` node (`bible/graph.md`); `inspired-by` points **out** of canon into it. Same rule as research: comps enrich, they never bind.

## 8. Worked example — *General Store*

The project already lists tonal references in `CLAUDE.md`. ALA formalizes them, and the split immediately does work:

**Creative** — the actual DNA, mostly unpitchable
| Title | Axis | runsOn | Takeaway | Divergence |
| --- | --- | --- | --- | --- |
| *Northern Exposure* | tone, ensemble | 402, 406, 303 | eccentricity earns its warmth through competence, not quirk | ours is about *objects*, not outsiderness |
| *Halt and Catch Fire* | theme, engine | 413, 407, 315 | taste-vs-scale as a season engine; period tech without nostalgia | ours stays small; the shop never becomes the empire |
| *I'll Fly Away* | tone, era | 408, 302 | period social pressure carried in domestic scale | ours is comic-adjacent; theirs is grave |
| *Newhart* | tone, threshold | 402, 206 | a proprietor as straight man to a town | ours must not settle into joke-rate |

**Market** — recent, legible, proves appetite
| Title | Platform | Signal | Divergence |
| --- | --- | --- | --- |
| *Lessons in Chemistry* | Apple TV+ | period + craft + a woman teaching a nation to want something; prestige limited appetite | ours is ongoing, ensemble, not single-lead |
| *The Bear* | FX/Hulu | craft engine (413) at scale; chosen family; awards + audience | ours is warm, *not* kinetic — per `CLAUDE.md`, use sparingly |
| *Julia* | HBO Max | closest premise-adjacent: taste evangelism, period, food | ours invents its protagonist; theirs is biography |

**Tropes in play**
- *The mentor who won't say the warm thing* — **honoring.** Promise: the withheld approval will land eventually, and it will wreck you.
- *The rival who is secretly petty* — **avoiding.** (See `bible/inbox.md`: the department store is stronger if he's charming and *right*.)
- *Period-as-costume-party* — **avoiding.** Promise it accidentally makes: nothing at stake.
- *Found family in a workplace* — **honoring**, but it must cost something; warmth without friction is structurally inert (`406` failsWhen).

Note what the split reveals: the creative list is where the show *lives*, the market list is what gets it *bought*, and only one title appears near both. That gap is normal — and knowing it early is the point.

## 9. Status

Specced, not built. Build order: entry schema + the decomposition step (comp → card ids) is the whole value; the tropes layer can follow.
