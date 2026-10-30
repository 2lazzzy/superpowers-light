---
name: finishing-a-development-branch
description: Use when implementation is ready and an authorized integration action remains, or the user needs to decide how to integrate a completed development branch.
---

# Finishing a Development Branch

Finish the user's chosen workflow with evidence for the actual changes being integrated. Do not add an integration decision to a task that only requested local edits.

## Readiness and authority

- Review acceptance criteria, outstanding findings, the current branch/HEAD, uncommitted changes, and workspace ownership. Important unresolved defects or required failing checks block a completion claim; unrelated baseline failures must be explicitly distinguished.
- Use relevant existing validation for the exact state under review. Run additional checks when the changes, environment, failures, or project requirements warrant them. Do not repeat an unchanged suite just to enter this skill.
- Preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup, then inspect the resulting changes and perform any affected checks.
- Reuse explicit authorization for branch changes, commits, pushes, PR creation, or merges. A skill instruction or a plan's sample command is not authorization. If the requested integration action is already clear, perform it without asking the same question again. If no integration was requested, report and preserve the local changes.

## Choose only what remains undecided

Find the intended base and destination from the task, repository, and existing review metadata. A branch's upstream is evidence, not necessarily its merge base. Ask if a material ambiguity remains before merging or publishing.

If the user wants integration but has not chosen a route, present the applicable choices: merge locally, push/create a PR, or leave the work in place. Do not offer destructive discard as routine cleanup. A detached HEAD requires an explicit preservation/publishing route; it does not authorize creating a branch automatically.

## Carry out the authorized route

**Local merge:** Locate the intended target checkout using `git worktree list --porcelain`; do not infer its path from `.git/..`. Check that switching or merging will not include or disturb unrelated changes. Follow the repository's update/merge policy; avoid an unconditional `git pull`. Verify the merge succeeded and check the merged result as needed before cleanup. If it fails, preserve both work and diagnostic evidence and investigate; do not silently reset user state.

**Push and PR:** Verify the actual branch, remote, destination, and diff, including that the intended changes are committed if publishing requires it. Do not silently omit uncommitted work. Push and create/update the PR within existing authorization, using the repository template. Report the result URL. Preserve the working environment for feedback unless the user already authorized a different lifecycle. A rejected push requires investigation; do not force-push without explicit authorization.

**Keep local:** State where the changes are and whether they are committed. Do not imply that an uncommitted change is safely stored in Git history.

## Cleanup by proven ownership

Clean up only when the integration/lifecycle request authorizes it and the target is known to belong to this task. Use the creation record, native tool's ownership metadata, or the user's explicit identification. Being under `.worktrees/` or `worktrees/` is not ownership evidence. Preserve pre-existing, user-owned, and host-managed workspaces unless their approved lifecycle says otherwise.

Before removing a worktree, inspect its status including ignored files (`git status --short --untracked-files=all --ignored`), unique commits, and any task artifacts. Ignored files can contain useful evidence or data even if ordinary status is clean. Preserve needed files and decisions, and act only on the specific authorized target from outside its directory. Prefer the owning native tool when it manages the workspace; otherwise use `git worktree remove` for that exact path. Do not run a global `git worktree prune` as routine cleanup.

If removal is refused or would discard unpreserved changes, explain the concrete files/commits at risk and obtain the missing decision; do not escalate to `--force` on your own. Delete a branch only when its deletion is included in the approved workflow and its work is preserved or explicitly approved for disposal.

For an explicit discard request, inventory the exact target and consequences first. Reuse clear, informed authorization already given; otherwise confirm the destructive scope in plain language. No special confirmation word is required. Finish with the actual integration status, validation, retained workspace, and any unresolved limitation.
