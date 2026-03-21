---
name: free-space
description: Analyze and free up disk space on macOS — find large files, caches, and cleanup opportunities
allowed-tools: ["Bash", "Read"]
---

Help the user free up disk space on their Mac.

## Step 1: Analyze current disk usage

Run the following commands to gather a picture of what's eating space:

1. **Overall disk usage**: `df -h /`
2. **Largest directories in home**: `du -sh ~/Library/Caches ~/Library/Logs ~/Library/Application\ Support ~/.Trash ~/Downloads ~/Desktop 2>/dev/null | sort -hr`
3. **Docker disk usage** (if Docker is installed): `docker system df 2>/dev/null`
4. **Homebrew cache**: `du -sh $(brew --cache) 2>/dev/null`
5. **npm/yarn/pnpm caches**: `du -sh ~/.npm ~/.yarn/cache ~/.pnpm-store 2>/dev/null`
6. **Xcode derived data** (if present): `du -sh ~/Library/Developer/Xcode/DerivedData 2>/dev/null`
7. **Rust/Cargo build caches**: `du -sh ~/.cargo/registry ~/.cargo/git 2>/dev/null && find ~/workspace -name target -type d -maxdepth 4 -exec du -sh {} \; 2>/dev/null | sort -hr | head -10`
8. **Go module cache**: `du -sh ~/go/pkg/mod 2>/dev/null`
9. **Trash**: `du -sh ~/.Trash 2>/dev/null`
10. **iOS device backups**: `du -sh ~/Library/Application\ Support/MobileSync/Backup 2>/dev/null`

## Step 2: Present findings

Present a clean summary table sorted by size (largest first):

```
Category                  Size      Cleanup command
─────────────────────────────────────────────────────
Docker unused images      12.3 GB   docker system prune -a
Xcode DerivedData          8.1 GB   rm -rf ~/Library/Developer/Xcode/DerivedData
...
```

Only include categories that actually exist and have meaningful size (>100MB).

Show the **total reclaimable space** at the bottom.

## Step 3: Ask before cleaning

**NEVER run cleanup commands without explicit user approval.** Present the list and ask which items they want to clean up. The user may pick specific items or say "all".

## Step 4: Execute cleanup

For each approved item, run the cleanup command and report the space freed.

After cleanup, run `df -h /` again to show the before/after difference.

## Guidelines

- Be conservative — never delete files that could cause data loss (documents, code, etc.)
- Caches and build artifacts are always safe to suggest (they regenerate)
- For Trash, remind the user this is permanent
- If Downloads is large, suggest the user review it manually rather than deleting blindly
- Keep output concise — no long explanations, just findings and actions
