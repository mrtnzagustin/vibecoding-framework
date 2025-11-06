#!/usr/bin/env bash
set -e

echo "🔍 Validating Spec Structure..."
echo ""

if [ ! -d "specs" ]; then
  echo "❌ No specs folder found."
  echo ""
  echo "Create your first feature with:"
  echo "  npm run create-feature \"Feature name\""
  echo ""
  exit 1
fi

MISSING=0

for DIR in specs/*; do
  [ -d "$DIR" ] || continue

  FEATURE_NAME=$(basename "$DIR")
  echo "Checking: $FEATURE_NAME"

  for FILE in spec.md plan.md tasks.md; do
    if [ ! -f "$DIR/$FILE" ]; then
      echo "  ❌ Missing $FILE"
      MISSING=1
    elif [ ! -s "$DIR/$FILE" ]; then
      echo "  ❌ Empty $FILE"
      MISSING=1
    else
      LINES=$(wc -l < "$DIR/$FILE")
      echo "  ✅ $FILE ($LINES lines)"
    fi
  done

  echo ""
done

if [ $MISSING -ne 0 ]; then
  echo "❌ Spec validation failed!"
  echo ""
  echo "Each feature folder must contain:"
  echo "  - spec.md (feature specification)"
  echo "  - plan.md (implementation plan)"
  echo "  - tasks.md (task breakdown)"
  echo ""
  echo "Use templates from .specify/templates/"
  echo ""
  exit 1
fi

echo "✅ All feature folders have valid specs!"
