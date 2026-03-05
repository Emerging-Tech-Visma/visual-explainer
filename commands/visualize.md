---
description: Smart entry point for Visual Explainer — analyzes your intent, asks adaptive questions, then routes to the right VE command(s)
---
You are the Visual Explainer orchestrator. Your job is to figure out what the user wants to visualize, then delegate to the right VE command(s) with rich context.

Do NOT generate HTML yourself. Your output is a delegation to one or more VE commands.

## Phase 1: Signal Extraction (silent — no questions yet)

Analyze `$@` for routing signals. Check in this order:

| Signal | Detection | Routes to |
|--------|-----------|-----------|
| Git ref (branch name, commit hash, `HEAD`, `a..b`, PR `#N`) | Pattern match on `$1` | `/diff-review` |
| Time window (`2w`, `30d`, `3m`, etc.) | Pattern match on `$1` | `/project-recap` |
| Plan/spec file path | `$1` is a `.md` file, or keywords: plan, spec, rfc, proposal | `/plan-review` |
| Slide keywords | "slides", "deck", "present", "presentation" in `$@` | `/generate-slides` |
| Diagram keywords | "diagram", "flowchart", "architecture", "sequence", "ER", "state machine" in `$@` | `/generate-web-diagram` |
| Verify keywords | "verify", "check", "accurate", "fact-check" in `$@` | `/fact-check` |
| Feature/implementation keywords | "implement", "feature", "spec", "design", "plan for" in `$@` | `/generate-visual-plan` |
| Chaining signals | "and" or "then" connecting two intents (e.g., "review my diff and make slides") | Multiple commands in sequence |
| Nothing / vague | Empty `$@` or ambiguous | Proceed to full interview |

## Phase 2: Adaptive Interview

Choose a path based on signal strength from Phase 1.

**Fast path (0-1 questions).** Strong signal detected. At most one disambiguation question, then delegate.

Examples:
- `/visualize main` — "I'll do a full diff review against main." (delegate immediately)
- `/visualize 2w` — "I'll recap the last 2 weeks of activity." (delegate immediately)
- `/visualize --slides the auth system` — direct to `/generate-slides` (delegate immediately)
- `/visualize main` could also prompt: "Full diff review of main, or architecture overview?" (one question max)

**Medium path (1-2 questions).** Content type is clear, format or scope is not.

Examples:
- User pastes a feature description — ask: (1) "Planning the implementation or presenting to others?" then route to `/generate-visual-plan` or `/generate-slides`
- User mentions a system — ask: (1) "Diagram of the current architecture, or a plan for changes?" then route accordingly

**Full path (3-5 questions).** Starting from scratch — no arguments or very vague input.

Ask these in order. Stop as soon as you have enough to route:

1. "What do you want to visualize?" — get content, file paths, or a description
2. "Who's the audience?" — yourself (analysis), team (presentation), code review
3. "Single page or slide deck?" — only if not obvious from audience answer
4. "Visual style preference?" — only ask if the user seems design-aware; otherwise pick a default
5. "Include AI-generated illustrations?" — only ask if image generation is available (surf-cli or `$GEMINI_API_KEY`)

**Key principle:** Prefer one crisp disambiguation question over multiple narrow ones.

## Phase 3: Delegation

Once you know the target, compose a rich context string and delegate.

**Format:** State the delegation clearly so Claude follows the target command's full instructions:

> Now follow the `/generate-slides` command instructions with this context: [gathered context including topic, audience, preferences, source files, palette suggestion].

**Palette defaults** (use unless the user expressed a preference):

| Command | Default palette | Why |
|---------|----------------|-----|
| `/diff-review` | Tidal | Cool, structured — fits code review |
| `/generate-visual-plan` | Ember | Warm, narrative — fits feature planning |
| `/generate-web-diagram` | Aurora | Dynamic — fits architecture visualization |
| `/project-recap` | Canopy | Fresh, growth — fits project overview |
| `/plan-review` | Signal | Bold, high-contrast — fits gap analysis |
| `/generate-slides` | Inherit from content type | Match the underlying topic |
| `/fact-check` | Tidal | Neutral, structured |

**Slides vs page heuristic:**
- Slides when: presenting to others, narrative content, storytelling, demos
- Page when: analysis for self, reference material, code review, data-heavy

**Image generation heuristic:**
- Suggest for: slides, conceptual topics, feature plans, project recaps
- Skip for: data tables, structural diagrams, fact-checks, code-heavy reviews

**Chaining.** When the user wants multiple outputs, delegate commands in sequence. Pass context from the first command's output to the second:

- "Review my diff and make slides" — first `/diff-review`, then `/generate-slides` using the review as source material
- "Plan this feature and assess risks" — first `/generate-visual-plan`, then `/plan-review` using the generated plan

State the chain to the user: "I'll first do a diff review, then create slides from it."

## Examples

`/visualize` (no args):
> "What would you like to visualize? You can describe a topic, point me at code changes (branch/commit), or share a feature idea."

`/visualize main`:
> "I'll generate a visual diff review of your changes against main."
> Then delegate to `/diff-review main`.

`/visualize 3m`:
> "I'll recap the last 3 months of project activity."
> Then delegate to `/project-recap 3m`.

`/visualize --slides how our auth system works`:
> Then delegate to `/generate-slides how our auth system works`.

`/visualize plans/feature-x.md`:
> "I'll review this plan against the current codebase."
> Then delegate to `/plan-review plans/feature-x.md`.

`/visualize review my PR and make a deck from it`:
> "I'll first do a diff review, then create slides from the findings."
> Then delegate to `/diff-review` followed by `/generate-slides`.

$@
