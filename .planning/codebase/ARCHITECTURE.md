# Architecture

**Analysis Date:** 2026-02-08

## Pattern Overview

**Overall:** Modular shell configuration and dotfiles system

**Key Characteristics:**
- Distributed configuration across multiple shell initialization files
- Layered bootstrap process with conditional sourcing
- Separation of concerns: aliases, functions, environment variables, theme/appearance
- Infrastructure-as-code approach for development tooling (Kafka, Redis, Zookeeper)
- Single-user personalized development environment

## Layers

**Shell Initialization Layer:**
- Purpose: Bootstrap shell environment with proper initialization order
- Location: `.bash_profile`, `.bashrc`, `.zshrc`
- Contains: Shell startup code, runtime detection, PATH configuration
- Depends on: Function definitions, alias definitions, external tools (Docker, RVM, NVM)
- Used by: User shell sessions at startup

**Configuration Layer:**
- Purpose: Define user preferences, aliases, and custom functions
- Location: `.bash_aliases`, `.functions`
- Contains: Command shortcuts, shell functions, workflow utilities
- Depends on: System commands (git, docker, grep, lsof)
- Used by: Interactive shell sessions

**Environment Setup Layer:**
- Purpose: Configure runtime environments and tooling
- Location: `.bash_profile`, `.bashrc`, `.zshrc` (PATH and export statements)
- Contains: PATH manipulation, environment variable exports, tool initialization
- Depends on: Installed tools (Rust cargo, Deno, RVM, Flutter)
- Used by: All shell sessions and spawned processes

**Editor Configuration Layer:**
- Purpose: Configure vim editor experience
- Location: `.vimrc`
- Contains: Plugin management (vim-plug), keybindings, color scheme, indentation rules
- Depends on: vim-plug plugin manager, vim plugins
- Used by: vim editor sessions

**Terminal UI Configuration Layer:**
- Purpose: Configure iTerm2 terminal appearance and behavior
- Location: `fberrez-iterm2.json`, `fberrez.itermkeymap`
- Contains: Color schemes, fonts, UI preferences, keyboard mappings
- Depends on: iTerm2 application
- Used by: iTerm2 terminal emulator

**Infrastructure Layer:**
- Purpose: Define containerized development infrastructure
- Location: `docker-compose.yml`
- Contains: Kafka, Zookeeper, Redis, Kafka-UI services
- Depends on: Docker, Docker Compose
- Used by: Local development environment setup

## Data Flow

**Shell Session Bootstrap:**

1. OS launches shell session (bash, zsh, or fallback)
2. Shell sources `.bash_profile` (macOS) or `.bashrc` (Linux)
3. `.bash_profile` sources `.bashrc` for consistency across platforms
4. `.bashrc` loads `.bash_aliases` and `.functions` if present
5. Environment variables (PATH, EDITOR, history settings) are exported
6. Theme/appearance settings applied (colors, prompt formatting)
7. Shell-specific configurations loaded (oh-my-zsh, NVM, pnpm, RVM, Cargo, Deno)
8. Interactive shell ready for command input

**Function Invocation:**

1. User types shell function command (e.g., `mkcd`, `drm`, `gwa`)
2. Shell looks up function in loaded functions (`.functions`)
3. Function executes with user-provided arguments
4. Function may call external commands (docker, git, lsof, grep)
5. Output displayed to user

**Infrastructure Initialization:**

1. User runs `docker compose up` in repository directory
2. Docker Compose reads `docker-compose.yml`
3. Services start in dependency order (zookeeper → kafka → kafka-ui, redis)
4. Network bridge `kafka-net` created for service communication
5. Volume mounts attached for data persistence
6. Services accessible at configured ports

**State Management:**

- Session state: Environment variables, functions, aliases live in shell process memory
- Persistent state: Configuration files in home directory or dotfiles repository
- Infrastructure state: Docker volumes persist data between container restarts
- Git state: Repository tracks configuration file history and version control for aliases/functions

## Key Abstractions

**Shell Function Library:**
- Purpose: Encapsulate common workflows and shortcuts
- Examples: `mkcd`, `drm`, `drmi`, `searchjs`, `confirm`, `swap_dot_env`, `kill_process_using`, `gwa`, `gwd`
- Pattern: Bash functions with documented parameters and return codes, some with user confirmation

**Alias System:**
- Purpose: Create memorable shortcuts for long or frequently-used commands
- Examples: `dps`, `dc`, `ga`, `gt`, `gps`, etc.
- Pattern: Simple command-to-command mapping, organized by domain (docker, git, utilities)

**Environment Configuration:**
- Purpose: Set up runtime paths and application configuration
- Examples: PATH modifications for Flutter, Python, Go, Rust, Node tools
- Pattern: Conditional sourcing with fallback handling for optional tools

**Docker Infrastructure:**
- Purpose: Define reproducible local development services
- Examples: Kafka cluster with Zookeeper and UI, Redis cache
- Pattern: Docker Compose service definitions with networking and volume mounts

## Entry Points

**User Login Shell:**
- Location: `.bash_profile` (macOS entry point)
- Triggers: System login or new terminal window
- Responsibilities: Source `.bashrc`, initialize Docker environment, load runtime hooks

**Interactive Shell Session:**
- Location: `.bashrc` (primary initialization file)
- Triggers: Shell startup after login
- Responsibilities: Load aliases, functions, environment variables, configure appearance

**Development Infrastructure:**
- Location: `docker-compose.yml`
- Triggers: Manual invocation via `docker compose up`
- Responsibilities: Start Kafka, Zookeeper, Redis, Kafka-UI services

**Installation/Linking:**
- Location: `Makefile`
- Triggers: `make` or `make link` command
- Responsibilities: Create symlinks from repository to home directory

## Error Handling

**Strategy:** Permissive with fallback behavior

**Patterns:**
- Conditional sourcing: `if [ -r ~/.bashrc ]; then source ~/.bashrc; fi` - silently skips if file missing
- Optional tool initialization: `[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"` - skips if NVM not installed
- Error suppression: `source /Users/fberrez/.docker/init-bash.sh || true` - continues even if Docker script fails
- Process substitution safeguards: `docker ps -a -f status=exited -q` - empty result safely handled
- Confirmation functions: `confirm()` checks user response before destructive operations

## Cross-Cutting Concerns

**Logging:**

Minimal logging approach. Functions output status messages to stdout (e.g., "Turning on the screen", "Setting the screen..."). Error output directed to stderr where captured. History tracked via `HISTFILE` environment variable pointing to `~/.bash_history`.

**Validation:**

- Command availability checks: Functions assume external commands exist (docker, git, lsof) without explicit validation
- User confirmation: `confirm()` function validates user intent before destructive operations (swap_dot_env, gwd removal)
- Argument validation: Some functions check for required arguments (gwa, gwd) and exit with usage info

**Authentication:**

Git authentication configured via environment variables and Git config (SSH keys, GPG signing keys). API authentication handled through SSH key pairs (~/.ssh/) for VPS access. No centralized authentication layer - each tool manages its own credentials.

---

*Architecture analysis: 2026-02-08*
