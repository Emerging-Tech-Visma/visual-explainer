# Changelog

## [0.10.0] - 2026-03-05

### Orchestrator Command
- `/visualize` smart entry point — analyzes intent, asks adaptive questions, routes to the right VE command(s)
- Prioritized signal extraction with disambiguation (git refs, time windows, keywords)
- Chaining support: "review my diff and then make slides" runs multiple commands in sequence
- Palette defaults per command type (Tidal for reviews, Ember for plans, Aurora for architecture)

### Portable Paths
- All `./` relative paths replaced with `${CLAUDE_SKILL_DIR}/` for correct resolution when installed as a plugin
- Plugin works from any directory via `--plugin-dir` or marketplace install

### Plugin Marketplace
- Added `marketplace.json` for `/plugin marketplace add` installation
- Verified plugin structure: commands, references, templates, scripts all load correctly

## [0.9.0] - 2026-03-05

### HTML Quality Rules
- New `references/html-quality.md` with accessibility, touch target, contrast, and semantic HTML rules
- `:focus-visible` styles on all interactive elements across all templates
- `<main>` wrappers, `scope="col"` on table headers, `role="img"` + `aria-label` on Mermaid containers
- Quality checks in SKILL.md: accessibility, touch targets (44x44px min), contrast (4.5:1)
- `:focus-visible` CSS snippet added to `css-patterns.md` Theme Setup section

## [0.8.0] - 2026-03-05

### Design Palette
- Complete design system in `references/design-palette.md` (brand colors, typography, spacing, art styles)
- 5 content palettes (Tidal, Ember, Canopy, Aurora, Signal) with default set to Tidal
- 7 art styles with prompt templates for AI image generation
- Default aesthetic: Plus Jakarta Sans + JetBrains Mono, dark-first surfaces

### Docs
- README: Claude Code only install via `/plugin marketplace add` + `/plugin install`
- README: replaced file tree with clear "How It Works" section
- Condensed changelog for scannability

## [0.7.0] - 2026-03-05

### Gemini Image Generation
- `scripts/gemini-image.sh` for direct Gemini 3.1 Flash API image generation
- Three-tier detection: surf-cli -> `$GEMINI_API_KEY` -> skip gracefully
- Only requires `curl` + `python3`, zero breaking changes for surf-cli users

## [0.5.0] - 2026-03-04

### Class Diagram and C4 Architecture
- `classDiagram` support for OOP design and domain modeling
- C4 architecture via `graph TD` + `subgraph` (native `C4Context` ignores themes)
- `.dir-tree` CSS pattern, quick-reference table for diagram type selection

### Claude Code Plugin
- `.claude-plugin/plugin.json` manifest for `claude /install`
- Renamed `prompts/` to `commands/`

### Share Command
- `/share` for instant sharing via GCP Firebase CLI

## [0.4.5] - 2026-03-04

### Click-to-Expand Mermaid
- Click any Mermaid diagram to open full-size in a new tab
- Expand button in zoom controls, click vs drag detection

## [0.4.4] - 2026-03-02

### Hybrid Architecture Pattern
- Complex architectures (15+ elements): simple Mermaid overview + CSS Grid cards for details
- Reduced max Mermaid node count from 15-20 to 10-12

## [0.4.3] - 2026-03-01

### Mermaid Zoom Fixes
- Replaced `transform: scale()` with CSS `zoom` (fixes clipping and scroll issues)
- Vertical centering, initial zoom support, min-height containers

## [0.4.2] - 2026-03-01

### Link Styling
- Links use accent colors with sufficient contrast instead of browser defaults

## [0.4.1] - 2026-03-01

### Layout and Docs
- Prefer `flowchart TD` over `flowchart LR` for 5+ nodes
- Simplified README, added `/generate-visual-plan` to command table

## [0.4.0] - 2026-02-28

### Visual Plan Command
- `/generate-visual-plan` for implementation plans with comparison panels, state machines, code snippets, edge case tables

### Prose Accent Patterns
- Lead paragraphs, pull quotes, section dividers, article hero patterns
- Typography by content voice (literary, technical, bold, minimal)

### Code Blocks and Mermaid Fixes
- Code block patterns with `white-space: pre-wrap`
- Mermaid centering, scaling for 10+ nodes, special character quoting

## [0.3.0] - 2026-02-26

### Anti-Slop Guardrails
- Forbidden patterns: gradient text, animated glowing shadows, emoji headers
- Forbidden fonts: Inter, Roboto, Arial, Helvetica as primary
- Forbidden colors: indigo/violet range, cyan-magenta-pink combos
- 7-point "Slop Test" checklist, 5 curated palettes, 5 font pairings

## [0.2.0] - 2026-02-25

### Slide Deck Mode
- Magazine-quality slide presentations as self-contained HTML
- 10 slide types, 4 presets (Midnight Editorial, Warm Signal, Terminal Mono, Swiss Clean)
- SlideEngine JS with keyboard/touch/wheel navigation
- Cinematic transitions, responsive height breakpoints, surf-cli image integration

## [0.1.4] - 2026-02-24

- Removed Mermaid `handDrawn` mode (unreadable diagonal scribbles)
- Added `package.json` for one-step install

## [0.1.3] - 2026-02-24

- Renamed `.node` to `.ve-card` to fix Mermaid CSS collision

## [0.1.2] - 2026-02-19

- Sequence diagram syntax guidance (curly braces, brackets, ampersands break rendering)

## [0.1.1] - 2026-02-19

- Prompts self-load the skill (no longer need `pi-prompt-template-model`)
- "Writing Valid Mermaid" section in `libraries.md`
- Fixed mobile scroll offset in `responsive-nav.md`

## [0.1.0] - 2026-02-16

Initial release. Core workflow, 11 diagram types, 9 aesthetics, Mermaid deep theming, zoom controls, proactive table rendering, light/dark themes, 3 reference templates, 5 slash commands.
