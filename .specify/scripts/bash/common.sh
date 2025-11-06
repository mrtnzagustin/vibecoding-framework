#!/bin/bash
#
# Common Utilities for VibeCoding Scripts
#
# This file provides shared functions used across multiple scripts.
# Source this file in other scripts: source "$(dirname "$0")/common.sh"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Output helpers
info() {
  echo -e "${BLUE}ℹ️  $1${NC}"
}

success() {
  echo -e "${GREEN}✅ $1${NC}"
}

warning() {
  echo -e "${YELLOW}⚠️  $1${NC}"
}

error() {
  echo -e "${RED}❌ $1${NC}"
}

# Get repository root
# Returns the root directory of the repository
get_repo_root() {
  if git rev-parse --show-toplevel >/dev/null 2>&1; then
    git rev-parse --show-toplevel
  else
    # Fallback: assume we're in a subdirectory of the repo
    # Try up to 3 levels
    if [ -d "../../.specify" ]; then
      echo "$(cd ../..; pwd)"
    elif [ -d "../.specify" ]; then
      echo "$(cd ..; pwd)"
    elif [ -d ".specify" ]; then
      pwd
    else
      error "Could not find repository root (no .specify directory found)"
      return 1
    fi
  fi
}

# Get current branch name
# Returns the name of the current git branch, or from SPECIFY_FEATURE env var
get_current_branch() {
  # First, check environment variable
  if [ -n "$SPECIFY_FEATURE" ]; then
    echo "$SPECIFY_FEATURE"
    return 0
  fi

  # Try git
  if git rev-parse --git-dir >/dev/null 2>&1; then
    git branch --show-current
    return 0
  fi

  # Fallback: try to find the highest numbered spec directory
  local repo_root
  repo_root=$(get_repo_root)

  if [ -d "$repo_root/specs" ]; then
    # Find the highest numbered spec directory
    local highest
    highest=$(find "$repo_root/specs" -maxdepth 1 -type d -name '[0-9][0-9][0-9]-*' | sort -r | head -n 1)

    if [ -n "$highest" ]; then
      basename "$highest"
      return 0
    fi
  fi

  warning "Could not determine current branch or feature"
  return 1
}

# Find feature directory by prefix (e.g., "001" finds "specs/001-feature-name")
# Usage: find_feature_dir_by_prefix "001"
find_feature_dir_by_prefix() {
  local prefix="$1"
  local repo_root
  repo_root=$(get_repo_root)

  if [ ! -d "$repo_root/specs" ]; then
    return 1
  fi

  # Find directory matching the prefix
  local feature_dir
  feature_dir=$(find "$repo_root/specs" -maxdepth 1 -type d -name "${prefix}-*" | head -n 1)

  if [ -n "$feature_dir" ]; then
    echo "$feature_dir"
    return 0
  fi

  return 1
}

# Check if current branch is a feature branch (NNN-feature-name format)
# Returns 0 if valid feature branch, 1 otherwise
check_feature_branch() {
  local branch
  branch=$(get_current_branch)

  if [ -z "$branch" ]; then
    return 1
  fi

  # Check if branch matches pattern NNN-feature-name
  if echo "$branch" | grep -qE '^[0-9]{3}-[a-z0-9-]+$'; then
    return 0
  fi

  return 1
}

# Extract feature number from branch name
# Usage: get_feature_number "001-user-auth" → "001"
get_feature_number() {
  local branch="${1:-$(get_current_branch)}"

  if [ -z "$branch" ]; then
    return 1
  fi

  # Extract first 3 digits
  echo "$branch" | grep -oE '^[0-9]{3}'
}

# Check if a file exists and is non-empty
# Usage: check_file "path/to/file"
check_file() {
  local file="$1"

  if [ ! -f "$file" ]; then
    return 1
  fi

  if [ ! -s "$file" ]; then
    return 1
  fi

  return 0
}

