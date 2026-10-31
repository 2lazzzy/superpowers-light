# Codex execution notes

Read this reference when a selected workflow needs Codex-specific execution mechanics. The tools and permissions actually exposed by the current session are authoritative; do not assume a tool or configuration option from an older installation exists.

## Delegation

Use delegation for independent work or a useful independent review. Send the task, relevant file locations, constraints, and expected output rather than the entire conversation by default.

- If supported, `fork_turns: "none"` gives a worker a clean context. Follow the current tool schema for allowed model and reasoning-effort overrides; do not assume full-history forks accept them.
- Choose a suitable available model only when model selection is exposed and authorized by the environment. Do not copy model names from examples or modify global configuration as a prerequisite to ordinary work.
- Reuse the original worker for follow-up fixes when supported. Use a new worker when a different perspective is useful, not merely because a tool call ended.
- Work on independent local tasks while workers run. When idle, use the tool's event wait in bounded stretches compatible with the host's progress-update requirements. Avoid repeated short polling and unsupported lifecycle calls.
- If delegation is unavailable, implement directly. For work that materially requires independent review, disclose the limitation; a self-review is not independent evidence.

## Workspace and Git state

Inspect the current checkout before acting:

```bash
git rev-parse --show-toplevel
git rev-parse --absolute-git-dir
git rev-parse --path-format=absolute --git-common-dir
git rev-parse --show-superproject-working-tree
git branch --show-current
git status --short
```

On Git versions lacking `--path-format`, resolve both directories to absolute paths before comparing them. Detect linked worktrees using the Git directory/common directory relationship, accounting for submodules and the host's workspace ownership.

An empty branch name indicates detached HEAD; it does not by itself establish a permission restriction or mean a branch cannot be created. Follow actual tool errors and host guidance. Existing workspaces can be used without creating another worktree.

Creating a branch or worktree, switching checkouts, committing, pushing, merging, and removing a workspace require the user's request or an already authorized workflow. Do not stage or commit all files as a workaround for a restriction. If the requested environment cannot be prepared, report the specific blocker rather than silently implementing in another location.

If the host requires a native handoff or branch action, describe only controls confirmed to exist. Provide a diff or suggested next action without pretending that an unavailable operation succeeded.
