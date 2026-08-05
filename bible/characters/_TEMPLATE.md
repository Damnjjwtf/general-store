---
type: Character
name: <Full Name>
aliases: []            # nicknames the scripts might use — helps catch dangling refs
status: invented       # always. this is fiction.
tags: [protagonist|ensemble|foil|scale, ...]
---

# <Full Name>

> One line: who they are in the story's machine.

## Function
What role do they serve in the engine? (The exacting teacher? The one being taught? The face of "scale"?)

## Want vs. need
- **Wants:** ...
- **Needs:** ...

## The object they command
The good/craft they know cold — the thing they can [[bible/world/objects/<object>|explain]], and the [[bible/world/motifs#<motif>|motif]] it carries. (This wires an `Object --explains--> Motif` path through them.)

## Contradictions
The tension that makes them a person, not a position.

## Relationships
Use explicit links so the graph builds edges. One bullet = one typed edge.
- teaches → [[bible/characters/<Other Character>]]
- mentor of → [[bible/characters/<Other Character>]]
- runs → [[bible/world/<Place or Institution>]]
- rival of → [[bible/world/<Institution>]]

## Voice
Two or three lines only they would say. Warm through exactitude, never sentiment.

## Inspired by
Real-world ore this character drew from — points **out** into research, never treated as fact.
- inspired-by → [[research/<file>]]  ( <what was borrowed; how the character diverges> )

<!--
Graph note: `type:` frontmatter + the `[[wikilinks]]` above are what GBrain and
Obsidian read to build nodes/edges. Keep link text matching the target page's
`name`/filename so edges resolve. Copy this file to `<name>.md`; delete these
comments.
-->
