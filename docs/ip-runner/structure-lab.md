# Structure Lab — IP Runner component spec

> **Status: DRAFT, unreconciled.** Written from the description in this project's original `AGENTS.md` (a separate two-seat app, a 30-system co-owned corpus, markdown exports, an additive TV extension) — **not** from reading the actual Structure Lab repo. Reconcile against the real repo before trusting §2 and §8; the method (§1, §3–§6) is designed to stand on its own either way.

**Structure is not chosen by taste. It is developed.**

The Lab turns *"what is this story?"* into *"how is it built?"* — by composing competing structural approaches out of **ingredients**, scoring them against the story's own engine, and handing a human the decision. It is the gate between the bible and the first written beat.

---

## 1. The core idea: ingredient sets

A structure is not invented whole. It is a **combination of choices on a fixed set of axes**. Candidates are different combinations — "ingredient sets" — drawn from a corpus of known structural systems.

**The axes:**

| Axis | The question | Examples |
| --- | --- | --- |
| `engine` | what renewably generates story every week? | a shop that draws the town · a case · a recurring problem in new dress |
| `episode_shape` | what is the weekly unit? | cold-open + 4 acts · self-completing + spine · dual-track |
| `season_arc` | what finite change runs underneath? | taste meets scale · the sale · the succession |
| `braiding` | how do A/B/C interlock? | A engine / B relationship / C object-runner |
| `pov` | whose eyes? | single-lead · ensemble · dual |
| `time` | how does it move? | linear · dual-period · flashback spine |
| `signature` | how does the show's move land weekly? | an object is explained and something harder gets explained with it |
| `pressure` | how is the antagonism *structural*, not just thematic? | standing offer to buy · a rival who is right · encroachment |

Change one axis, get a materially different show. That's the Lab's whole leverage: it makes the choice **explicit and comparable** instead of vibes.

## 2. The corpus

- **Base corpus (30 structural systems)** — existing, **co-owned, additive-only. Never modify it.** The Lab reads from it; it does not write to it.
- **TV corpus extension** — series-native systems layered on top: A/B/C-story braiding, cold-open discipline, series engine vs. season arc, procedural-with-a-spine. **A data addition, not a schema change.**

## 3. The loop

1. **Frame.** State what the structure must carry — the engine, the tone, the pressure. One paragraph, from `bible/premise.md`.
2. **Draw.** For each axis, pull 2–4 viable options from the corpus.
3. **Compose.** Combine into **2–4 candidates**, each with a stable id (`S-A`, `S-B`, …). Candidates describe *structure*, never plot.
4. **Score.** Run every candidate through the rubric (§5). Scores are an argument, not a verdict.
5. **Stress.** For each candidate, write its **characteristic failure mode** — the way this specific structure dies at episode 8. A candidate with no named failure mode hasn't been thought about.
6. **Hand off.** Write `structure/candidates.md`. **The Lab does not choose.**
7. **Lock.** A human writes `structure/selected.md`. Beats unblock.

## 4. Candidate schema

```yaml
id: S-A
name: <short handle>
structural_logline: <how it is built — not what happens>
engine: <the renewable generator>
episode_shape: <the weekly unit>
season_arc: <the finite change underneath>
braiding: <A/B/C pattern>
pov: <single-lead | ensemble | dual>
time: <linear | dual-period | flashback spine>
signature_beat: <how the show's move lands each week>
pressure: <how antagonism is structurally present>
failure_mode: <how this structure dies at episode 8>
```

## 5. The rubric

Score 1–5. The point isn't the total — it's **where candidates diverge.** A candidate that wins on 4 and collapses on 1 is usually the honest answer, and the low score tells you what to shore up.

| # | Criterion | Asks |
| --- | --- | --- |
| 1 | **Engine durability** | can it produce 40 episodes without repeating itself? |
| 2 | **Arc pressure** | is there a finite change with real stakes underneath? |
| 3 | **Signature fidelity** | does the show's move happen *naturally* weekly, or must it be forced? |
| 4 | **Ensemble load** | does the room have reasons to keep coming back? |
| 5 | **Antagonism** | is the pressure structural, or just a theme we assert? |
| 6 | **Producibility** | standing sets and contained days, or sprawl? |

**Rule:** any criterion scoring ≤2 must be answered in prose, not shrugged off. That answer usually becomes the next candidate.

## 6. Contracts with the rest of IP Runner

- **Upstream — the gate.** Candidates are **premise-dependent**. The Lab does not run until `bible/premise.md` names a premise.
- **Downstream — the gate.** No beats, no pages until `structure/selected.md` exists and is locked.
- **Graph.** `Episode` is a node type (`bible/graph.md`). The locked structure defines what an Episode *is*, and the invariant **"every Episode contains at least one `Object --explains--> Motif` path"** is criterion 3 made queryable.
- **Want Engine.** Structure carries want. The Lab decides *where* want gets expressed (per-episode vs. per-season); the Want Engine decides *what* the want is. Seam, not overlap.
- **Import.** A Lab session dump parses into `structure/candidates.md` with stable ids preserved.

## 7. Worked example — format only

Illustrative, **not seeded for this project** (premise is open). Shows the shape a real candidate takes:

> **`S-A` — The Town and the Store.** Ensemble dramedy; the shop is the engine, the town supplies the week.
> *engine:* anyone who walks in brings a want they can't name · *episode_shape:* cold open on an object, self-completing customer story + spine · *braiding:* A customer / B ensemble relationship / C an object runner · *pov:* ensemble · *time:* linear · *signature:* the counter scene · *pressure:* the department store's standing offer · *failure_mode:* customer-of-the-week calcifies into formula by ep 8; the spine starves.

## 8. Open decision — how the Lab is instantiated

The existing Structure Lab is a **two-seat app with a co-owned corpus**. For IP Runner, two paths:

- **(a) Wrap it.** IP Runner consumes the existing Lab's exports. Corpus stays untouched and co-owned; IP Runner owns only the import + candidate/rubric contract above.
- **(b) Single-seat fork.** IP Runner reimplements the Lab against this spec, with its own additive TV corpus. Cleaner as a product; duplicates the corpus question.

**Lean: (a) now, (b) if IP Runner ships as a product.** The spec above is deliberately app-agnostic — it's a data contract plus a method, so either path satisfies it.
