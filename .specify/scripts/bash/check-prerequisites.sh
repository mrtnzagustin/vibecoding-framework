#!/bin/bash
#
# Check Prerequisites
#
# Validates that required spec files exist before proceeding with implementation
#
# Usage:
#   ./check-prerequisites.sh
#   ./check-prerequisites.sh --feature 001
#   ./check-prerequisites.sh --help

set -e

# Source common utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Show help
show_help() {
  cat << EOF
Check Prerequisites

Validates that required specification files exist for a feature.

Usage:
  $(basename "$0") [OPTIONS]

Options:
  --feature NUM       Check specific feature number
  --help, -h          Show this help message

Examples:
  $(basename "$0")
  $(basename "$0") --feature 001

Exit Codes:
  0 - All prerequisites met
  1 - Missing or invalid prerequisites

EOF
  exit 0
}

# Parse arguments
FEATURE_NUM=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --feature)
      FEATURE_NUM="$2"
      shift 2
      ;;
    --help|-h)
      show_help
      ;;
    *)
      error "Unknown option: $1"
      show_help
      ;;
  esac
done

# Get repository root
REPO_ROOT=$(get_repo_root) || exit 1

header "VibeCoding Prerequisites Check"

# Determine feature to check
if [ -z "$FEATURE_NUM" ]; then
  # Try to get from current branch
  FEATURE_NUM=$(get_feature_number)

  if [ -z "$FEATURE_NUM" ]; then
    error "Could not determine feature number"
    echo ""
    echo "Either:"
    echo "  - Run this from a feature branch (NNN-feature-name)"
    echo "  - Specify --feature NNN"
    echo ""
    exit 1
  fi

  info "Detected feature number: $FEATURE_NUM"
else
  info "Checking feature: $FEATURE_NUM"
fi

echo ""

# Find feature directory
FEATURE_DIR=$(find_feature_dir_by_prefix "$FEATURE_NUM")

if [ -z "$FEATURE_DIR" ]; then
  error "Feature directory not found for: $FEATURE_NUM"
  echo ""
  echo "Expected directory: $REPO_ROOT/specs/${FEATURE_NUM}-*"
  echo ""
  echo "Create it with:"
  echo "  npm run create-feature \"Feature Name\""
  echo ""
  exit 1
fi

success "Feature directory: $FEATURE_DIR"
echo ""

# Check required files
separator
echo "Checking Required Files"
separator
echo ""

ALL_VALID=true

# spec.md
if check_file "$FEATURE_DIR/spec.md"; then
  success "spec.md exists and has content"
else
  error "spec.md is missing or empty"
  ALL_VALID=false
fi

# plan.md
if check_file "$FEATURE_DIR/plan.md"; then
  success "plan.md exists and has content"
else
  error "plan.md is missing or empty"
  ALL_VALID=false
fi

# tasks.md
if check_file "$FEATURE_DIR/tasks.md"; then
  success "tasks.md exists and has content"
else
  error "tasks.md is missing or empty"
  ALL_VALID=false
fi

echo ""

# Check optional/additional files
separator
echo "Checking Optional Files"
separator
echo ""

OPTIONAL_FILES=(
  "research.md"
  "data-model.md"
  "quickstart.md"
  "checklist.md"
)

for file in "${OPTIONAL_FILES[@]}"; do
  if check_file "$FEATURE_DIR/$file"; then
    success "$file found"
  else
    info "$file not found (optional)"
  fi
done

echo ""

# Check constitution
separator
echo "Checking Constitution"
separator
echo ""

CONSTITUTION="$REPO_ROOT/.specify/memory/constitution.md"

if check_file "$CONSTITUTION"; then
  success "Constitution exists"

  # Check if it has meaningful content (more than 100 lines)
  LINE_COUNT=$(wc -l < "$CONSTITUTION")

  if [ "$LINE_COUNT" -gt 100 ]; then
    success "Constitution has $LINE_COUNT lines"
  else
    warning "Constitution seems short ($LINE_COUNT lines)"
    warning "Consider expanding it with project-specific rules"
  fi
else
  error "Constitution is missing or empty"
  echo ""
  echo "Expected file: $CONSTITUTION"
  echo "Use template: $REPO_ROOT/.specify/templates/constitution-template.md"
  echo ""
  ALL_VALID=false
fi

echo ""

# Final result
separator

if [ "$ALL_VALID" = true ]; then
  success "All prerequisites met! ✨"
  separator
  echo ""
  echo "You're ready to start implementing!"
  echo ""
  echo "Feature: $(basename "$FEATURE_DIR")"
  echo "Spec:    $FEATURE_DIR/spec.md"
  echo "Plan:    $FEATURE_DIR/plan.md"
  echo "Tasks:   $FEATURE_DIR/tasks.md"
  echo ""
  exit 0
else
  error "Prerequisites check failed! ❌"
  separator
  echo ""
  echo "Fix the issues above before proceeding."
  echo ""
  echo "Required files:"
  echo "  - $FEATURE_DIR/spec.md"
  echo "  - $FEATURE_DIR/plan.md"
  echo "  - $FEATURE_DIR/tasks.md"
  echo "  - $CONSTITUTION"
  echo ""
  echo "Use templates from:"
  echo "  $REPO_ROOT/.specify/templates/"
  echo ""
  exit 1
fi
