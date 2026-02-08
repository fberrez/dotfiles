# Testing Patterns

**Analysis Date:** 2026-02-08

## Test Framework

**Runner:**
- Not detected

**Assertion Library:**
- Not applicable

**Run Commands:**
```bash
# No automated testing infrastructure detected
# Repository uses manual testing via shell commands
```

## Repository Testing Approach

This dotfiles repository does not use automated testing frameworks. It is a collection of shell configuration files and utility functions designed for manual sourcing and use.

**Why No Tests:**
- Dotfiles are inherently environment-dependent (different across machines, OS versions, shell versions)
- Functions are typically system/shell utilities that are tested interactively by the user
- Behavior depends on external tools (docker, git, xrandr, lsof) that may not be available in test environments

## Manual Testing Patterns

**Interactive Validation:**
- Functions are tested by executing them in the shell and verifying output
- Example: `resolve_display()` in `/.functions` is tested by running the command and checking xrandr output
- User-facing functions like `confirm()` (line 42) are tested by running them and responding to prompts

**Verification Methods:**
- Command-line execution: `kill_process_using 3001` validates that a process on port 3001 is terminated
- Docker cleanup: `drm()` and `drmi()` functions are tested by checking `docker ps` and `docker images` output after execution
- Git operations: `gwa()` and `gwd()` tested by verifying worktree structure with `git worktree list`

## Functional Testing Approach

**Environment Validation:**
- `confirm()` function (lines 42-50 in `/.functions`) uses pattern:
  ```bash
  read -p "Are you sure to: $1 [y/N]? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      return 1;
  fi
  return 0;
  ```
- Tested by user interaction: typing 'y' or 'n' and verifying return code with `$?`

**Conditional Logic Testing:**
- File existence checks in sourcing blocks (`.bashrc` lines 4-6, `.zshrc` lines 106-108) verified by:
  1. Creating/removing files
  2. Re-sourcing shell configuration
  3. Confirming no errors occur

**Error Handling Validation:**
- Functions like `gwd()` (lines 93-111) protect against accidental deletion with logic:
  ```bash
  if [[ "$root" != "$worktree" ]]; then
    # Safe to delete
    git worktree remove "$worktree" --force
  fi
  ```
- Tested by manually running `gwd` in non-worktree directory and confirming no deletion occurs

## Function Testing Strategy

**Test-by-Use Pattern:**
- Each function is tested in its intended context
- `mkcd()` tested by: `mkcd test_dir && ls -la | grep test_dir`
- `drm()` tested by: creating exited containers, running `drm`, verifying they're gone with `docker ps -a`
- `searchjs()` tested by: running against actual project with known search terms

**Safety Validation:**
- Destructive operations (`swap_dot_env()`, git operations) protected by confirmation prompts
- User must explicitly confirm before changes execute
- Tested by running function and declining action, then confirming action executes

**Platform-Specific Testing:**
- `resolve_display()` only testable on Linux with xrandr support
- SSH alias `vps` testable with valid SSH key and network access
- Environment-specific code paths tested on target platforms

## Test Data

**Not Applicable:** This repository doesn't use test fixtures or factories. Functions operate on live system resources (files, processes, git repositories, docker containers).

## Coverage

**Requirements:** None enforced

**Approach:** Manual user acceptance testing during development and before committing changes

## Test Types

**Unit Tests:**
- Not applicable - shell functions designed as integration utilities with external tools

**Integration Tests:**
- Manual testing simulates real-world usage
- Example: `gwa()` tested by creating actual git worktrees and verifying behavior
- `swap_dot_env()` tested with real `.env.dev` and `.env.prod` files

**E2E Tests:**
- Not used - repository scope is shell configuration, not a complete application

**Manual Testing:**
- Interactive shell commands verify function behavior
- System state changes observable by user (file creation, process termination, docker containers)
- Output validation through stdout examination

## Testing Recommendations

**For Future Enhancement:**
- Could use `bats-core` (Bash Automated Testing System) for shell function testing
- Location: Create `tests/` directory with `.bats` files
- Test structure would follow pattern: `tests/functions.bats`

**Test Example (if implemented):**
```bash
#!/usr/bin/env bats

setup() {
  source ~/.functions
}

@test "mkcd creates and enters directory" {
  run mkcd test_mkcd_dir
  [ "$status" -eq 0 ]
  [ -d "test_mkcd_dir" ]
}

@test "confirm returns 1 when user confirms" {
  run bash -c 'echo "y" | confirm "test action"'
  [ "$status" -eq 1 ]
}
```

**Test Coverage Goals (if tests were added):**
- `/.functions`: Test each function with various inputs
- `/.bash_aliases`: Verify aliases expand to correct commands
- `/.bashrc` and `/.zshrc`: Test conditional sourcing logic

## Continuous Integration

**CI Pipeline:** Not detected

**Automation:** No automated testing on commit or push

**Manual Validation:**
- Changes to shell configurations are tested interactively before committing
- Git commits are made after manual validation (see recent commit history: "feat(linux): update popos", "feat(bash): update jan 2024")

## Testing Best Practices (Current)

**Shell Functions:**
1. Source the file containing function: `source ~/.functions`
2. Execute function with test parameters
3. Verify output with `echo $?` for exit code
4. Check system state changes (files created, processes killed, etc.)

**Alias Validation:**
1. Source `.bash_aliases`
2. Execute alias and verify expanded command runs correctly
3. Check output matches expected behavior

**Configuration Testing:**
1. Open new shell session
2. Verify environment variables set correctly: `echo $EDITOR`
3. Confirm git branch displays in prompt
4. Check PATH includes all necessary directories

---

*Testing analysis: 2026-02-08*
