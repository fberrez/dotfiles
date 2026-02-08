# Coding Conventions

**Analysis Date:** 2026-02-08

## Overview

This is a shell dotfiles repository containing bash and zsh configurations. All code is written in shell scripting (Bash/Zsh). No TypeScript, JavaScript, or other compiled languages are used.

## Naming Patterns

**Files:**
- Hidden configuration files prefixed with dot: `.bash_aliases`, `.bashrc`, `.zshrc`, `.functions`, `.vimrc`
- Environment-specific suffixes: `.env.dev`, `.env.prod`
- No extensions on sourced shell files (e.g., `.functions`, `.bash_aliases`)

**Functions:**
- snake_case for all function names: `resolve_display()`, `mkcd()`, `drm()`, `drmi()`, `searchjs()`, `confirm()`, `swap_dot_env()`, `kill_process_using()`, `gwa()`, `gwd()`, `parse_git_branch()`
- Descriptive names indicating purpose: action verbs followed by object
- Example from `/.functions`: `kill_process_using()` clearly indicates it kills a process by a port number

**Aliases:**
- Short abbreviations for common commands: `dps` (docker ps), `ga` (git add), `gt` (git status)
- Two-letter convention typically used: `dc` (docker compose), `gd` (git diff)
- Full words for clarity when necessary: `workspace`, `mambo`, `lsal`

**Variables:**
- UPPERCASE for environment exports: `BASH_SILENCE_DEPRECATION_WARNING`, `EDITOR`, `PATH`, `HISTFILE`, `ZSH_THEME`
- UPPERCASE with color naming: `default`, `first`, `second`, `third` (used for terminal colors in `/.bashrc`)
- Lowercase for local variables within functions: `branch`, `base`, `path`, `root`, `worktree` (from `/.functions`)

**Colors and Terminal:**
- Variables reference ANSI codes: `default="\033[39m"`, `first="\033[36m"` (from `/.bashrc` lines 31-34)

## Code Style

**Shell Dialect:**
- Primary: Bash scripting with Bash-specific features
- Secondary: Zsh configuration (`.zshrc` uses oh-my-zsh framework)
- Both shells use similar patterns but leverage shell-specific features

**Formatting:**
- Tab indentation (shown in `/.functions` lines 6-16)
- No strict formatter configured (no .editorconfig, prettier, or eslint)
- Consistent 2-space indentation in some functions: `mkdir -p "$1" && cd "$1"` (line 23 in `/.functions`)
- Conditional blocks use standard if-then-fi syntax

**Line Length:**
- No enforced maximum line length
- Examples range from short aliases to longer command chains with pipes

**Quoting:**
- Double quotes used for variables that need expansion: `"$1"`, `"$PATH"`, `"$(basename "$PWD")"`
- Single quotes used for literal strings and regex patterns: `'tree -R -aI "vendor|.git|.github|node_modules|containers|*.bson|*.metadata.json" $1'`
- Pattern in line 38 (`.functions`): `grep -r --include=*.js --exclude-dir={"vendor|.git|.github|node_modules|containers"}`

## Import Organization

**Bash/Zsh Loading:**
- Explicit conditional sourcing pattern used in `/.bashrc` (lines 4-11) and `/.zshrc` (lines 106-108):
  ```bash
  if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
  fi
  ```
- Loop-based sourcing in `/.zshrc` (lines 106-108):
  ```bash
  for file in ~/.bash_aliases ~/.functions; do
    [ -f "$file" ] && source "$file"
  done
  ```
- Sources are loaded in this order: first aliases, then functions
- Conditional sourcing prevents errors if files don't exist

**File Loading Pattern:**
- `/.bashrc` loads aliases first (line 4-6), then functions (line 9-11)
- `/.zshrc` uses loop to load both `~/.bash_aliases` and `~/.functions` (lines 106-108)
- Framework config sourced via oh-my-zsh: `source $ZSH/oh-my-zsh.sh` (line 77 in `/.zshrc`)

## Error Handling

**Exit Codes:**
- Functions explicitly use `return` statements with exit codes
- Example from `/.functions` line 46: `return 1;` for success (user confirmed)
- Line 49: `return 0;` for failure (user did not confirm)
- Note: These are inverted (1 = true, 0 = false) which is non-standard but consistent

**Error Suppression:**
- Redirect stderr to /dev/null when needed: `git branch 2> /dev/null` (line 38 in `/.bashrc`)
- Suppress background process output: `> /dev/null 2>&1 &` (line 46 in `/.bash_aliases`)
- Used selectively to hide expected errors

