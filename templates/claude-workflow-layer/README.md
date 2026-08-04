# claude-workflow-layer (drop-in template)

Provisions our standard Claude Code workflow layer — **ponytail** + **gstack** — automatically, so you never hand-install them per project again.

- **ponytail** (`DietrichGebert/ponytail`) — "write the minimum viable code / don't over-build." Declared as a plugin; loads automatically.
- **gstack** (`garrytan/gstack`) — the opinionated slash-command workflow suite. Cloned into `~/.claude/skills/gstack` by a SessionStart hook.

## Why this exists

On Claude Code **web / cloud** sessions the environment is ephemeral: `~/.claude` is wiped between sessions, so a one-time global install never survives — you'd otherwise re-run the setup every session. This template moves that into the repo so it happens on its own.

The permanent, environment-wide alternative (covers every project at once) is to put the two install commands in your **environment's setup script** (Claude Code web → environment settings). Use that *and/or* this per-repo template.

## Install into a new project

From the new project's root:

```bash
mkdir -p .claude/hooks
cp -r /path/to/templates/claude-workflow-layer/hooks/provision-workflow-layer.sh .claude/hooks/
chmod +x .claude/hooks/provision-workflow-layer.sh
# merge settings.json below into the project's .claude/settings.json
```

`.claude/settings.json` (merge, don't clobber existing keys):

```json
{
  "extraKnownMarketplaces": {
    "ponytail": { "source": { "source": "github", "repo": "DietrichGebert/ponytail" } }
  },
  "enabledPlugins": ["ponytail@ponytail"],
  "hooks": {
    "SessionStart": [
      { "hooks": [ { "type": "command", "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/provision-workflow-layer.sh" } ] }
    ]
  }
}
```

Commit both files. Next session, the hook clones gstack and ponytail loads from the plugin declaration.

## Notes

- The hook is idempotent and always exits 0 — a provisioning hiccup never blocks the session.
- It skips gstack's `./setup` (which builds the `/browse` Chrome binary) because that download host is blocked in this environment. Run `~/.claude/skills/gstack/setup` by hand once if you need `/browse`, pointing Playwright at a reachable/pre-installed Chromium.
- **GBrain** (persistent agent memory) pairs with gstack and is the natural next add for projects that need cross-session memory — see the project notes where relevant.
