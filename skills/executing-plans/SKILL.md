---
name: executing-plans
description: Use when carrying out an agreed implementation plan directly in the current session, including plans with ordered dependencies.
---

# Executing Plans

Execute the agreed work directly, verify the resulting behavior, and continue without asking for the same execution choice again. A plan can be a short chat outline; a plan file, separate workspace, or review agent is not a prerequisite.

## Start from the actual task

- Read the relevant code, project instructions, and agreed requirements. For clear text, style, or small UI changes, edit and verify directly. For an ordinary feature, a short chat plan is sufficient.
- For unresolved design choices or changes with substantial security, permissions, data-loss, compatibility, concurrency, or refactoring risk, use the needed parts of [brainstorming](../brainstorming/SKILL.md) or [writing-plans](../writing-plans/SKILL.md). Do not reload an entire workflow merely because another skill is named.
- Work in the current workspace unless an isolated environment was requested or is part of the approved workflow. Use [using-git-worktrees](../using-git-worktrees/SKILL.md) only then. Failure to prepare the requested environment does not authorize a different location.
- Establish the starting changes and ownership. Branch creation, switching, commits, pushes, and merges require authorization from the task or an already approved workflow; a plan's command example alone is not permission.

## Execute and verify

1. Work in dependency order. Inspect shared interfaces before consuming them; check actual output against the plan's intended behavior.
2. Resolve reversible implementation choices using existing patterns. Record meaningful departures in chat or the optional ledger. Ask only about unresolved decisions that materially change behavior, scope, or risk, after checking available context; continue independent work while waiting.
3. For new logic and bug fixes, reproduce failure first when feasible; use [test-driven-development](../test-driven-development/SKILL.md) when it fits. Text and style changes can use appropriate visual, interaction, build, or static checks. For unexplained failures, use [systematic-debugging](../systematic-debugging/SKILL.md).
4. Run the checks needed for the changed behavior and project requirements, and read their output. Reuse evidence for unchanged code; repeat checks when a change, failure, or new concern justifies it. Follow [verification-before-completion](../verification-before-completion/SKILL.md) for completion claims.

Use independent review for important changes or when requested, following [requesting-code-review](../requesting-code-review/SKILL.md). Judge objections immediately from evidence; tests do not prove the absence of all regressions. Fix and verify real important findings before claiming completion. Further review should address changed or unresolved risk, not follow a fixed number of rounds.

## Optional recovery and review tools

For long work, multiple sessions, or handoff, record task state, decisions, verification, and the exact reviewed scope in a ledger. For numbered plan files, these helpers are available. Resolve `<skill-dir>` to this skill's directory and `<skills-dir>` to its parent; keep the project as the working directory:

- `bash <skill-dir>/scripts/task-start PLAN_FILE N` extracts a brief and reports the current HEAD as a possible baseline.
- `bash <skill-dir>/scripts/task-done PLAN_FILE N BASE -- COMMAND [ARGS...]` records completion after the chosen validation command succeeds. Call it only after the task's other acceptance conditions are met; it does not prove review or commit status.
- For a review of current files, use `bash <skills-dir>/subagent-driven-development/scripts/review-package PLAN_FILE --working-tree BASE [OUTFILE] [-- PATH...]`. It includes tracked final contents, staged and unstaged changes, and nonignored untracked files. Scope PATH entries to this task when other work exists; pause writers in that scope while packaging and reviewing.
- For an intentionally committed range, the compatible form is `bash <skills-dir>/subagent-driven-development/scripts/review-package PLAN_FILE BASE HEAD [OUTFILE]`. Do not commit solely to satisfy this tool.

Review snapshots have limits: changes after packaging need an updated check of the affected scope. On resumption, compare the ledger with the actual files and Git state before trusting a completion entry. Preserve decision evidence needed for handoff; remove only scratch artifacts created by this task when no longer needed.

## Finish

Preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup, then inspect the final changes and run any affected checks. Do not describe removed artifacts as ongoing regression coverage.

Report the resulting behavior, verification performed, and meaningful unverified or unresolved items. Important unresolved defects mean the work is incomplete. Use [finishing-a-development-branch](../finishing-a-development-branch/SKILL.md) only for an authorized or genuinely undecided integration step; otherwise leave the reviewed changes in the requested workspace.
