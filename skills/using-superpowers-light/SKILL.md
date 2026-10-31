---
name: using-superpowers-light
description: Select an appropriate Superpowers workflow when the user explicitly requests Superpowers guidance.
---

# Using Superpowers

Use the smallest workflow that resolves the user's uncertainty and verifies the result. Invoking this skill selects an approach; it does not activate every Superpowers skill.

## Select the work that is needed

Read the request, applicable user/project instructions, and relevant existing context before choosing a process. User choices override these workflow defaults. Reuse instructions and decisions already available in the conversation.

| Situation | Approach |
|---|---|
| Clear wording, styling, or small UI edit | Inspect the relevant files, edit, and verify the changed behavior directly. |
| Ordinary feature with known requirements | Give a short plan in chat, implement in the current session, and run relevant checks. |
| Unresolved product/design decision | Use [brainstorming](../brainstorming/SKILL.md) for the decisions that matter. |
| Complex work needing a durable implementation plan | Use [writing-plans](../writing-plans/SKILL.md). |
| Bug with uncertain cause | Use [systematic-debugging](../systematic-debugging/SKILL.md). |
| Non-trivial testable behavior | Use [test-driven-development](../test-driven-development/SKILL.md) where a meaningful failing test helps. |
| Independent work that benefits from delegation | Use [dispatching-parallel-agents](../dispatching-parallel-agents/SKILL.md); use [subagent-driven-development](../subagent-driven-development/SKILL.md) when task-by-task delegation is warranted. |
| Important change needing a second opinion | Use [requesting-code-review](../requesting-code-review/SKILL.md). |
| Completion claim | Use the evidence principles in [verification-before-completion](../verification-before-completion/SKILL.md). |

Assess uncertainty, coupling, and failure impact, not just file count. A one-line permission change may need more scrutiny than a large mechanical edit. Do not load a skill merely because a keyword overlaps, or follow a chain of skill references when those steps do not apply.

## Keep the process proportionate

- Ask only for missing decisions that materially affect behavior, scope, or risk. Gather related questions together; settle reversible implementation details using project conventions.
- Keep small plans in chat. Write durable documents when complexity, resumption, handoff, or the user requires them.
- Work in the current checkout by default. Creating worktrees, switching branches, committing, pushing, merging, or deleting workspaces needs authorization from the request or an already agreed workflow. A skill instruction is not that authorization.
- Delegate independent work or useful independent review, giving each agent only the context it needs. Do not make a new implementer/reviewer pair mandatory for every task.
- Keep meaningful validation. Reuse evidence while the relevant code, environment, and inputs are unchanged; never turn an unresolved important defect into a completed task just to stop a loop.
- Preserve regression tests by default, including tests added for the change. Remove only explicitly temporary test artifacts when the user or project requests cleanup, then inspect the final state. A `.test` filename does not make a test temporary.

## Platform details

Use the tools actually available in this session. Read a platform reference only when its execution mechanics are needed, not at every conversation start:

- [Codex](references/codex-tools.md)
- [Claude Code](references/claude-code-tools.md)
- [Pi](references/pi-tools.md)
- [Antigravity](references/antigravity-tools.md)
- [Hermes](references/hermes-tools.md)
- [Muse](references/muse-tools.md)

A dispatched worker follows its assigned scope rather than restarting workflow selection. If a requested capability is unavailable, use an authorized equivalent or report the specific limitation.
