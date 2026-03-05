# ET-Team Complete Design Reference

---

## Team Avatars

| Member           | Initials | Gradient                               | Spirit Animal | Image                                      |
| ---------------- | -------- | -------------------------------------- | ------------- | ------------------------------------------ |
| Janne Katajamaki | JK       | `#009F93 -> #0E7F88` (turquoise-green) | Moose         | `frontend/images/team/moose-janne.webp`    |
| Teemu Keiski     | TK       | `#8CB501 -> #6B8C01` (lime)            | Beaver        | `frontend/images/team/beaver-teemu.webp`   |
| Kennet Kusk      | KK       | `#F97C00 -> #C66300` (orange)          | Octopus       | `frontend/images/team/octopus-kennet.webp` |
| Morten Nilsson   | MN       | `#EF564B -> #C63E35` (coral)           | Fox           | `frontend/images/team/fox-morten.webp`     |

---

## Brand Colors (Visma)

| Name            | Hex       | CSS Variable        | Usage                        |
| --------------- | --------- | ------------------- | ---------------------------- |
| Visma Green     | `#0E7F88` | `--visma-green`     | Primary actions, links, CTAs |
| Visma Turquoise | `#009F93` | `--visma-turquoise` | Hover states, gradients      |
| Visma Lime      | `#8CB501` | `--visma-lime`      | Success, highlights, labels  |
| Visma Orange    | `#F97C00` | `--visma-orange`    | Warnings, accents            |
| Visma Coral     | `#EF564B` | `--visma-coral`     | Errors, destructive actions  |
| Visma Yellow    | `#F4CD4E` | `--visma-yellow`    | Draft status                 |
| Visma Red       | `#E70641` | `--visma-red`       | Critical alerts              |

## Dark Mode Surfaces

| Name             | Hex       | CSS Variable               |
| ---------------- | --------- | -------------------------- |
| Background       | `#0A1628` | `--color-bg`               |
| Surface          | `#111827` | `--color-surface`          |
| Surface Elevated | `#1F2937` | `--color-surface-elevated` |
| Surface Hover    | `#374151` | `--color-surface-hover`    |

## Accent / Text / Border

| Token          | Value                    | Variable                 |
| -------------- | ------------------------ | ------------------------ |
| Accent         | `#0E7F88`                | `--color-accent`         |
| Accent Hover   | `#009F93`                | `--color-accent-hover`   |
| Accent Glow    | `rgba(14,127,136,0.2)`   | `--color-accent-glow`    |
| Accent Subtle  | `rgba(14,127,136,0.1)`   | `--color-accent-subtle`  |
| Text Primary   | `#F9FAFB`                | `--color-text`           |
| Text Secondary | `#9CA3AF`                | `--color-text-secondary` |
| Text Muted     | `#6B7280`                | `--color-text-muted`     |
| Border         | `rgba(255,255,255,0.08)` | `--color-border`         |
| Border Strong  | `rgba(255,255,255,0.15)` | `--color-border-strong`  |

## Status Colors

| Status    | Color     | Background              |
| --------- | --------- | ----------------------- |
| Draft     | `#FBBF24` | `rgba(251,191,36,0.15)` |
| Published | `#34D399` | `rgba(52,211,153,0.15)` |

---

## Typography

```
Display/Body: "Plus Jakarta Sans", -apple-system, BlinkMacSystemFont, sans-serif
Mono:         "JetBrains Mono", monospace
```

| Element       | Size                        | Weight | Line Height | Letter Spacing    |
| ------------- | --------------------------- | ------ | ----------- | ----------------- |
| Hero Title    | clamp(2.5rem, 6vw, 4rem)    | 800    | 1.1         | -0.03em           |
| Page Title    | clamp(1.75rem, 4vw, 2.5rem) | 700    | 1.2         | -0.02em           |
| Section Title | 1.35rem                     | 700    | 1.3         | -0.01em           |
| Card Title    | 1.15rem                     | 700    | 1.4         | -0.01em           |
| Body          | 1rem                        | 400    | 1.7         | 0                 |
| Caption       | 0.85rem                     | 500    | 1.5         | 0                 |
| Label         | 0.75rem                     | 600    | 1.0         | 0.1em (uppercase) |

## Spacing

