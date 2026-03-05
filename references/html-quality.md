# HTML Quality Rules

Accessibility, interaction, and content integrity rules for generated HTML pages. Apply to every page.

Cross-references: `css-patterns.md` for reduced-motion, overflow, dark mode patterns.

## Semantic Structure

- One `<h1>` per page. Heading hierarchy: h1 > h2 > h3, no skips.
- Wrap page content in `<main>`.
- Use `<th scope="col">` (or `scope="row"`) on table headers.
- Use `<nav aria-label="Section navigation">` for navigation elements.
- Use `<section>` with headings for distinct content regions.

## Accessibility

- Always set `<html lang="en">` (or appropriate language).
- Every `<img>` must have `alt` text. Decorative images: `alt=""`.
- Mermaid diagram containers: add `role="img"` and `aria-label="Description of diagram"` to the `.mermaid-wrap` div.
- Color must not be the sole differentiator. Status indicators need text/icon alongside color (the status badge pattern in `data-table.html` already does this).
- Contrast ratios: 4.5:1 minimum for body text, 3:1 for large text (18px+ or 14px+ bold).

## Focus & Interaction

- Apply `:focus-visible` on all interactive elements (buttons, links, summary):

```css
:focus-visible {
  outline: 2px solid var(--accent);
  outline-offset: 2px;
}
```

- Never remove outline without a visible replacement.
- Hover-revealed content must also be accessible via focus.

## Touch Targets

- Minimum 44x44px for clickable elements (buttons, nav links, theme toggles).
- Minimum 8px spacing between adjacent tappable elements.
- Zoom control buttons already meet this via the `28px` size + padding in the wrap. Increase to 44px if the button is standalone (not grouped).

## Animation

- See `css-patterns.md` for `prefers-reduced-motion` pattern (required on every page).
- Entrance animations: max 400ms duration.
- Hover/state transitions: 150-250ms.
- No continuous animations after page load (except progress indicators or loading states).

## Typography

- Use `"` (curly quotes) not `"` straight quotes in visible prose. Use `&mdash;` not `--`.
- Non-breaking space (`&nbsp;`) between numbers and units: `42&nbsp;ms`.
- `font-variant-numeric: tabular-nums` on columns of numbers (KPI values, table number columns).
- `text-wrap: balance` on headings for even line breaks.

## Safe Areas

- For fullscreen/presentation pages (slide decks), add safe area insets:

```css
body {
  padding: env(safe-area-inset-top) env(safe-area-inset-right)
           env(safe-area-inset-bottom) env(safe-area-inset-left);
}
```

## Content Integrity

- No hidden truncation without `title` attribute or expandable pattern.
- `overflow-wrap: break-word` on elements that may contain long strings (URLs, file paths, code).
- `max-width: 100%` on images to prevent overflow.
- See `css-patterns.md` Overflow Protection for `min-width: 0` on flex/grid children.

## Anti-Patterns

- No `tabindex > 0` (disrupts natural tab order).
- No `role="button"` on `<div>` elements. Use `<button>` instead.
- No `aria-hidden="true"` on visible content.
- No autoplaying audio or video.
