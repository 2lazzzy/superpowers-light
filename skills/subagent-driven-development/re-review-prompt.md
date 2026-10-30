# Scoped Follow-up Review

Use when a changed fix or unresolved important risk warrants another independent look. Do not rerun a review solely because a workflow diagram has another box.

Provide the reviewer the prior findings, requirements, exact current scope/snapshot, fix diff or updated working-tree package, and new verification evidence.

For each prior finding, report ADDRESSED, NOT ADDRESSED, or REJECTED WITH EVIDENCE. Inspect the fix and relevant surrounding code for new breakage. Preserve the actual severity of any discovery outside the fix; label it separately for routing rather than automatically treating it as minor or non-blocking. A confirmed important defect that affects acceptance remains blocking regardless of when it was found.

Use the read-only and evidence rules in [task-reviewer-prompt](task-reviewer-prompt.md). Do not alter source files, index, HEAD, or branch state. Reuse valid checks for unchanged code; request or perform only the new checks needed for a concrete unresolved risk within those boundaries.

Return finding verdicts with file:line evidence, new findings with their actual severity, checks relied on, remaining limitations, and whether the relevant acceptance conditions are satisfied.
