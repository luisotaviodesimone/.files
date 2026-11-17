---
name: no-git-signature
description: Prevents Claude Code signature and attribution lines from appearing in git commits, PR descriptions, branch names, or any git-related text. Activates automatically for all git operations.
triggers:
  - always
---

# No Claude Signature in Git

**ABSOLUTE RULE — no exceptions:**

Never include any of the following in commits, PR titles, PR bodies, commit messages, branch names, merge messages, or any git-related text:

- `Co-Authored-By: Claude`
- `Co-Authored-By: claude`
- `🤖 Generated with [Claude Code]`
- `Generated with Claude`
- Any line starting with `Co-Authored-By:` that references Claude, Anthropic, or any AI model
- Any footer or trailer that identifies this response as AI-generated

## Applies To

- `git commit -m "..."`
- `git commit --amend`
- PR body passed to `gh pr create`
- PR body passed to `gh pr edit`
- Merge commit messages
- Squash commit messages
- Any HEREDOC or string argument to a git or gh command

## Why

The user's project enforces clean, human-style git history. Attribution lines add noise, may conflict with team conventions, and are explicitly unwanted in this workspace.

## How to Apply

When constructing any commit message or PR description:
1. Write the subject line and body normally.
2. **Stop there.** Do not append any `Co-Authored-By`, AI attribution, or generated-with footer.
3. If a default template you are following includes such a line, remove it before executing the command.
