---
name: writing-skills
description: Use when creating or editing a reusable agent skill, including its discovery metadata, instructions, supporting references, or executable helpers.
---

# Writing Skills

Write skills that improve decisions for a defined task without imposing unrelated work. Preserve the user's intent, existing authorization, and project conventions.

## Scope the change

Read the current skill and the references affected by the request. Reuse observed failures or examples from the conversation; do not require a new baseline experiment when the problem is already demonstrated.

- For wording, links, formatting, or metadata changes, edit directly and validate the affected structure and meaning.
- For trigger or workflow changes, consider representative requests that should and should not activate the skill, and check realistic outcomes.
- For consequential behavior involving authorization, data loss, security, compatibility, or complex coordination, use stronger scenario validation and independent review when available and useful.

Choose this based on uncertainty and failure impact, not word count. A one-line permission rule can deserve more scrutiny than a long reference update. Ask only about material unresolved choices after inspecting available context. A short chat plan is enough unless a durable design or handoff document is needed.

## Write the useful instructions

Keep purpose, trigger, operating boundaries, and key decisions in `SKILL.md`. Move conditional detail into references and link it where needed. Avoid duplicating a rule across files; when it changes, reconcile its callers and examples.

- Give concrete conditions and observable outcomes.
- Reserve mandatory steps for actual correctness or authorization invariants. Allow reasonable approaches where the task permits them.
- Distinguish a recommendation, an example, and a required step.
- Do not infer permission to create branches/worktrees, commit, push, publish, send messages, or change configuration from a skill's presence.
- Use the current tool surface and observed environment rather than hardcoded assumptions about tool names or models.
- Keep examples complete enough to adapt, but do not turn a past incident into a universal workflow.

Read [references/discovery.md](references/discovery.md) for names, descriptions, metadata, or size changes. Read [references/flowcharts.md](references/flowcharts.md) only when a diagram would clarify a meaningful decision. [references/anthropic-best-practices.md](references/anthropic-best-practices.md) contains concise authoring guidance, not an additional required workflow.

## Validate proportionally

| Change | Useful validation |
|---|---|
| Wording, metadata, links, layout | Frontmatter and local references resolve; meaning, scope, and invocation policy remain correct |
| Trigger or procedural guidance | Representative applicable requests and nearby non-applicable requests; outcomes match intent |
| Important policy or coordination change | Realistic scenarios, meaningful counterexamples, and independent review of risks when useful |
| Executable helper | Run it in disposable fixtures that exercise successful and failing behavior, including relevant side effects |

Read [references/testing-skills-with-subagents.md](references/testing-skills-with-subagents.md) when behavioral evaluation would add confidence. Use a control or repeated samples when needed to distinguish a real effect from variability, not a fixed repetition count for every edit. Reference skills need retrieval/application checks rather than artificial compliance pressure.

If a check fails, correct the demonstrated problem and recheck the affected behavior. Preserve useful work; there is no delete-and-restart rule for writing before a test. Stop testing once the relevant evidence is adequate and no new change or concern requires another run.

Preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup, then inspect the final changes and run affected checks. Report the checks and their limits; removed artifacts provide no continuing regression coverage.

## Finish within authorization

Update the requested skill in the agreed location and report the changes and validation. Commit, push, contribution PRs, installation elsewhere, or publication are separate actions performed only when already requested or authorized. A configured remote does not authorize publishing.

For disciplined behavior that needs a clear boundary, see [references/bulletproofing.md](references/bulletproofing.md). It describes precise conditions and exceptions, not a reason to override user preferences or make every step compulsory.
