# dotfiles

Personal dotfiles for macOS and Linux.

## Install

Creates symlinks from this repo to your home folder:

```sh
make
```

## Structure

- `.shared_env` — Shared environment (PATH, tools, aliases, functions) sourced by both bash and zsh
- `.bashrc` — Bash-specific config (prompt, colors)
- `.bash_profile` — macOS bash login shell (sources .bashrc)
- `.zshrc` — Zsh config (oh-my-zsh, plugins, completions)
- `.bash_aliases` — Shell aliases (git, docker, etc.)
- `.functions` — Shell functions (docker cleanup, git worktrees, etc.)
- `.vimrc` — Vim configuration
- `.extra` — Machine-specific config (gitignored)
- `docker-compose.yml` — Local dev services (Kafka, Redis)

## Machine-specific config

Add secrets, host-specific aliases, and credentials to `.extra` (gitignored):

```sh
# Git credentials
git config --global user.name "Name"
git config --global user.email "Email"
git config --global gpg.program gpg
git config --global commit.gpgsign true
git config --global user.signingkey YOUR_GPG_KEY

# Host-specific aliases
alias vps="ssh -i ~/.ssh/key user@host"
```
