# Skill Authoring Reference

This maintained summary covers the authoring principles needed by `writing-skills`; it is not a current copy of a provider manual. Consult the target runtime's current documentation when its schema or capabilities matter.

## Keep the skill relevant

Assume the agent already knows general programming and communication. Include the non-obvious decisions, constraints, and resources that improve the particular task. A concise self-contained skill can be better than a large router with unused references.

## Match freedom to risk

Use flexible guidance when multiple approaches are sound or context determines the answer. Use a preferred recipe where it improves consistency. Reserve strict ordering for fragile operations and real correctness or authorization boundaries.

## Expose detail progressively

Metadata helps select the skill. The entrypoint explains purpose, scope, and key decisions. Supporting references provide conditional details when needed. Keep shared rules in one place and preserve links when reorganizing.

## Evaluate useful behavior

Observed failures and representative tasks are useful inputs to authoring. Validate the change at a proportional level: structural checks for mechanical edits, routing examples for triggers, realistic outcomes for behavior, and executable fixtures for helper code. Independent evaluation is useful when uncertainty and impact warrant it.

A valid metadata shape does not prove a good workflow. Conversely, an ordinary wording edit does not require a full experiment campaign. Correct demonstrated problems and stop when the relevant evidence is adequate.

For the local conventions used here, see [discovery.md](discovery.md) and [testing-skills-with-subagents.md](testing-skills-with-subagents.md).
