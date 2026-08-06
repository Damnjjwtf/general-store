# Structure Lab — IP Runner component (reconciled)

> **Reconciled 2026-08-06** against the real implementation: `Damnjjwtf/A-Halloween-Story`. It is a **built, working app**, not a plan. An earlier draft of this file was written blind from a secondhand description and got the method substantially wrong; it has been replaced. What's below describes what exists, then what IP Runner has to do to reuse it.

---

## 1. What it actually is

A **two-person structural invention workbook**, built for *A Halloween Story* (present-day Chicago under martial law; Halloween canceled in the inner city, alive in the suburbs; ensemble coming-of-age).

Next.js 16 (App Router) · TypeScript · Tailwind v4 · Prisma 7 + Postgres · Vercel. All four milestones shipped, plus public share links.

Its governing line — **"the Lab generates *structures*, never scenes"** — is enforced in the prompt itself (`OUTPUT STRUCTURES ONLY. No scenes, no dialogue, no character names, no plot content.`).

## 2. The method

Richer than a candidate generator. The sequence is the product:

1. **Workbook** — 10 designed sections, answered **independently** by two seats (jj, stefan), per-question autosave:
   `01 Novelty target · 02 Reaction against · 03 Emotional engineering · 04 The clock and the border · 05 Ensemble mechanics · 06 Legibility budget · 07 Ingredients · 08 Ontology · 09 Tonal targets · 10 Tone × structure interaction`
2. **Compare** — divergence rendered in a single signal color. **Divergence is the fuel:** the engine is told to "treat the divergence as a design tension to resolve, not an error. Name each tension."
3. **Library / starring** — starring *is* answering. Q7.1 = star 4–8 structure systems; Q10.3 = star 3–5 tone cards.
   - **30 structure systems** across 8 families: `LINEAR · NONLINEAR · ITERATIVE · ENSEMBLE · SPATIAL · POV · MODULAR · META`. Each card: mechanism / engineers (the audience state it manufactures) / example / failsWhen.
   - **20 tone cards**: **T1–T12 registers** (palettes — raw material) and **T13–T20 management systems** (engines — rules for how registers move, mix, break). Ids 101–120 to avoid colliding with structure ids 1–30.
4. **Synthesis (the pairing engine)** — `prompts/synthesis.txt`, hot-editable, Anthropic API:
   - Build a **morphological box**. Parameters: `time-logic · POV-logic · space-logic · knowledge-logic · ritual-logic · unit-of-repetition · tone-logic`.
   - **Bisociation:** every candidate must combine systems from **≥2 different families**.
   - **TRIZ-style contradiction resolution:** each candidate resolves a named tension by stating the contradiction and the resolution.
   - **Tone is a full parameter, not decoration** — "there is no separate Tone Lab." A candidate's tonal engine must be *keyed to a structural feature* (a station of the clock, a border crossing, a POV handoff).
   - **Curveball:** an Oblique Strategies card (20-card deck, premise-keyed) can be dealt in as a **hard constraint** every candidate must obey.
   - **Kill rules** (discard, not score): ignores the clock/border · a known structure in a costume · breaks the stated legibility rule · violates either user's **9.3 tonal kill-rule** (injected as a hard constraint) · has a **detachable tonal engine** ("if it could be swapped out without changing the beat-map, it isn't integrated, it's paint").
5. **Vote & iterate** — keep / kill / mutate per candidate, with notes and threaded comments. **Mutation notes feed the next run.** Full run history and input snapshots preserved for reproducibility.
6. **Export** — one-click markdown of answers, stars, runs, votes. Explicitly: *"the thing that gets pasted back into Claude chat for deeper development."*

## 3. Candidate anatomy

The unit of output (`Candidate` model + prompt contract):

