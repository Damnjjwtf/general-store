# CLAUDE.md — General Store

One-hour period dramedy. Working title. **A fiction inspired by Chuck Williams and the specialty-retail revolution** — not a biography of him. The real man is a seed, not a subject.

You own **prose and world**. See `AGENTS.md` for the tooling side (also yours here).

**Workflow layer:** this project uses **ponytail** (`DietrichGebert/ponytail`) and **gstack** (`garrytan/gstack`) — our standard Claude Code skill/workflow repos, installed into `~/.claude`. See `README.md` § "The workflow layer" for setup and why it re-installs each session. gstack's slash-commands are available via its skill router.

---

## 1. What this is, and what it is not

This is invented. The protagonist is a character, free to differ from the real Chuck Williams in name, race, city, era, and life. The premise is **locked** (2026-08-06): a Black proprietor in 1972 Chicago, curating an invented South Side neighborhood's general store into something finer — see `bible/premise.md`. The research is a skeleton, not a script: real city and real dynamics, invented institutions and people (`bible/world/fictionalization.md`).

Two kinds of material, kept apart:

- **Reference** — real-world inspiration. Lives in `research/`. Read it to enrich the fiction; never treat it as facts the fiction must obey. Chuck Williams, French cookware, mail-order retail, the mid-century American kitchen: raw ore.
- **World** — the invented canon. Lives in `bible/`. This is what the show must stay consistent with. When people say "canon" on this project, they mean the bible, not history.

If you can't tell which a sentence is, it's world. Put it in the bible; consult research when you want texture.

There is no source-tagging system here. We are not verifying claims about a real person, because the story does not assert any. Continuity — the fiction agreeing with itself — is the discipline that replaces verification.

---

## 2. The real person: a light guardrail

Inspired-by fiction is low legal exposure. Two lines only:

- Do not present a **defamatory falsehood as fact about the real Chuck Williams** (or any other real, named person). Invent freely about the *character*; don't put invented crimes, scandals, or private-life claims in the mouth of history.
- Do not reproduce real **trademarks** — Williams-Sonoma logos, catalog copy, product photography — as if genuine. If a real brand is referenced, note it in `legal/`.

That's the whole gate. It exists once, in `legal/notes.md`, not on every line.

---

## 3. Voice and tone

**Tonal references:** Northern Exposure, Newhart, I'll Fly Away, Lessons in Chemistry, Julia, The Durrells in Corfu, Halt and Catch Fire. The Bear sparingly — for work, standards, and chosen family, not for kinetics.

**Register:** warm but not sentimental. The comedy comes from objects and misunderstanding, not from quips. A soufflé dish is funnier than a joke about a soufflé dish.

**The engine:** a reserved, exacting person teaching people to want things they have no words for. Every episode should have a moment where an object is explained and something else gets explained along with it.

**Banned:** founder-genius voiceover. Anachronistic irony. Characters who know they're in history. Any line that could appear in a housewares commercial.

---

## 4. Structure

Structure is not chosen by taste. It is developed in **Structure Lab** and locked in `structure/selected.md`.

The premise is locked (§1), so the Lab is unblocked: run competing structural approaches through it as ingredient sets, write them to `structure/candidates.md` with stable ids, and only then lock a selection.

Do not write beats until `structure/selected.md` exists and is locked.

---

## 5. Workflow

```
research/  →  structure/  →  bible/  →  scripts/pilot/  →  deck/
```

Strictly one-directional. The deck is downstream of a script that works. If you find yourself writing deck copy to justify a beat, you've inverted the pipeline.

**Per session:** skim `research/` for texture, but build in `bible/`. Read `structure/selected.md` before touching beats. Never bend the world to make one scene work without recording it — edit the scene, or update the bible deliberately and note why.

**Fountain** is the script format. Plain text, git-diffable. One file per script.

---

## 6. House style

- Terse. Concept-forward. No preamble, no throat-clearing, no summarizing what was just asked.
- Confidence labels on substantive claims: (high) / (medium) / (low).
- Say "I don't know" rather than guessing. List open uncertainties at the end of substantive output.
- No em-dash-heavy corporate cadence. No "it's not X, it's Y."
- Push back when the material doesn't support the ambition.

## 7. Never

- Never present invented events as things the real Chuck Williams actually did.
- Never let the bible contradict itself; fix the newer claim or revise deliberately.
- Never reproduce real trademarks or catalog copy in `deck/` without a note in `legal/`.
- Never commit credentials. Keys live in a gitignored `.env`.
