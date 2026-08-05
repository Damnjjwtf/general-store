# bible/graph.md — the world as a knowledge graph

The bible is not a pile of documents. It is a **graph**: entities (nodes) joined by typed relationships (edges). Writing it this way is what lets a memory engine (GBrain), a vault (Obsidian), or the naked eye answer continuity questions the prose can't. This file is the ontology — the allowed node and edge types — so every bible page is "brain-ready" the day it's written.

Premise is still open, so no instances are seeded. This is the schema they'll fill.

## Node types

| Type | Is | Lives in |
| --- | --- | --- |
| `Character` | an invented person | `bible/characters/` |
| `Place` | the store, a room, the block/town | `bible/world/` |
| `Institution` | the chain/developer (the "scale" pressure), suppliers, the neighborhood body | `bible/world/` |
| `Object` | a good the store sells — the whisk, the copper pan | `bible/world/objects/` |
| `Motif` | a value or theme an object can carry (standards, chosen family, what scale costs) | `bible/world/motifs.md` |
| `Event` | a dated thing in the world's timeline | `bible/timeline.md` |
| `Episode` | a structural unit | `structure/` + `bible/` |
| `Inspiration` | a real-world touchstone — **never canon** | `research/` |

## Edge types (typed, directional)

```
Character  --teaches-->      Character        # usually mediated by an Object
Object     --explains-->     Motif            # THE ENGINE: an object explains something harder to name
Character  --owns/runs-->    Place | Institution
Character  --works-at-->     Place
Character  --frequents-->    Place
Place      --located-in-->   Place
Institution--pressures-->    Place            # "scale" pushing on "taste"
Character  --kin/partner/mentor--> Character
Node       --appears-in-->   Episode          # Character | Object | Place -> Episode
Event      --precedes-->     Event            # temporal ordering
Event      --occurs-in-->    Episode
Event|Object --foreshadows-->Event            # setup
Event      --pays-off-->     Event            # payoff of a foreshadow
CanonNode  --inspired-by-->  Inspiration      # the research→bible boundary, made explicit
```

Two rules make the graph honest:
- **`inspired-by` only ever points *out* of the canon, into `research/`.** Nothing in `research/` points into the bible. That one-directional edge *is* the "inspiration is not canon" discipline, enforceable by a query.
- **Every `Episode` must contain at least one `Object --explains--> Motif` path.** That's the engine beat, expressed as a required subgraph. An episode without it is missing its heart.

## Continuity questions that become graph queries

- **Dangling reference:** a name in `scripts/` with no `Character`/`Place` node → it was never established. (Today's cheap version: grep. The graph version: exact.)
- **Timeline contradiction:** a `Character` with `appears-in` two `Event`s whose `Place`s differ but whose times overlap; or a cycle in `precedes`.
- **Age/date drift:** derive a character's age at any `Event` from birth `Event` + `precedes` chain; flag mismatches with stated ages.
- **Engine coverage:** list `Episode`s with no `Object --explains--> Motif` path — the episodes missing the show's move.
- **Braiding:** A/B/C stories are subgraphs sharing some nodes; you can see whether they rhyme by which `Motif`s they touch.
- **Provenance audit:** for any canon claim, follow `inspired-by` to see what real ore it drew from — and confirm it isn't secretly asserting history.

## How this is materialized

- **GBrain** ingests these markdown pages and auto-wires the typed graph (no LLM calls for extraction); its MCP surface lets the agent *query* it across sessions. See `docs/gbrain.md`.
- **Obsidian** renders the same links as a navigable graph + backlinks for humans.
- Both read the **same** structure. Write the pages once, per `bible/characters/_TEMPLATE.md`; both engines light up.
