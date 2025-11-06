#!/bin/bash
#
# Create New Feature
#
# Creates a new feature branch and spec directory with templates
#
# Usage:
#   ./create-new-feature.sh "Feature name"
#   ./create-new-feature.sh --number 042 "Feature name"
#   ./create-new-feature.sh --help

set -e

# Source common utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Show help
show_help() {
  cat << EOF
Create New Feature

Usage:
  $(basename "$0") [OPTIONS] "feature name"

Options:
  --number NUM        Use specific feature number (e.g., 042)
  --no-branch         Don't create git branch
  --no-templates      Don't copy template files
  --help, -h          Show this help message

Examples:
  $(basename "$0") "User Authentication"
  $(basename "$0") --number 005 "Dashboard Analytics"
  $(basename "$0") --no-branch "API Documentation"

EOF
  exit 0
}

# Parse arguments
FEATURE_NAME=""
FEATURE_NUM=""
CREATE_BRANCH=true
USE_TEMPLATES=true

while [[ $# -gt 0 ]]; do
  case $1 in
    --number)
      FEATURE_NUM="$2"
      shift 2
      ;;
    --no-branch)
      CREATE_BRANCH=false
      shift
      ;;
    --no-templates)
      USE_TEMPLATES=false
      shift
      ;;
    --help|-h)
      show_help
      ;;
    *)
      if [ -z "$FEATURE_NAME" ]; then
        FEATURE_NAME="$1"
      else
        error "Too many arguments"
        exit 1
      fi
      shift
      ;;
  esac
done

# Validate feature name provided
if [ -z "$FEATURE_NAME" ]; then
  error "Feature name is required"
  echo ""
  echo "Usage: $(basename "$0") \"Feature Name\""
  echo "   or: $(basename "$0") --help"
  exit 1
fi

# Get repository root
REPO_ROOT=$(get_repo_root) || exit 1

info "Creating new feature: $FEATURE_NAME"
echo ""

# Generate feature number if not provided
if [ -z "$FEATURE_NUM" ]; then
  FEATURE_NUM=$(get_next_feature_number)
  info "Auto-generated feature number: $FEATURE_NUM"
else
  # Validate provided number format
  if ! echo "$FEATURE_NUM" | grep -qE '^[0-9]{3}$'; then
    error "Feature number must be 3 digits (e.g., 001, 042)"
    exit 1
  fi

  # Check if number already exists
  if find_feature_dir_by_prefix "$FEATURE_NUM" >/dev/null 2>&1; then
    error "Feature number $FEATURE_NUM already exists"
    exit 1
  fi

  info "Using provided feature number: $FEATURE_NUM"
fi

# Generate branch name from feature name
# Convert to lowercase, replace spaces with hyphens, remove special chars
BRANCH_SLUG=$(echo "$FEATURE_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | sed 's/ /-/g' | sed 's/--*/-/g')
BRANCH_NAME="${FEATURE_NUM}-${BRANCH_SLUG}"

# Ensure branch name is not too long (GitHub limit is 255, but keep it reasonable)
if [ ${#BRANCH_NAME} -gt 80 ]; then
  warning "Branch name is very long (${#BRANCH_NAME} chars), truncating..."
  BRANCH_SLUG=${BRANCH_SLUG:0:75}
  BRANCH_NAME="${FEATURE_NUM}-${BRANCH_SLUG}"
fi

info "Branch name: $BRANCH_NAME"

# Create spec directory
SPEC_DIR="$REPO_ROOT/specs/$BRANCH_NAME"

if [ -d "$SPEC_DIR" ]; then
  error "Spec directory already exists: $SPEC_DIR"
  exit 1
fi

info "Creating spec directory: $SPEC_DIR"
mkdir -p "$SPEC_DIR"

# Copy or create template files
TEMPLATE_DIR="$REPO_ROOT/.specify/templates"

if [ "$USE_TEMPLATES" = true ] && [ -d "$TEMPLATE_DIR" ]; then
  info "Copying template files..."

  for template in spec-template.md plan-template.md tasks-template.md; do
    DEST_FILE="$SPEC_DIR/${template%-template.md}.md"

    if [ -f "$TEMPLATE_DIR/$template" ]; then
      cp "$TEMPLATE_DIR/$template" "$DEST_FILE"
      success "Created $DEST_FILE from template"

      # Replace placeholders
      sed -i.bak "s/\[Feature Name\]/$FEATURE_NAME/g" "$DEST_FILE"
      sed -i.bak "s/NNN-feature-name/$BRANCH_NAME/g" "$DEST_FILE"
      sed -i.bak "s/\[DATE\]/$(date +%Y-%m-%d)/g" "$DEST_FILE"
      rm "${DEST_FILE}.bak" 2>/dev/null || true
    else
      warning "Template not found: $template, creating empty file"
      touch "$DEST_FILE"
    fi
  done
else
  info "Creating empty spec files..."

  for file in spec.md plan.md tasks.md; do
    DEST_FILE="$SPEC_DIR/$file"
    cat > "$DEST_FILE" << EOF
# $FEATURE_NAME

**Feature:** \`$BRANCH_NAME\`
**Created:** $(date +%Y-%m-%d)

## TODO

Fill in this file using the template from \`.specify/templates/${file%-template.md}-template.md\`

EOF
    success "Created $DEST_FILE"
  done
fi

# Create git branch if requested and git is available
if [ "$CREATE_BRANCH" = true ]; then
  if git rev-parse --git-dir >/dev/null 2>&1; then
    info "Creating git branch: $BRANCH_NAME"

    # Check if branch already exists
    if git show-ref --verify --quiet refs/heads/"$BRANCH_NAME"; then
      warning "Branch $BRANCH_NAME already exists locally"
    else
      git checkout -b "$BRANCH_NAME"
      success "Branch created and checked out"

      # Stage the new spec files
      git add "$SPEC_DIR/"
      info "Spec files staged for commit"
    fi
  else
    warning "Git repository not found, skipping branch creation"
  fi
fi

# Print summary
echo ""
separator
success "Feature created successfully!"
separator
echo ""
echo "Feature Number: $FEATURE_NUM"
echo "Feature Name:   $FEATURE_NAME"
echo "Branch Name:    $BRANCH_NAME"
echo "Spec Directory: $SPEC_DIR"
echo ""
echo "Next steps:"
echo "  1. Fill in $SPEC_DIR/spec.md (feature specification)"
echo "  2. Fill in $SPEC_DIR/plan.md (implementation plan)"
echo "  3. Fill in $SPEC_DIR/tasks.md (task breakdown)"
echo "  4. Start implementing following the tasks"
echo ""
echo "Templates available in:"
echo "  $TEMPLATE_DIR/"
echo ""

# Export environment variable for current session
export SPECIFY_FEATURE="$BRANCH_NAME"
info "Set SPECIFY_FEATURE=$BRANCH_NAME for this session"
echo ""

exit 0
