# Share Visual Explainer Page

Share a visual explainer HTML file by uploading to GCP using the Firebase/Firestore CLI.

## Usage

```
/share <file-path>
```

**Arguments:**
- `file-path` - Path to the HTML file to share (required)

**Examples:**
```
/share ~/.agent/diagrams/my-diagram.html
/share /tmp/visual-explainer-output.html
```

## Notes

- Ensure you are authenticated with the Firebase CLI (`firebase login`)
- The HTML file is self-contained, so no additional assets need uploading
