#!/usr/bin/env bash
#
# SessionStart hook — provision the reusable workflow layer in this ephemeral
# cloud environment (~/.claude is wiped between sessions, so a global install
# never survives; this re-establishes it automatically each session).
#
# - gstack (garrytan/gstack): cloned into ~/.claude/skills/gstack so its skills
#   auto-discover. We deliberately DO NOT run ./setup here — that builds the
#   /browse Chrome binary (slow, and its download host is blocked in this
#   environment). Run `~/.claude/skills/gstack/setup` by hand once if you need
#   /browse, pointing Playwright at the pre-installed Chromium (/opt/pw-browsers).
# - ponytail (DietrichGebert/ponytail): declared as a plugin in
#   .claude/settings.json (extraKnownMarketplaces + enabledPlugins), so Claude
#   Code loads it automatically — no action needed here.
#
# Always exits 0: a provisioning hiccup (e.g. offline) must never block the session.

set -uo pipefail

GSTACK_DIR="$HOME/.claude/skills/gstack"

if [ ! -d "$GSTACK_DIR/.git" ]; then
  mkdir -p "$HOME/.claude/skills"
  if git clone --single-branch --depth 1 \
      https://github.com/garrytan/gstack.git "$GSTACK_DIR" >/dev/null 2>&1; then
    echo "[workflow-layer] gstack cloned into ~/.claude/skills/gstack" >&2
  else
    echo "[workflow-layer] gstack clone failed (offline or host blocked); skipping" >&2
  fi
else
  echo "[workflow-layer] gstack already present" >&2
fi

exit 0
