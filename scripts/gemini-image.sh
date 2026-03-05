#!/usr/bin/env bash
# gemini-image.sh — Generate images via Gemini 3.1 Flash Image Preview API
# Usage: bash scripts/gemini-image.sh --prompt "..." --output /tmp/img.png [--aspect-ratio 16:9]
set -euo pipefail

# Load .env if GEMINI_API_KEY not already in environment
# Search order: shell env (already set) > project .env > home ~/.env
if [[ -z "${GEMINI_API_KEY:-}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  for envfile in "$SCRIPT_DIR/../.env" "./.env" "$HOME/.env"; do
    if [[ -f "$envfile" ]]; then
      while IFS='=' read -r key value; do
        case "$key" in
          Gemini_API_Key|GEMINI_API_KEY) export GEMINI_API_KEY="${value}" ;;
          Gemini_Model|GEMINI_MODEL) export GEMINI_MODEL="${value}" ;;
        esac
      done < "$envfile"
      break
    fi
  done
fi

PROMPT=""
OUTPUT=""
ASPECT_RATIO=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --prompt) PROMPT="$2"; shift 2 ;;
    --output) OUTPUT="$2"; shift 2 ;;
    --aspect-ratio) ASPECT_RATIO="$2"; shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$PROMPT" ]]; then
  echo "Error: --prompt is required" >&2; exit 1
fi
if [[ -z "$OUTPUT" ]]; then
  echo "Error: --output is required" >&2; exit 1
fi
if [[ -z "${GEMINI_API_KEY:-}" ]]; then
  echo "Error: GEMINI_API_KEY not found. Set it via:" >&2
  echo "  export GEMINI_API_KEY=your_key  (in ~/.zshrc or ~/.bashrc)" >&2
  echo "  or add GEMINI_API_KEY=your_key to ~/.env" >&2
  exit 1
fi

# Validate aspect ratio if provided
if [[ -n "$ASPECT_RATIO" ]]; then
  case "$ASPECT_RATIO" in
    1:1|16:9|9:16|4:3|3:4) ;;
    *) echo "Error: unsupported aspect ratio '$ASPECT_RATIO' (use 1:1, 16:9, 9:16, 4:3, 3:4)" >&2; exit 1 ;;
  esac
fi

MODEL="${GEMINI_MODEL:-gemini-3.1-flash-image-preview}"
URL="https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:streamGenerateContent?key=${GEMINI_API_KEY}"

# Build imageConfig block (only include aspectRatio if specified)
IMAGE_CONFIG='"imageSize": "1K"'
if [[ -n "$ASPECT_RATIO" ]]; then
  IMAGE_CONFIG="\"aspectRatio\": \"$ASPECT_RATIO\", $IMAGE_CONFIG"
fi

PAYLOAD=$(cat <<ENDJSON
{
  "contents": [{"role": "user", "parts": [{"text": "$PROMPT"}]}],
  "generationConfig": {
    "responseModalities": ["IMAGE", "TEXT"],
    "thinkingConfig": {"thinkingLevel": "MINIMAL"},
    "imageConfig": {$IMAGE_CONFIG}
  }
}
ENDJSON
)

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "$URL" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [[ "$HTTP_CODE" -ne 200 ]]; then
  echo "Error: Gemini API returned HTTP $HTTP_CODE" >&2
  echo "$BODY" | head -5 >&2
  exit 1
fi

# Extract base64 image data from streaming response using python3
if ! command -v python3 &>/dev/null; then
  echo "Error: python3 is required to decode the API response" >&2; exit 1
fi

python3 -c "
import json, base64, sys

raw = sys.stdin.read()
# streamGenerateContent returns a JSON array of chunks
try:
    chunks = json.loads(raw)
    if not isinstance(chunks, list):
        chunks = [chunks]
except json.JSONDecodeError:
    print('Error: failed to parse API response', file=sys.stderr)
    sys.exit(1)

for chunk in chunks:
    candidates = chunk.get('candidates', [])
    for candidate in candidates:
        parts = candidate.get('content', {}).get('parts', [])
        for part in parts:
            if 'inlineData' in part:
                img_bytes = base64.b64decode(part['inlineData']['data'])
                sys.stdout.buffer.write(img_bytes)
                sys.exit(0)

print('Error: no image data in response', file=sys.stderr)
sys.exit(1)
" <<< "$BODY" > "$OUTPUT"

echo "Image saved to $OUTPUT"
