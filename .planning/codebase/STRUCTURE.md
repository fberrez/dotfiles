# Codebase Structure

**Analysis Date:** 2026-02-08

## Directory Layout

```
dotfiles/
├── .bash_aliases           # Git aliases and shell command shortcuts
├── .bash_profile           # macOS shell initialization entry point
├── .bashrc                 # Bash-specific configuration and setup
├── .functions              # Shell functions for common workflows
├── .gitignore              # Git ignore rules (kafka-data, zookeeper-data, etc)
├── .planning/              # GSD planning documentation
│   └── codebase/           # Codebase analysis documents
├── .vimrc                  # Vim editor configuration
├── .zshrc                  # Zsh shell initialization
├── docker-compose.yml      # Docker infrastructure (Kafka, Redis, Zookeeper)
├── fberrez-iterm2.json     # iTerm2 terminal color scheme and preferences
├── fberrez.itermkeymap     # iTerm2 keyboard shortcuts
├── Makefile                # Installation script (symlink creation)
└── README.md               # Installation and setup documentation
```

## Directory Purposes

**.planning/codebase/:**
- Purpose: Store GSD (Get Stuff Done) codebase analysis documents
- Contains: ARCHITECTURE.md, STRUCTURE.md, CONVENTIONS.md, TESTING.md, STACK.md, INTEGRATIONS.md, CONCERNS.md
- Key files: `ARCHITECTURE.md`, `STRUCTURE.md`

## Key File Locations

**Entry Points:**

- `.bash_profile`: Primary macOS shell initialization - sources `.bashrc` and Docker setup
- `.bashrc`: Primary bash/shell configuration - loads aliases, functions, environment variables
- `.zshrc`: Zsh-specific configuration - loads oh-my-zsh, aliases, functions, NVM, pnpm setup
- `docker-compose.yml`: Infrastructure initialization - starts Kafka, Zookeeper, Redis services
- `Makefile`: Installation entry point - creates symlinks from repo to home directory

**Configuration:**

- `.bash_aliases`: Git and utility command shortcuts (ga, gc, dps, dc, etc)
- `.functions`: Reusable shell functions (mkcd, drm, confirm, kill_process_using, gwa, gwd)
- `.bash_profile`: macOS-specific initialization (Docker, Cargo, Deno, RVM setup)
- `.bashrc`: Shell appearance, PATH configuration, aliases/functions loading
- `.zshrc`: Oh-my-zsh setup, NVM, pnpm, Bun, Go, and language runtime configuration
- `.vimrc`: Vim plugin management (vim-plug), keybindings, color scheme, indentation rules

**Terminal UI:**

- `fberrez-iterm2.json`: iTerm2 color scheme, fonts, transparency, UI dimensions (Monaco 14, 25 rows)
- `fberrez.itermkeymap`: Custom iTerm2 keyboard mappings

**Infrastructure:**

- `docker-compose.yml`: Service definitions for Kafka, Zookeeper, Redis, Kafka-UI with networking

## Naming Conventions

**Files:**

- Dotfiles pattern: `.bashrc`, `.zshrc`, `.vimrc`, `.gitignore` - hidden files starting with dot
- Configuration naming: `.bash_aliases`, `.functions` - descriptive names for purpose
- JSON config: `fberrez-iterm2.json`, `docker-compose.yml` - standard configuration formats
- Makefile: Conventional `Makefile` for build/installation tasks

**Directories:**

- Hidden directories: `.planning/`, `.git/` - hidden from regular ls output
- Subdirectories: `codebase/` - descriptive subdirectory in `.planning/` for analysis documents
- Data directories (transient): `kafka-data/`, `zookeeper-data/`, `redis-data/`, `zookeeper-logs/`, `kafka-ui-data/` - generated at runtime, not committed

## Where to Add New Code

**New Shell Aliases:**
- Location: `.bash_aliases`
- Pattern: One alias per line, organized by domain (docker, git, utilities)
- Format: `alias shortname="full command"`
- Example: `alias dps="docker ps"` for Docker commands

**New Shell Functions:**
- Location: `.functions`
- Pattern: Bash function with documentation comment
- Format: Function name followed by parentheses, body with error handling
- Example:
```bash
# Description of what function does
# usage: $ function_name arg1 arg2
function_name() {
    # Implementation
    return 0
}
```

**New Environment Variable Configuration:**
- Location: `.bashrc` or `.zshrc` depending on shell
- Pattern: Export statements grouped by tool/runtime
- Format: `export VAR_NAME="value"` or conditional sourcing with `[ -s "path" ] && \. "path"`

**New Vim Configuration:**
- Location: `.vimrc`
- Pattern: Plugin definitions in vim-plug section, settings below
- Format: Standard vim configuration commands

**New Terminal UI Configuration:**
- Location: `fberrez-iterm2.json`
- Pattern: JSON structure with iTerm2 preference keys
- Importing: Use iTerm2 GUI to export profile and merge JSON

**New Infrastructure Service:**
- Location: `docker-compose.yml`
- Pattern: YAML service definition with image, ports, environment, volumes, networks
- Format: Service name with configuration indented under `services:` key

**New Documentation:**
- Location: `.planning/codebase/` for analysis docs, `README.md` for user-facing docs
- Pattern: Markdown files describing setup, usage, or architecture

## Special Directories

**`.planning/codebase/`:**
- Purpose: Stores GSD (Get Stuff Done) analysis and planning documents
- Generated: Yes (created by `/gsd:map-codebase` command)
- Committed: Yes - part of repository to share analysis with team

**`kafka-data/`, `zookeeper-data/`, `zookeeper-logs/`, `kafka-ui-data/`, `redis-data/`:**
- Purpose: Volume mount points for Docker containers - persistent storage
- Generated: Yes (created by `docker compose up`)
- Committed: No - listed in `.gitignore` to prevent committing container data

**`.git/`:**
- Purpose: Git repository metadata and history
- Generated: Yes (created by `git init`)
- Committed: N/A - Git internal directory

## File Organization Philosophy

This repository follows a **flat, single-directory structure** at root level because:

1. **Home directory mirroring**: Files are meant to be symlinked to user's home directory (`~`), so flat structure mirrors `~` organization
2. **Modularity by function**: Files are separated by purpose (aliases, functions, vim, zsh, bash) rather than directory hierarchy
3. **Quick navigation**: User can easily see all configuration files at root level without deep nesting
4. **Installation simplicity**: Makefile can iterate over all dotfiles with simple find pattern
5. **Dotfiles convention**: Standard dotfiles repository pattern uses flat structure with dot-prefixed files

---

*Structure analysis: 2026-02-08*
