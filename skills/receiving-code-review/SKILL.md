---
name: receiving-code-review
description: Use when assessing code review feedback before acting on it, especially when a suggestion is unclear, conflicts with requirements, or may affect correctness or compatibility.
---

# Receiving Code Review

Understand the concern, check it against the code and requirements, and make the justified correction. Reviewers can identify real defects without having the full context; neither agreement nor disagreement substitutes for evidence.

## Assess the feedback

- Read the relevant feedback and code. Identify the reported trigger, expected behavior, and impact.
- Check compatibility, existing design reasons, and affected callers. A repository search alone does not prove an externally exposed endpoint is unused.
- Distinguish confirmed defects, missing requirements, and optional suggestions. The user's established scope and decisions remain authoritative.
- Investigate routine uncertainty using available code, documentation, and tests. Ask only about unresolved choices that materially change behavior, scope, risk, or authorization.

If an item is unclear, pause changes that depend on it. Continue clear, independent fixes; do not block the entire review because unrelated feedback needs clarification. When multiple items interact, resolve their shared uncertainty before changing that area.

## Implement and verify

Prioritize consequential defects and make coherent, in-scope changes. Group independent small corrections when that makes validation clearer; isolate changes when needed to identify a failure. Choose tests, type checks, builds, or interaction checks appropriate to the affected behavior and project requirements.

Verify the actual concern and relevant regressions. Reuse evidence for unchanged state; do not require a separate full test run for every typo or import correction. Preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup, then inspect the final state and check any consequences of removal.

## Respond clearly

Be concise, factual, and courteous. A brief acknowledgment or thanks is fine; avoid exaggerated agreement or claiming a fix before verification.

Examples:

- “Fixed the empty-input case and verified the existing validation checks.”
- “This path supports older clients. Removing it would break compatibility; I corrected the fallback instead.”
- “Items 1 and 2 are independent and verified. Item 3 depends on whether the API should accept missing timestamps.”
- “I checked the caller and my earlier objection was wrong. The suggested change is appropriate.”

Push back with evidence when feedback is incorrect, conflicts with established requirements, or introduces disproportionate complexity. If verification remains unavailable, state the limitation and what evidence is missing; do not silently assume success.

When the user has authorized GitHub review replies, reply to inline feedback in its existing comment thread. Reading or addressing feedback does not by itself authorize posting messages, committing, pushing, or merging.
