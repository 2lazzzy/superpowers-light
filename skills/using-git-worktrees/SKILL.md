---
name: using-git-worktrees
description: Use when the user requested an isolated Git workspace or an approved workflow requires isolation, and an existing suitable workspace must be identified or prepared.
---

# Using Git Worktrees

Use the requested workspace and existing authorization. A plan, a feature request, or this skill's presence does not by itself authorize creating a branch or worktree. Default to the current workspace; do not ask again about an already resolved choice.

## Identify the current environment

Inspect the repository root, Git directory, common Git directory, branch, and worktree list before creating anything:

```bash
repo_root=$(git rev-parse --show-toplevel)
git_dir=$(git rev-parse --absolute-git-dir)
common_dir=$(cd "$(git rev-parse --git-common-dir)" && pwd -P)
git branch --show-current
git worktree list --porcelain
git rev-parse --show-superproject-working-tree
```

Compare normalized physical paths. Different Git and common directories identify a linked worktree; corroborate the root with its worktree-list record. A submodule's Git directory residing under `.git/modules` does not by itself mean it is a linked worktree. Treat submodule and superproject as distinct repositories and verify which one the task owns. A detached HEAD does not establish who created the workspace.

Reuse suitable existing isolation. Record its actual branch/HEAD and whether it is user-owned, host-managed, or created by this task. If the requested isolation is missing, use an available native tool that supports the requested location and lifecycle; otherwise use Git. Do not create a second worktree just because one was created by another tool.

## Prepare an authorized worktree

Honor explicit directory and branch choices. If location is unspecified within an approved isolation workflow, use the project's convention or a project-local `.worktrees/` directory. Before placing a worktree inside the repository, verify the **chosen directory**, not a different conventional name:

```bash
# worktree_rel is the actual chosen repository-relative parent directory.
git ls-files -- "$worktree_rel/"
git check-ignore -q -- "$worktree_rel/"
```

The location must not contain tracked source or unrelated work. If it is not ignored, apply an appropriate ignore rule within the authorized setup scope and recheck that exact path. Do not automatically commit ignore changes. Respect project conventions for tracked versus local ignore rules.

Create only the authorized branch and worktree. Record the repository, path, branch, creator/tool, and cleanup ownership in chat or an existing task record so later cleanup does not guess from directory names.

If creation fails, investigate and use the environment's approval/recovery mechanism where appropriate. **Do not continue implementation in another location when the user requested isolation.** Explain the blocker and ask only if a materially different environment must be chosen.

## Project preparation and baseline

Read the project's setup instructions and existing environment before installing anything. Detect the package manager from an explicit declaration and lockfiles (for example pnpm, Yarn, npm, or Bun); do not infer npm solely from `package.json`. For Python, inspect the declared tooling and environment; `pyproject.toml` alone does not imply Poetry. Use the project's required setup, including lockfile-preserving commands, only when needed.

Run the checks needed to distinguish pre-existing failures from this task's effects. Reuse valid results for an unchanged environment. Investigate failures before attributing them to the work; proceed on unrelated known baseline failures only when that remains within scope and can be verified honestly. Stop dependent work if the baseline prevents meaningful validation or the requested environment cannot be prepared.

Report the actual path, branch/HEAD, checks, and limitations. Workspace creation does not authorize later commits, pushes, merges, or cleanup of unrelated worktrees.
