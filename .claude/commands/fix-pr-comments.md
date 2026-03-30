Fetch review comments on the current branch's open PR. For each comment: assess if the suggestion is valid, fix it if needed, skip if not. After all fixes, commit, push, and reply to each addressed comment with the commit hash.

Steps:
1. Find the open PR for the current branch: `gh pr view --json number,url`
2. Fetch review comments: `gh api repos/{owner}/{repo}/pulls/{number}/comments`
3. For each comment, read the referenced file/line, evaluate the suggestion, and apply valid fixes
4. Run format check and type check
5. Commit and push all fixes in a single commit
6. Reply to each fixed comment: `gh api repos/{owner}/{repo}/pulls/{number}/comments/{id}/replies -X POST -f body="Fixed in {commitHash}."`
7. For comments skipped as invalid/irrelevant, reply explaining why
