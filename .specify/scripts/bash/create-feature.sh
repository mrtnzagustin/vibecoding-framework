#!/usr/bin/env bash
set -e

FEATURE_NAME_RAW="$*"

if [ -z "$FEATURE_NAME_RAW" ]; then
  read -p "Feature name (e.g. User authentication): " FEATURE_NAME_RAW
fi

mkdir -p specs

# Find next feature number
LAST_NUM=$(ls specs 2>/dev/null | grep '^[0-9][0-9][0-9]-' | sort | tail -n1 | cut -d'-' -f1)
if [ -z "$LAST_NUM" ]; then
  NEXT_NUM="001"
else
  NEXT_NUM=$(printf "%03d" $((10#$LAST_NUM + 1)))
fi

# Create slug from feature name
SLUG=$(echo "$FEATURE_NAME_RAW" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
FEATURE_DIR="specs/${NEXT_NUM}-${SLUG}"

mkdir -p "$FEATURE_DIR"

# Copy templates
if [ -f ".specify/templates/spec-template.md" ]; then
  sed "s/\[NNN\]/${NEXT_NUM}/g; s/\[DATE\]/$(date +%Y-%m-%d)/g; s/\[Feature Name\]/${FEATURE_NAME_RAW}/g" \
    .specify/templates/spec-template.md > "${FEATURE_DIR}/spec.md"
else
  echo "# ${NEXT_NUM} ${FEATURE_NAME_RAW} - Spec" > "${FEATURE_DIR}/spec.md"
fi

if [ -f ".specify/templates/plan-template.md" ]; then
  sed "s/\[NNN\]/${NEXT_NUM}/g; s/\[DATE\]/$(date +%Y-%m-%d)/g; s/\[Feature Name\]/${FEATURE_NAME_RAW}/g" \
    .specify/templates/plan-template.md > "${FEATURE_DIR}/plan.md"
else
  echo "# ${NEXT_NUM} ${FEATURE_NAME_RAW} - Plan" > "${FEATURE_DIR}/plan.md"
fi

if [ -f ".specify/templates/tasks-template.md" ]; then
  sed "s/\[NNN\]/${NEXT_NUM}/g; s/\[DATE\]/$(date +%Y-%m-%d)/g; s/\[Feature Name\]/${FEATURE_NAME_RAW}/g" \
    .specify/templates/tasks-template.md > "${FEATURE_DIR}/tasks.md"
else
  echo "# ${NEXT_NUM} ${FEATURE_NAME_RAW} - Tasks" > "${FEATURE_DIR}/tasks.md"
fi

echo ""
echo "✅ Created feature folder: ${FEATURE_DIR}"
echo ""
echo "Next steps:"
echo "  1. Edit ${FEATURE_DIR}/spec.md (define WHAT and WHY)"
echo "  2. Edit ${FEATURE_DIR}/plan.md (define HOW)"
echo "  3. Edit ${FEATURE_DIR}/tasks.md (break into tasks)"
echo "  4. Start implementing!"
echo ""
echo "Optionally create a branch:"
echo "  git checkout -b ${NEXT_NUM}-${SLUG}"
echo ""
