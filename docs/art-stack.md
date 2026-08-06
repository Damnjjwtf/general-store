# Art stack

The tools and discipline for **how things look** — both the show (concept, character, world, key art) and the pitch (deck design + IP identity). Companion to the research stack.

## Two jobs, different tools, different moments

- **Show look** — the visual thesis is *the beauty of the well-made object*: copper glow, hand-built shelving, tile, film grain, a tight warm palette. Jobs, in order: **hero-object rendering**, **the store as a character**, **consistent recurring cast**.
- **Deck / IP look** — the pitch must itself *feel well-made*: typography-led, generous whitespace, a few gorgeous hero images, restrained palette. Plus one artifact: an **original title treatment / wordmark** for *General Store*.

## Discipline (carries over from the rest of the project)

1. **Pipeline is one-directional.** Deck art is downstream of a working script; specific character/location concepting is downstream of a **locked premise** (still open). Build the stack now; only premise-agnostic visual work (tone, palette, deck system, title exploration) starts now.
2. **Images inherit research→canon.** A pulled reference or AI moodboard is *inspiration* (`research/`, `assets/`). Once a design is adopted it becomes **canon**, tied to its `bible/` entity (the graph's `Object`/`Place`/`Character` nodes). See `bible/graph.md`.
3. **Legal.** No real Williams-Sonoma marks/catalog/product photography reproduced as genuine; the title treatment must be **original**; keep AI real-person likeness out (the protagonist is invented). See `legal/notes.md`.

## Stages & tools

| Stage | Tool | Status in this environment |
| --- | --- | --- |
| Reference / moodboards | Exa + Browser Use → `assets/`, linked in Obsidian | wired, pending keys (see `docs/research-stack.md`) |
| Concept · key art · character sheets | **higgsfield** (character-sheet workflow, reference-elements for consistency, image/video) | ✅ connected (uses credits) |
| Locked house style (repeatable) | **ComfyUI** (LoRA/IPAdapter on a chosen palette/era) | your VPS/local — **not reachable from this session** unless exposed |
| Edit · retouch · composite | **Adobe** (background/color/crop, Firefly) | ✅ connected |
| Deck · typography · IP identity | **Adobe** Express/InDesign + `find_fonts`/`font_recommend`; original title treatment | ✅ connected |

## Engine strategy (the split, not a winner)

- **higgsfield** — fast concepting, character consistency, any teaser/motion. Default here (connected).
- **ComfyUI** — when you want a *locked, repeatable house style*; train a LoRA once the premise fixes the era/palette. Best control, needs your infra.
- **Adobe / Firefly** — finishing, editing, and everything deck (type, layout, key art cleanup).

## What starts now (premise-agnostic)

1. **Tone board** — palette, light, texture, object-as-hero framing, anti-look. → `art/tone-board.md` (started).
2. **Deck design system** — type pairing, grid, color, "tactile/well-made" rules. → `art/deck-system.md` (next).
3. **Title-treatment exploration** — original *General Store* wordmarks. → `art/title/` (next).

Gated until premise locks: specific character/wardrobe/location concepting, key art, the actual deck.

## Inputs / accounts

- **higgsfield** and **Adobe** MCPs are connected in this environment; generation consumes credits/entitlements on your accounts. I'll only generate images on an explicit go-ahead.
- **ComfyUI**: tell me if there's a reachable endpoint (Tailscale/ngrok/URL) or if it stays local; otherwise I lean on higgsfield/Adobe here.
