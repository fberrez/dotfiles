#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract fields
cwd=$(echo "$input" | jq -r '.cwd // .workspace.current_dir // empty')
dir_name=$(basename "$cwd" 2>/dev/null || echo "")
model_name=$(echo "$input" | jq -r '.model.display_name // empty')

# Context window: read remaining_percentage, scale to 80% limit like GSD
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Get current git branch or worktree
git_info=""
is_worktree=false
if [ -n "$cwd" ]; then
  cd "$cwd" 2>/dev/null
fi
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  worktree_dir=$(git rev-parse --git-dir 2>/dev/null)
  if [[ "$worktree_dir" == *".git/worktrees/"* ]]; then
    is_worktree=true
  fi
  branch=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo "unknown")
  git_info="$branch"
fi

# Build parts array
DIM='\033[2m'
RESET='\033[0m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
ORANGE='\033[38;5;208m'
RED_BLINK='\033[5;31m'

parts=()

# Model
if [ -n "$model_name" ]; then
  parts+=("${DIM}${model_name}${RESET}")
fi

# Directory with worktree indicator
if [ -n "$dir_name" ]; then
  if [ "$is_worktree" = true ]; then
    parts+=("${DIM}🌴 ${dir_name}${RESET}")
  else
    parts+=("${DIM}${dir_name}${RESET}")
  fi
fi

# Git branch
if [ -n "$git_info" ]; then
  parts+=("${CYAN}${git_info}${RESET}")
fi

# Context bar (GSD style: scale remaining to 80% limit, show progress bar)
if [ -n "$remaining" ]; then
  rem=$(printf "%.0f" "$remaining" 2>/dev/null || echo "100")
  raw_used=$((100 - rem))
  if [ "$raw_used" -lt 0 ]; then raw_used=0; fi
  if [ "$raw_used" -gt 100 ]; then raw_used=100; fi
  # Scale: 80% real usage = 100% displayed
  used=$(( (raw_used * 100 + 40) / 80 ))
  if [ "$used" -gt 100 ]; then used=100; fi

  # Build progress bar (10 segments)
  filled=$((used / 10))
  empty=$((10 - filled))
  bar=$(printf '█%.0s' $(seq 1 $filled 2>/dev/null) 2>/dev/null)$(printf '░%.0s' $(seq 1 $empty 2>/dev/null) 2>/dev/null)
  # Handle edge cases
  if [ "$filled" -eq 0 ]; then bar="░░░░░░░░░░"; fi
  if [ "$filled" -eq 10 ]; then bar="██████████"; fi

  # Color based on scaled usage
  if [ "$used" -lt 63 ]; then
    parts+=("${GREEN}${bar} ${used}%${RESET}")
  elif [ "$used" -lt 81 ]; then
    parts+=("${YELLOW}${bar} ${used}%${RESET}")
  elif [ "$used" -lt 95 ]; then
    parts+=("${ORANGE}${bar} ${used}%${RESET}")
  else
    parts+=("${RED_BLINK}💀 ${bar} ${used}%${RESET}")
  fi
fi

# Join with │ separator
sep=" │ "
result=""
for i in "${!parts[@]}"; do
  if [ "$i" -gt 0 ]; then
    result="${result}${sep}"
  fi
  result="${result}${parts[$i]}"
done

printf "%b" "$result"