| Field | Is |
| --- | --- |
| `name` | two or three words, evocative |
| `engineSummary` | one sentence — the mechanism, stated so a stranger could apply it |
| `tonalEngine` | which T-card governs register movement, keyed to which structural feature |
| `clockBorder` | how it load-bears the ritual calendar and the city/suburb gradient |
| `beatMap` | 6–10 structural stations (structural, not plot) |
| `failureMode` | the specific way this structure dies in execution |
| `noveltyCheck` | nearest existing structure + the one real departure — **with an anti-inflation rule**: label recombination as recombination rather than claiming invention |
| `sourceAnswers` | derivation, cited by question id and system number (`"JJ 4.1, Stefan 9.3; No. 23 × No. 29; T18 × No. 21"`) |

## 4. What I got wrong in the blind draft

Worth recording, because the gaps are the interesting part:

- I proposed a **1–5 scoring rubric**. Wrong shape. The Lab uses **binary kill-rules + human keep/kill/mutate votes**. Discarding on principle beats averaging on six axes, and the vote keeps the decision human.
- I missed **tone as a first-class box parameter** — the single most distinctive idea in the tool.
- I missed the **two-player divergence engine**. I framed the Lab as single-operator; its generative fuel is *disagreement between two authors*.
- I missed **bisociation**, **TRIZ contradiction resolution**, the **Oblique curveball**, the **novelty/honesty check**, **derivation traceability**, and the **mutation→next-run loop**.
- My axes were TV-shaped (engine / episode-shape / season-arc / braiding). The Lab's are more fundamental and film-shaped (time / POV / space / knowledge / ritual / unit-of-repetition / tone). **That gap is real and is the actual work for General Store** — see §6.

## 5. Reuse verdict: wrap it, don't rebuild it

The earlier open question (wrap vs. single-seat fork) is settled by the code: **wrap it.** The method is sound, tested, and the export was *designed* to hand off to Claude. Rebuilding would discard the corpus, the prompt, and the tuning.

**The contract:** the Lab's export markdown is the interface. A consuming project parses `## Synthesis runs` → candidates → `structure/candidates.md`, preserving names as stable ids and keeping `failureMode`, `noveltyCheck`, and `sourceAnswers` intact (they're the honesty of the thing).

## 6. What must change for a second project

The Lab is currently **hard-wired to A Halloween Story** in four specific places. Generalizing it is the whole job:

| Hard-wired | Where | Fix |
| --- | --- | --- |
| Fixed premise constraints (ritual clock, border, contested ritual, ensemble) | `prompts/synthesis.txt` header | Load per-project constraints from config, not the prompt body |
| `clockBorder` — a premise-specific column | `prisma/schema.prisma`, `Candidate` | Generalize to a named `premiseAnchors` field (label + value per project) |
| Question wording ("Halloween-set movies", "the martial-law material") | `content/workbook.ts` | Split into premise-neutral spine + per-project overrides |
| Oblique deck keyed to clock/border | `content/oblique.ts` | Per-project deck; keep the "structural provocation, not mood" rule |
| Two fixed seats (`jj`, `stefan`) | `lib/session.ts`, seed | Seat count as config — General Store is single-seat |

**Genuinely portable as-is:** the 30-system library (Three-Act → Kishōtenketsu → Rashomon → ritual-calendar; nothing Halloween-specific), the 20 tone cards, the morphological-box method, the kill rules, the candidate anatomy, and the export format.

**The additive piece General Store needs:** the library is **film-oriented**. A one-hour series wants series-native systems — A/B/C-story braiding, cold-open discipline, series engine vs. season arc, procedural-with-a-spine. Per the original brief this is a **data addition to the library, not a schema change. Additive only — never modify the shared 30-system corpus** (it's co-owned).

## 7. Contracts with the rest of IP Runner

- **Upstream gate.** Candidates are premise-dependent. No Lab run until `bible/premise.md` names a premise — the Lab literally needs a fixed-constraints block to function.
- **Downstream gate.** No beats until `structure/selected.md` is locked.
- **Graph.** A locked structure defines what an `Episode` is (`bible/graph.md`); a beat-map station becomes the unit an Episode node holds.
- **Want Engine.** Structure decides *where* want is expressed; the Want Engine decides *what* it is. Seam, not overlap — and §2's "emotional engineering" section is where the two touch.
