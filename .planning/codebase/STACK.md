# Technology Stack

**Analysis Date:** 2026-02-08

## Languages

**Primary:**
- Bash - Primary shell scripting language for configuration and automation
- Zsh - Alternative shell environment with oh-my-zsh framework
- VimL - Vim configuration and plugin management

**Secondary:**
- Go - Development language (supported via vim-go plugin and Flutter SDK)
- JavaScript - Development language (ESLint configuration present)
- Python 2.7 and 3.7 - Development support (PATH environment set)
- Solidity - Smart contract language (supported via vim-solidity plugin)

## Runtime

**Environment:**
- Bash Shell
- Zsh Shell (default configured)
- macOS/Linux (cross-platform dotfiles)

**Package Managers:**
- pnpm - JavaScript package manager (configured in `.zshrc`)
- bun - JavaScript runtime and package manager (configured in `.zshrc`)
- npm/npx - Implied JavaScript package management
- pip/pip3 - Python package manager (aliased in `.bash_aliases`)
- Cargo - Rust package manager (initialized in `.bash_profile`)

## Frameworks & Tooling

**Shell Management:**
- oh-my-zsh (ZSH_THEME="robbyrussell") - Interactive shell framework
- zsh-syntax-highlighting - Shell syntax highlighting plugin
- colored-man-pages - Man page colorization
- colorize - Command output colorization
- z - Directory navigation shortcuts

**Text Editor:**
- Vim - Primary editor with plugin support
- vim-plug - Vim plugin manager
- Code Insiders - VS Code variant (aliased as `code`)

**Development Tools:**
- RVM (Ruby Version Manager) - Ruby language management
- NVM (Node Version Manager) - Node.js version management
- Deno - JavaScript/TypeScript runtime (completions configured)
- Flutter SDK - Mobile development framework
- Docker & Docker Desktop - Containerization platform
- Docker Compose - Multi-container orchestration
- Makefile - Build automation

**Linting & Formatting:**
- ESLint - JavaScript linting (`.eslintrc.js` config referenced)
- Prettier - Code formatting (vim-prettier configured)
- ALE (Asynchronous Lint Engine) - Vim linting plugin

## Vim Plugins (Text Editor Extensions)

**Language Support:**
- vim-go - Go language support with binary installation
- vim-solidity - Solidity smart contract language support

**UI & Theme:**
- vim-airline - Status line enhancement
- gruvbox - Dark color scheme

**Code Quality:**
- ALE - Real-time linting and fixing with Prettier and ESLint integration

## Key Dependencies & Tools

**Critical Toolchain:**
- git - Version control (integrated throughout shell configs)
- ssh - Secure shell access (GitHub integration referenced)
- lsof - Process/port monitoring (used in `kill_process_using` function)
- xrandr - Display management (external monitor support)
- tree - Directory tree visualization
- gum - Interactive CLI input for git worktree operations
- mise - Tool/version management in git worktrees

**Container Orchestration:**
- Docker - Container runtime
- Docker Compose - Service orchestration
- Kafka (via Docker) - Streaming platform
- Zookeeper - Kafka coordination
- Redis - In-memory data store
- Kafka UI - Kafka cluster visualization

## Configuration Files

**Shell Configuration:**
- `.bash_profile` - macOS bash initialization
- `.bashrc` - Bash shell configuration and PATH management
- `.zshrc` - Zsh shell configuration with oh-my-zsh
- `.bash_aliases` - Shell command aliases
- `.functions` - Custom shell functions

**Editor Configuration:**
- `.vimrc` - Vim editor settings, keybindings, and plugin config

**Docker & Containers:**
- `docker-compose.yml` - Multi-service container definition with Kafka, Zookeeper, Redis, and Kafka UI

**iTerm2 (Terminal Emulator):**
- `fberrez-iterm2.json` - iTerm2 profile configuration
- `fberrez.itermkeymap` - Custom iTerm2 keybindings

**Build & Installation:**
- `Makefile` - Symlink creation for dotfiles installation

## Environment Setup

**Runtime Paths:**
- Cargo (Rust) - `$HOME/.cargo/env`
- Deno - `$HOME/.deno/env`
- RVM (Ruby) - `$HOME/.rvm/scripts/rvm`
- Flutter SDK - `$HOME/development/flutter/bin`
- NVM (Node) - `$HOME/.nvm/nvm.sh` with bash completion
- pnpm - `$PNPM_HOME` configurable (default `/home/fberrez/pnpm`)
- Bun - `$BUN_INSTALL` (`$HOME/.bun`)
- Go - `/usr/local/go/bin` and `$HOME/go/bin`
- Custom bin - `$HOME/.bin` directory

**Editor Default:**
- `EDITOR='vim'` - System default editor

**CLI Customization:**
- `CLICOLOR=1` - Enable colored output
- `LSCOLORS=ExFxBxDxCxegedabagacad` - Custom ls color scheme
- `HISTFILE=$HOME/.bash_history` - Bash history location
- `BASH_SILENCE_DEPRECATION_WARNING=1` - Suppress bash deprecation warnings

## Docker Services (Defined in docker-compose.yml)

**Containerized Infrastructure:**
- Kafka (latest) - Distributed event streaming platform
- Zookeeper (latest) - Kafka coordination service
- Kafka UI (latest) - Web UI for Kafka cluster management
- Redis (latest) - In-memory data store with persistence

**Networking:**
- kafka-net bridge network - Isolated network for Kafka services

---

*Stack analysis: 2026-02-08*
