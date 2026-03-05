# visual-explainer

Claude Code plugin that generates styled HTML pages for diagrams, reviews, and visual explanations. v0.9.0.

## Architecture

```
SKILL.md              ← agent skill definition + workflow
commands/             ← slash commands (/diff-review, /generate-slides, etc.)
references/           ← CSS patterns, slide patterns, design palette, libraries
templates/            ← reference HTML templates
scripts/              ← gemini-image.sh (AI image generation)
```

## Git Workflow

- **Never push to main** — feature branch + PR merge only
- **Only kennetkusk merges to main** (branch protection enforced)
- After merge: clean up branches, create GitHub release via `gh release create`
- Pull release notes from CHANGELOG.md

## Key Rules

- Version lives in both `package.json` and `SKILL.md` metadata — keep in sync
- `GEMINI_API_KEY` comes from user's `~/.zshrc`, not `.env` in repo
- `.env` is gitignored — never commit API keys
- See `.claude/rules/` for detailed guidelines
