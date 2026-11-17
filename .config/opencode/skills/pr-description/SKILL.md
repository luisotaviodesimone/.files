---
name: pr-description
description: Writes natural, human-sounding PR descriptions. Activates whenever the user asks to write, create, or improve a pull request description (e.g. "crie a descrição do PR", "escreva a description desse PR", "write the PR description", "gh pr create"). Always uses the repository's PR template when one exists and avoids redundant "how to test" instructions.
---

# PR Description

Write pull request descriptions that read like a teammate wrote them — clear, specific, and free of boilerplate.

## 1. Gather context first

Before writing anything:

1. Read the actual diff (`git diff <base>...HEAD` or `gh pr diff`) — never describe a PR from the branch name or commit messages alone.
2. Read the commit history of the branch for intent (`git log <base>..HEAD --oneline`).
3. Check for CI/automation so the testing section is accurate:
   - `.github/workflows/`, `.gitlab-ci.yml`, `azure-pipelines.yml`, `Jenkinsfile`, `bitbucket-pipelines.yml`
   - Note which checks already run automatically (tests, lint, typecheck, build, e2e).

## 2. Always use the repository template if one exists

Search for a PR template before writing, in this order:

- `.github/PULL_REQUEST_TEMPLATE.md` (any casing)
- `.github/pull_request_template.md`
- `.github/PULL_REQUEST_TEMPLATE/` (directory with multiple templates — pick the one matching the change type, or ask if ambiguous)
- `docs/PULL_REQUEST_TEMPLATE.md`
- `PULL_REQUEST_TEMPLATE.md` at repo root

If a template exists:
- Follow its structure and section headings **exactly** — do not add, rename, or reorder sections.
- Fill every section with real content; if a section genuinely doesn't apply, say so briefly (e.g. "No UI changes") instead of deleting it or leaving placeholder text.
- Check checkboxes only when they are actually true for this PR.

If no template exists, use a minimal structure: a short summary paragraph, what changed and why, and (only when useful) how to verify. Do not invent heavy section scaffolding for small PRs.

## 3. Write naturally

- Sound like the author of the code, not like a report generator.
- Prefer short paragraphs over walls of bullets. Use bullets only for genuinely enumerable items (list of changed behaviors, breaking changes).
- No filler: skip phrases like "This PR aims to...", "In this pull request, we...", "Comprehensive", "Enhanced", "Leverages". Just say what it does: "Fixes the timeout on bulk imports by batching the queries."
- Explain the **why** when it isn't obvious from the diff — the reviewer can see *what* changed; the description earns its keep by explaining the reasoning, trade-offs, and anything non-obvious.
- Match the size of the description to the size of the change. A one-line fix gets two sentences, not five sections.
- Write in the language the repository uses for PRs (check existing merged PRs with `gh pr list --state merged --limit 5` if unsure).

## 4. "How to test" — never be redundant

This is the most important rule:

- **Never instruct the reviewer to run checks that CI already runs automatically.** If the pipeline already executes unit tests, lint, or build, do not write "run `npm test`" — that adds zero information. At most, reference it: "Covered by the existing test suite in CI."
- The testing section exists for what CI **cannot** verify:
  - Manual steps to reproduce the bug and confirm the fix
  - UI flows to click through, with the specific states/inputs that matter
  - Environment setup or feature flags needed to see the change
  - Edge cases the reviewer should try that automated tests don't cover
- If automated tests fully cover the change and there is nothing manual to verify, say exactly that in one line ("Fully covered by the new tests in `x.spec.ts`; nothing manual to verify") — do not pad the section with fake steps.
- New tests added in the PR belong in the summary of changes, not as a testing instruction.

## 5. Output

- Never include AI attribution, `Co-Authored-By: Claude`, or "Generated with" footers (see the `no-git-signature` rule — it applies to PR bodies).
- When creating the PR via `gh pr create` or editing via `gh pr edit`, pass the body through a HEREDOC to preserve formatting.
- Show the final description to the user before pushing it to GitHub, unless they explicitly asked to create/update the PR directly.