| Token         | Value         |
| ------------- | ------------- |
| `--space-xs`  | 0.5rem (8px)  |
| `--space-sm`  | 1rem (16px)   |
| `--space-md`  | 1.5rem (24px) |
| `--space-lg`  | 2.5rem (40px) |
| `--space-xl`  | 4rem (64px)   |
| `--space-2xl` | 6rem (96px)   |
| `--space-3xl` | 8rem (128px)  |
| `--space-4xl` | 10rem (160px) |

## Border Radius / Transitions

| Token           | Value                             |
| --------------- | --------------------------------- |
| `--radius-sm`   | 6px                               |
| `--radius-md`   | 10px                              |
| `--radius-lg`   | 16px                              |
| `--radius-xl`   | 20px                              |
| `--ease-out`    | cubic-bezier(0.22, 1, 0.36, 1)    |
| `--ease-spring` | cubic-bezier(0.34, 1.56, 0.64, 1) |

---

## Content Palettes

| Palette             | Accent 1  | Accent 2  | RGB 1      | RGB 2      | Prompt Description   | Character                       |
| ------------------- | --------- | --------- | ---------- | ---------- | -------------------- | ------------------------------- |
| **Tidal** (default) | `#0E7F88` | `#009F93` | 14,127,136 | 0,159,147  | Teal and turquoise   | Cool, structured, authoritative |
| **Ember**           | `#F97C00` | `#EF564B` | 249,124,0  | 239,86,75  | Orange and coral     | Warm, narrative, engaging       |
| **Canopy**          | `#8CB501` | `#0E7F88` | 140,181,1  | 14,127,136 | Lime and teal        | Fresh, growth-oriented          |
| **Aurora**          | `#009F93` | `#F97C00` | 0,159,147  | 249,124,0  | Turquoise and orange | Dynamic, homepage-gradient feel |
| **Signal**          | `#EF564B` | `#8CB501` | 239,86,75  | 140,181,1  | Coral and lime       | Bold, high-contrast             |

Legacy mapping: `technical` -> tidal, `narrative` -> ember, `expressive` -> aurora.

---

## Art Styles (7 styles)

Used for hero images, inline images, and presentation slides.

### Expressive

Dynamic sketch, flowing movement. Loose, energetic hand-drawn feel with visible brush/pen strokes.

**Hero/Inline prompt:**

