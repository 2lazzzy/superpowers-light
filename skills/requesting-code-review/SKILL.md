---
name: requesting-code-review
description: Use when a change merits independent review because of uncertainty or significant security, data, compatibility, concurrency, or architectural risk, or when the user or project requires review.
---

# Requesting Code Review

Use review to resolve meaningful risk. A clear wording, style, or small UI correction normally needs direct inspection and relevant verification. Larger changes should be judged by uncertainty and failure impact, not file count alone.

Request an independent reviewer for consequential changes, unclear design decisions, or project-required review. For independent tasks, group review at useful integration boundaries; do not automatically create a reviewer after every task. Send the requirements, changed scope, decisions, and verification evidence the reviewer needs, rather than the entire conversation.

## Define the actual review target

Choose a mode explicitly:

- **Working tree:** review the intended current result relative to an observed base commit (usually `HEAD` for uncommitted work). Include staged changes, unstaged changes, and relevant nonignored untracked files. Distinguish unrelated user changes and limit review to the authorized scope.
- **Commit range:** review an explicitly selected base and head commit. State that later working-tree changes are outside this target. Resolve both revisions before dispatch; do not assume `HEAD~1` is the task's starting point.

Read-only inspection can include `git status --short`, `git diff --no-ext-diff --no-textconv BASE -- PATHS`, `git diff --cached --no-ext-diff --no-textconv BASE -- PATHS`, `git diff --no-ext-diff --no-textconv -- PATHS`, and `git ls-files --others --exclude-standard`. Inspect scoped untracked files separately; ordinary `git diff` does not include their contents. Use literal, safely quoted repository-relative paths when building scope arguments.

Record the resolved base/head, mode, file scope, and the snapshot or package under review. Keep the reviewed scope stable during review, or give the reviewer an immutable package. Later changes need only an appropriate follow-up on the affected scope.

The optional `subagent-driven-development/scripts/review-package` helper supports both modes. Use it only if it is available and useful; a plan file, commit, or package is not required just to request a review.

## Dispatch and act on findings

Use [code-reviewer.md](code-reviewer.md) as a compact prompt template. Include:

- requirements and important compatibility or authorization constraints;
- review mode, checkout or snapshot location, base/head, and exact file scope;
- what changed, relevant tests or observations, and remaining uncertainty.

The reviewer inspects without changing the checkout, creating worktrees, or publishing comments. Review feedback is evidence to evaluate, not authority to expand the task. Confirm significant findings, fix in-scope defects, and distinguish suggestions from unmet requirements. Resolve material issues before claiming readiness; explain justified disagreement with code or test evidence.

Repeat review when a relevant change or unresolved concern warrants it. Do not repeat an unchanged review for ritual completeness. Review completion does not authorize a commit, push, merge, or external message.
