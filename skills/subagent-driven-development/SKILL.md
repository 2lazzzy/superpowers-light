---
name: subagent-driven-development
description: Use when an agreed implementation plan contains separable work where delegation or independent review materially improves speed, context management, or confidence.
---

# Subagent-Driven Development

Delegate useful units of work while keeping responsibility for requirements, integration, and completion. An ordinary feature can use a short chat plan and direct implementation; neither a new implementer for every task nor a reviewer after every edit is required.

## Choose the execution shape

- Keep small clear edits direct. Delegate independent work or request independent review of important changes. Batch repeated same-shape changes when one context can handle them; see [batching](references/batching.md).
- Pass the task, relevant interfaces, project constraints, allowed files, and expected evidence. Avoid passing accumulated session history; use isolated context where the tool supports it. Respect the host's available models and the user's preferences; file count alone does not measure difficulty.
- Stay in the requested workspace. Use [using-git-worktrees](../using-git-worktrees/SKILL.md) only if isolation is requested or included in the approved workflow. Git mutations require existing authorization, including worker commits.
- Give parallel workers disjoint ownership and consider shared dependencies, indexes, generated files, and services. For safely independent tasks, use [dispatching-parallel-agents](../dispatching-parallel-agents/SKILL.md). Serialize conflicting edits or review snapshots.

## Coordinate the work

1. Read the agreed requirements and relevant code. Check actual shared interfaces before dispatch; for complex plans, [preflight](references/preflight.md) provides a focused scan.
2. Give each worker a self-contained assignment using the relevant parts of [implementer-prompt](implementer-prompt.md). Include authorization boundaries and any user or project testing and retention requirements. Workers may ask the controller about missing material information; resolve reversible choices from evidence rather than repeatedly asking the user.
3. Read the worker's report and inspect its changes. Handle incomplete or uncertain reports using [handling-reports](references/handling-reports.md). Do not mistake a worker's declaration for acceptance evidence.
4. Review changed behavior and project requirements. For important changes or requested independent review, use [task-reviewer-prompt](task-reviewer-prompt.md) or a suitable whole-change reviewer. Reviews should inspect enough source to judge concrete risks and reuse valid test evidence from unchanged code.
5. Assess objections immediately. Fix real important problems, reject demonstrated false positives with evidence, and keep the actual severity of discoveries outside the current review scope. [fix-loop](references/fix-loop.md) describes recovery when fixes do not converge; no retry count makes an unresolved important problem complete.
6. Integrate compatible results and perform the necessary combined checks. Use [final-review](references/final-review.md) when a whole-change review is needed. Complete only after acceptance conditions and important findings are resolved.

Keep moving on authorized independent work and provide brief progress updates. Avoid busy polling and long silent waits; respect the host's communication cadence. Ask only for missing decisions that materially change behavior, scope, or risk after checking available context, and reuse prior approvals.

## Optional files and tools

For long work or handoff, maintain a concise ledger with task state, decisions, validation, review scope, and unresolved findings. On resumption use [resuming](references/resuming.md). A short task can keep this information in chat.

Helpers accept a numbered plan file. Invoke them with Bash, using the project as working directory:

- `bash <skill-dir>/scripts/sdd-workspace PLAN_FILE` provides per-plan scratch storage.
- `bash <skill-dir>/scripts/task-brief PLAN_FILE N` extracts one task; add project constraints and relevant earlier decisions in the assignment.
- `bash <skill-dir>/scripts/review-package PLAN_FILE --working-tree BASE [OUTFILE] [-- PATH...]` snapshots tracked final contents relative to BASE, staged and unstaged changes separately, and nonignored untracked files. PATH entries are literal repository-relative files/directories; omit them only when the whole working tree is in scope. Pause edits in scope during packaging and review. Changes afterwards require an updated check.
- `bash <skill-dir>/scripts/review-package PLAN_FILE BASE HEAD [OUTFILE]` retains committed-range review. Record the true baseline before work; `HEAD~1` misses earlier commits in a multi-commit task. Commit only when already authorized.

Reviewers remain read-only on the source tree, index, and branch state. If requirements cannot be verified from a package, inspect the relevant source or resolve the evidence gap using [cannot-verify](references/cannot-verify.md).

Preserve existing and newly added regression tests by default. Before completion, remove explicitly temporary test artifacts only when the user or project requests cleanup, then inspect/validate the final changes. Record that removed artifacts provided temporary validation, not lasting regression coverage. Keep useful decision evidence until handoff; delete only this task's scratch artifacts. Invoke [finishing-a-development-branch](../finishing-a-development-branch/SKILL.md) only when integration is authorized or genuinely requires a decision.