# Check if a directory exists and is non-empty
# Usage: check_dir "path/to/dir"
check_dir() {
  local dir="$1"

  if [ ! -d "$dir" ]; then
    return 1
  fi

  # Check if directory has any files
  if [ -z "$(ls -A "$dir")" ]; then
    return 1
  fi

  return 0
}

# Get feature directory path for current or specified feature
# Usage: get_feature_dir [feature_number]
get_feature_dir() {
  local feature_num="${1:-$(get_feature_number)}"

  if [ -z "$feature_num" ]; then
    return 1
  fi

  local repo_root
  repo_root=$(get_repo_root) || return 1

  local feature_dir
  feature_dir=$(find_feature_dir_by_prefix "$feature_num")

  if [ -n "$feature_dir" ]; then
    echo "$feature_dir"
    return 0
  fi

  return 1
}

# Export feature paths as environment variables
# Sets: FEATURE_DIR, SPEC_FILE, PLAN_FILE, TASKS_FILE
export_feature_paths() {
  local feature_num="${1:-$(get_feature_number)}"

  if [ -z "$feature_num" ]; then
    error "No feature number provided or found"
    return 1
  fi

  local feature_dir
  feature_dir=$(get_feature_dir "$feature_num")

  if [ -z "$feature_dir" ]; then
    error "Feature directory not found for: $feature_num"
    return 1
  fi

  export FEATURE_DIR="$feature_dir"
  export SPEC_FILE="$feature_dir/spec.md"
  export PLAN_FILE="$feature_dir/plan.md"
  export TASKS_FILE="$feature_dir/tasks.md"

  info "Feature paths exported:"
  info "  FEATURE_DIR: $FEATURE_DIR"
  info "  SPEC_FILE: $SPEC_FILE"
  info "  PLAN_FILE: $PLAN_FILE"
  info "  TASKS_FILE: $TASKS_FILE"

  return 0
}

# Validate that required spec files exist and are non-empty
# Usage: validate_spec_files [feature_dir]
validate_spec_files() {
  local feature_dir="${1:-$(get_feature_dir)}"

  if [ -z "$feature_dir" ]; then
    error "No feature directory specified or found"
    return 1
  fi

  local all_valid=true

  # Check required files
  for file in spec.md plan.md tasks.md; do
    if ! check_file "$feature_dir/$file"; then
      error "Missing or empty: $feature_dir/$file"
      all_valid=false
    fi
  done

  if [ "$all_valid" = true ]; then
    success "All spec files validated"
    return 0
  else
    error "Spec validation failed"
    return 1
  fi
}

# Get next feature number
# Scans existing specs and returns next available number
get_next_feature_number() {
  local repo_root
  repo_root=$(get_repo_root) || return 1

  # Find highest existing feature number
  local highest=0

  if [ -d "$repo_root/specs" ]; then
    for dir in "$repo_root/specs"/[0-9][0-9][0-9]-*; do
      if [ -d "$dir" ]; then
        local num
        num=$(basename "$dir" | grep -oE '^[0-9]{3}')

        if [ -n "$num" ]; then
          # Remove leading zeros for comparison
          num=$((10#$num))

          if [ "$num" -gt "$highest" ]; then
            highest=$num
          fi
        fi
      fi
    done
  fi

  # Next number
  local next=$((highest + 1))

  # Format with leading zeros
  printf "%03d" "$next"
}

# Confirm action with user
# Usage: confirm "Are you sure?" && do_something
confirm() {
  local prompt="${1:-Are you sure?}"

  read -p "$prompt (y/N) " -n 1 -r
  echo

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 0
  else
    return 1
  fi
}

# Print a separator line
separator() {
  echo "=================================================="
}

# Print a header
header() {
  separator
  echo "$1"
  separator
  echo ""
}

export -f info success warning error
export -f get_repo_root get_current_branch get_feature_number get_feature_dir
export -f find_feature_dir_by_prefix check_feature_branch
export -f check_file check_dir validate_spec_files
export -f export_feature_paths get_next_feature_number
export -f confirm separator header