**Confirmation Pattern:**
- `confirm()` function in `/.functions` (lines 42-50) implements user confirmation:
  ```bash
  confirm() {
      read -p "Are you sure to: $1 [y/N]? " -n 1 -r
      echo    # move to a new line
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          return 1;
      fi
      return 0;
  }
  ```
- Used before destructive operations: `swap_dot_env()`, `gwd()` (which uses `gum confirm`)

**Command Piping:**
- Safe pipelines with error handling: `docker ps -a -f status=exited -q` piped to `docker rm` (line 28)
- Sed piping for text extraction: `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'` (line 38)

## Logging

**Framework:** `echo` and `echo -n` for standard output

**Patterns:**
- User-facing messages use `echo`: `echo "Turning on the screen"` (line 6 in `/.functions`)
- Interactive prompts use `read -p`: `read -p "Are you sure to: $1 [y/N]? " -n 1 -r` (line 43)
- Descriptive echo statements before operations indicate intent
- No centralized logging framework; outputs go to stdout

**Message Convention:**
- Capitalize first letter of user-facing messages
- Include context: "Turning on the screen", "Setting the screen on the right of the computer"

## Comments

**When to Comment:**
- Used above function definitions to describe purpose
- Example: `# Turns on second screen` (line 3 in `/.functions`)
- Used above command blocks for context: `# Exports environment variables` (line 13 in `/.bashrc`)
- Explain non-obvious regex patterns

**Comment Style:**
- Start with `#` followed by space
- Single-line comments only (no block comments)
- Comments placed above code they describe
- Descriptive, not obvious: "Kills process using specific port" (line 69) explains intent

**Usage Documentation:**
- Comments include usage examples: `# usage: $ kill_process_using 3001` (line 70)
- Parameter descriptions in comments above functions

## Function Design

**Size:** Generally small (1-20 lines), focused on single responsibility

**Parameters:**
- Positional parameters used: `"$1"` for first parameter
- No named parameters; conventions documented in comments
- Example: `resolve_display()` takes one optional parameter for screen direction

**Return Values:**
- Explicit return codes: 0 for false/failure, 1 for true/success (inverted from standard)
- Some functions return void (lines 18, 24, 29, etc.)
- Consistent use of return code pattern within file

**Defensive Patterns:**
- Check for required parameters: `if [[ -z "$1" ]]; then echo "Usage..."; exit 1; fi` (lines 78-81)
- Protect against accidental directory deletion with string comparison (lines 105-108):
  ```bash
  if [[ "$root" != "$worktree" ]]; then
    cd "../$root"
    git worktree remove "$worktree" --force
  fi
  ```

## Module Design

**Sourcing Pattern:**
- Shell scripts don't have modules in traditional sense
- Files are sourced as complete units: `.functions`, `.bash_aliases`, `.bashrc`, `.zshrc`
- Logical grouping by purpose: functions in `/.functions`, shortcuts in `/.bash_aliases`

**Aliases Structure:**
- Related aliases grouped together with comments:
  ```bash
  # docker aliases
  alias dps="docker ps"
  alias dc="docker compose"
  ```
- Pattern: comment block, then related aliases (lines 3-8 in `/.bash_aliases`)

**Configuration File Organization:**
- `/.bashrc`: Sets environment variables, sources other files, configures appearance
- `/.zshrc`: Loads oh-my-zsh framework, sources aliases and functions, configures plugins
- `/.bash_aliases`: Contains only alias definitions
- `/.functions`: Contains only function definitions

## Special Conventions

**Git Operations:**
- Worktree functions use specific naming: `gwa` (git worktree add), `gwd` (git worktree delete)
- Pattern in lines 77-111: Functions manage worktrees with branch naming convention: `base--branch`
- String splitting on `--`: `root="${worktree%%--*}"`, `branch="${worktree#*--}"` (lines 101-102)

**Docker Pattern:**
- Short aliases for common operations: `dps`, `dc`, `dcu`, `dcd`, `dl`
- Full docker commands aliased: `alias dc="docker compose"`
- Cleanup functions provided: `drm()`, `drmi()`

**Environment-Aware Code:**
- SSH config points to specific VPS: `alias vps="ssh -i ~/.ssh/github-actions-deploy-vps fberrez@51.178.138.125"`
- Python version management: `alias python=python3` and `alias pip=pip3`
- Platform-specific configuration: Flutter path, cargo env, RVM

---

*Convention analysis: 2026-02-08*
