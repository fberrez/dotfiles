# dotfiles

![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Shell](https://img.shields.io/badge/Shell-Bash%20%7C%20Zsh-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Vim](https://img.shields.io/badge/Vim-019733?style=flat&logo=vim&logoColor=white)
![Ghostty](https://img.shields.io/badge/Ghostty-terminal-blue?style=flat)
[![License](https://img.shields.io/github/license/fberrez/dotfiles?style=flat)](LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/fberrez/dotfiles?style=flat)](https://github.com/fberrez/dotfiles/commits/master)
[![Repo Size](https://img.shields.io/github/repo-size/fberrez/dotfiles?style=flat)](https://github.com/fberrez/dotfiles)

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
- `.claude/commands/` — Claude Code custom slash commands
- `ghostty/config` — Ghostty terminal configuration

## Claude Code Commands

Custom slash commands symlinked to `~/.claude/commands/`:

| Command | Description |
|---------|-------------|
| `/linkedin-post` | Write LinkedIn posts using emotional psychology triggers — pick your trigger, craft content that makes people feel something |
| `/linkedin-ideas` | Generate LinkedIn post ideas using the 6 emotional triggers — turn one topic into multiple high-engagement angles |
| `/linkedin-lead-magnet` | Write LinkedIn lead magnet posts that drive comments/DMs — FOMO stacking, investment signaling, and comment triggers |
| `/linkedin-belief-disruptor` | Write LinkedIn posts that challenge existing beliefs — create problem awareness in people who don't know they have a problem yet |
| `/bluesky-post` | Write Bluesky posts/threads with a raw, unfiltered dev voice — short, punchy, real talk about AI and building software |
| `/reddit-post` | Write Reddit posts with an authentic, community-first voice — real war stories about AI in production, no self-promotion vibes |
| `/korint-linkedin-post` | Write LinkedIn posts with a spicy, constructive tone about AI in insurance/tech — rage bait meets real insight |
| `/korint-bluesky-post` | Write Bluesky posts/threads with a raw, unfiltered dev voice — short, punchy, real talk about AI and building software |
| `/korint-reddit-post` | Write Reddit posts with an authentic, community-first voice — real war stories about AI in production, no self-promotion vibes |

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

## GitHub Stats

<p align="center">
  <img src="https://github-readme-stats.vercel.app/api?username=fberrez&show_icons=true&theme=dark&hide_border=true&count_private=true" alt="GitHub Stats" />
</p>

<p align="center">
  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=fberrez&layout=compact&theme=dark&hide_border=true" alt="Top Languages" />
</p>

<p align="center">
  <img src="https://github-readme-streak-stats.herokuapp.com/?user=fberrez&theme=dark&hide_border=true" alt="GitHub Streak" />
</p>