> Bold experimental illustration of {subject}. Abstract geometric forms, high contrast, energetic composition. {accent1} and {accent2} accents on dark surface (#111827). Sharp edges, dynamic movement. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Sweeping diagonal brush strokes, ink splatters, dynamic swooshes. Rough watercolor paper texture with visible grain and paint bleeds.

### Editorial

Panoramic, thoughtful layout. Sophisticated layered layout with overlapping panels and pull-quotes.

**Hero/Inline prompt:**

> Editorial overview illustration of {subject}. Panoramic composition with layered elements. {accent1} and {accent2} accents on dark surface (#111827). Balanced, thoughtful layout. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Thin ruled lines, dotted separators, pull-quote marks, column-style framing. Smooth matte paper with subtle halftone dot pattern overlay.

### Framework

Structured diagram layout. Clean wireframe-like composition with boxes, connectors, and hierarchy.

**Hero/Inline prompt:**

> Structured framework diagram of {subject}. Organized hierarchy with connected nodes and precise lines. {accent1} and {accent2} accents on dark surface (#111827). Systematic, clean composition. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Thin-line boxes, connecting arrows, dotted grid lines, systematic node-and-edge motifs. Clean graph-paper grid with faint blue lines on dark background.

### Narrative

Warm, organic story illustration. Organic, story-like scenes with depth and layered elements.

**Hero/Inline prompt:**

> Warm editorial illustration of {subject}. Flowing organic shapes, dynamic composition. {accent1} and {accent2} accents on dark surface (#111827). Confident brushwork, slight grain texture. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Flowing organic shapes, leaf/vine motifs, warm layered landscapes, storybook framing. Aged parchment with warm tone and soft vignette edges.

### Technical

Precise geometric forms. Systematic, engineering-blueprint aesthetic.

**Hero/Inline prompt:**

> Clean technical illustration of {subject}. Precise geometric forms, subtle grid overlay. {accent1} and {accent2} accents on dark surface (#111827). Minimal, structured composition. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Precise geometric shapes, measurement lines, angle markers, schematic diagram elements. Dark blueprint paper with fine white grid overlay.

### Flowchart

Data flow visualization. Abstract nodes, streams, and flowing data pathways.

**Hero/Inline prompt:**

> Data visualization illustration of {subject}. Abstract chart forms, flowing data streams. {accent1} and {accent2} gradients on dark surface (#111827). Geometric precision with organic data flow. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Glowing data streams, particle trails, connected nodes with pulsing lines, abstract circuit paths. Deep dark surface with subtle scanline effect and digital phosphor glow.

### Dark Tech

Futuristic neon glow. HUD elements, holographic overlays.

**Hero/Inline prompt:**

> Dark tech illustration of {subject}. Abstract geometric forms, glitch-inspired details. {accent1} and {accent2} accents on dark surface (#111827). High contrast, cyberpunk-influenced composition. 50% negative space. NO signatures or watermarks. 16:9 aspect ratio. Do NOT include any text.

**Slide decoration:** Neon-edged panels, holographic scan lines, glitch artifacts, HUD-style brackets and targeting reticles. Deep black with chromatic aberration edges, scanlines, and subtle matrix-rain pattern.

---

## Graphic Presets (8 presets + Text Slide)

Used for inline images and presentation slides.

### Text Slide (default)

Title + body as rendered text. No extra graphics.

### Infographic

Hand-drawn icons, numbered steps, visual elements alongside text.

- Charming sketchy style with colored pencil and ink on textured paper
- Stylized icons, symbols, small illustrations alongside text
- Numbered steps or visual flow to organize information
- Hand-drawn arrows, brackets, dotted connectors, small diagrams
- Multi-panel layout with hand-drawn borders
- Robots, gears, brain icons, lightbulbs (no human figures)

### Architecture Diagram

System boxes, layers, arrows, components.

- Labeled boxes/containers for system components
- Layers (frontend, backend, database) with clear separation
- Arrows for data flow and connections
- Small icons inside boxes (cloud, database, server)
- Clean structural layout with grid alignment
- Technology labels next to components

### Flowchart

Process flow with decisions, diamonds, branches.

- Standard shapes: ovals (start/end), rectangles (process), diamonds (decision)
- Yes/No labels on decision branches
- Consistent flow direction (top-to-bottom or left-to-right)
- Color-coded step types using accent colors
- 5-8 nodes maximum for readability

### Concept Map

Central concept with related ideas radiating outward.

- Central concept in middle, connected ideas radiating out
- Circles or rounded boxes for each concept node
- Connecting lines with relationship labels
- Visual hierarchy: larger nodes for main concepts
- Color-coded concept clusters

### Comparison

Side-by-side or before/after layout for pros/cons.

- Two clear halves (left vs right, or before vs after)
- Visual divider (line, arrow, or VS symbol)
- Matched visual elements on each side
- Accent colors to distinguish the two sides
- Clear labels for each side

### Timeline

Sequential events on a visual timeline.

- Horizontal or vertical timeline line as backbone
- Events/milestones as nodes along the line
- Dates or sequence numbers at each node
- Small illustrations or icons at key milestones
- 4-7 timeline points maximum

### Data Visualization

Charts, metrics, visual data.

- Key metrics as large, prominent numbers with labels
- Simple chart forms (bar, pie, line, area)
- Accent colors for data highlights and trends
- Hand-drawn chart style matching art aesthetic
- Trend arrows (up/down) where relevant
- 3-4 data points maximum

### Text Table

Styled data table with header row and clean data rows.

- Dark navy background (#0f172a) with accent-colored header row
- Bold white text on accent color background for headers
- Alternating subtle dark shades (#1e293b / #0f172a) for data rows
- Thin muted cell borders
- 4-6 columns and 3-5 data rows maximum
- Table occupies ~60% of slide area

---

## CLI Image Generation (Nano Banana)

```bash
bun scripts/generate-image.ts [options] "prompt" output.png
```

### 7 Style Presets (`--style <name>`)

| Style        | Description                                                        | Composition                                  |
| ------------ | ------------------------------------------------------------------ | -------------------------------------------- |
| `expressive` | Dynamic sketch, flowing movement, energetic ink strokes            | Flowing, dynamic, elements emanating outward |
| `editorial`  | Editorial illustration, satirical/commentary, dramatic perspective | Dramatic perspective, fish-eye or bird's-eye |
| `framework`  | Clean structured framework/maturity model diagram                  | Organized grid layout with clear hierarchy   |
| `narrative`  | Watercolor sketch, story-telling, emotion and narrative            | Thoughtful composition, cause/effect         |
| `technical`  | Professional technical architecture diagram                        | Grid-aligned boxes with connection lines     |
| `flowchart`  | Clear process flowchart with standard shapes                       | Clear directional flow with proper spacing   |
| `dark-tech`  | Dark futuristic tech diagram, neon glow aesthetic                  | Circuit board pattern, neon glow borders     |

### 6 Workflow Presets (`--workflow <name>`)

| Workflow       | Description                                           | Composition                                        |
| -------------- | ----------------------------------------------------- | -------------------------------------------------- |
| `blog`         | Ink-and-wash, contemplative mood, 50%+ negative space | Off-center, single focal point with negative space |
| `presentation` | Dramatic bold ink strokes, high contrast, energetic   | Diagonal composition creating tension and energy   |
| `learning`     | Loose expressive sketch, approachable, hands-on       | Central subject exploring or building              |
| `diagram`      | Technical hand-drawn diagram, editorial ink style     | Grid-aligned structural layout with connections    |
| `sketch`       | Hand-drawn conceptual sketch, designer's notebook     | Notebook sketch feel with annotations              |
| `team`         | Hand-drawn watercolor sketch, warm and human          | Warm group scene with organic watercolor flow      |

### Common Prompt Rules (all styles)

- Dark surface background: `#111827`
- Always ends with: NO text, NO signatures, NO watermarks, NO letters
- Default aspect ratio: 16:9
- ET watermark added programmatically via `sharp` (never in AI prompts)
- Model: `gemini-3-pro-image-preview`

---

## Blog Hero Image Prompt Template

```
Ink-and-wash illustration of {subject}. Confident ink strokes on dark
surface (#111827). Accent colors: {palette.promptDesc}. Contemplative
mood. 50% negative space. Subtle paper grain texture. NO signatures
or watermarks. 16:9 aspect ratio. Do NOT include any text, words,
letters, or typography in the image.
```

## Presentation Slide Style Brief Template

```
PRESENTATION STYLE BRIEF:
VISUAL STYLE: {art style visual description}
- CRITICAL BACKGROUND: #0a1628 dark navy, NO white/light backgrounds
- Title text: {accent1} color, large, top-left area
- ALL text must be LIGHT colored, NEVER black or dark gray
- Body text: #f1f5f9 (white/light gray)
- Accent colors: {accent1} and {accent2}
- Decoration: {style-specific decoration}
- Decoration position: edges and corners only, never overlapping text
- Consistent spacing: 8% margin on all sides
- Background texture: {style-specific texture}
- NO signatures, NO watermarks, NO logos
- NO borders, NO frames, NO white outlines
```

---

## Icon Assets

| Icon       | Path                                       |
| ---------- | ------------------------------------------ |
| Learn      | `frontend/images/icons/icon-learn.webp`    |
| Think      | `frontend/images/icons/icon-think.webp`    |
| Workshop   | `frontend/images/icons/icon-workshop.webp` |
| Curious    | `frontend/images/icons/icon-curious.webp`  |
| Leaders    | `frontend/images/icons/icon-leaders.webp`  |
| Shift Hero | `frontend/images/icons/shift-hero.webp`    |

---

## Component Quick Reference

### Primary Button

```css
background: var(--visma-green);
color: white;
padding: 1rem 1.75rem;
border-radius: 12px;
font-weight: 600;
box-shadow: 0 4px 20px rgba(14, 127, 136, 0.3);
/* Hover: background: var(--visma-turquoise) */
```

### Card

```css
background: var(--color-surface);
border: 1px solid var(--color-border);
border-radius: 20px;
padding: var(--space-lg);
/* Hover: translateY(-4px), shadow, border highlight */
```

### Label / Badge

```css
font-family: var(--font-mono);
font-size: 0.75rem;
text-transform: uppercase;
letter-spacing: 0.1em;
padding: 0.35rem 0.75rem;
border-radius: 100px;
```
