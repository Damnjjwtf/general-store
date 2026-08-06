# Moodboard 01 — object still-lifes (premise-agnostic)

First generation pass against `art/tone-board.md`. **Objects and place only** — no characters, nothing era-specific — so these hold whatever premise we choose.

- **Model:** `cinematic_studio_2_5` (Higgsfield Cinema Studio Image 2.5 — cinematic stills)
- **Resolution:** 2k · **Date:** 2026-08-06
- **Negative intent:** every prompt carries `no brand logos, no trademarks, no text` per `legal/notes.md`.

> **Files not committed:** this environment's network policy blocks the CDN host, so the PNGs couldn't be downloaded into `assets/`. Grab them from the URLs below (or the higgsfield gallery) and drop them into `assets/` with the filenames noted, then delete this notice.

---

## 01 — Copper saucepan on a shelf
*Target: the hero object, north light, patina not polish.*
- **Seed:** `227617` · **4:5** · 1856×2304 · → `assets/tone-01-copper-saucepan.png`
- **Prompt:** Photorealistic still-life. A single tin-lined copper saucepan resting on a hand-built wooden shelf, north window light falling from the left, warm earthy palette of copper and brass and cream, worn wood grain, 35mm film grain, shallow depth of field, patina not polish, quiet and lived-in, no brand logos, no trademarks, no text
- **URL:** https://d8j0ntlcm91z4.cloudfront.net/user_30lhFSwvQl5PucpcfXIr3L70XUZ/hf_20260806_181210_1fc33e3b-d229-4606-9a2d-d11f666f3d47.png

## 02 — Carbon-steel knife on butcher block
*Target: practical light, oxblood/brass, honest shadow.*
- **Seed:** `590075` · **3:2** · 2528×1696 · → `assets/tone-02-carbon-knife.png`
- **Prompt:** Photorealistic still-life. A carbon-steel chef's knife resting on a worn butcher block, single practical lamp overhead, oxblood and brass tones, honest deep shadows, tactile texture, 35mm film grain, warm low saturation, patina not polish, no brand logos, no trademarks, no text
- **URL:** https://d8j0ntlcm91z4.cloudfront.net/user_30lhFSwvQl5PucpcfXIr3L70XUZ/hf_20260806_181210_5cc1f7bc-afd4-40a2-98fe-4e37285c4f39.png

## 03 — Shop interior, golden hour
*Target: the store as a character; a room you enter.*
- **Seed:** `572406` · **16:9** · 2752×1536 · → `assets/tone-03-shop-interior.png`
- **Prompt:** Cinematic wide shot. Interior of a small specialty kitchenware shop at golden hour, black and white checkerboard tile floor, hand-built wooden shelving, copper pots and pans on the walls, warm directional light through a front window, empty of people, lived-in and curated, 35mm film grain, warm low saturation palette, no brand logos, no trademarks, no text
- **URL:** https://d8j0ntlcm91z4.cloudfront.net/user_30lhFSwvQl5PucpcfXIr3L70XUZ/hf_20260806_181210_fd0fa19e-435c-4aa6-8ac0-59e703ca5eff.png

## 04 — Whisk on cream enamel (macro)
*Target: the humblest object given portrait light.*
- **Seed:** `851603` · **4:5** · 1856×2304 · → `assets/tone-04-whisk-enamel.png`
- **Prompt:** Photorealistic macro still-life. A wire whisk resting on a cream enamel surface, soft directional window light, mustard and brass accents, tactile texture, warm low-saturation palette, 35mm film grain, quiet and precise, no brand logos, no trademarks, no text
- **URL:** https://d8j0ntlcm91z4.cloudfront.net/user_30lhFSwvQl5PucpcfXIr3L70XUZ/hf_20260806_181210_07322c13-b290-4f5c-ba68-e7b1ddadadcf.png

---

## Notes for the next pass
Seeds are recorded so any keeper can be re-run or varied deliberately — that's the start of a repeatable house style (and what a ComfyUI LoRA would later lock in).

Once you've reviewed: mark keepers, and say what's off (too polished? too warm? too styled?). Prompt levers that map to the tone board:
- **too advertising-glossy** → push *patina, worn, imperfect, honest shadow*; drop *shallow depth of field*.
- **too warm/orange** → say *low saturation, muted, cream-forward*; name fewer warm materials.
- **too empty** → add a second object and a *hand*, moving toward the "teacher + object" frame.
