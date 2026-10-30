# Resolve Review Findings

Evaluate each finding as soon as it arrives against requirements, source, and available evidence:

- A demonstrated false positive can be rejected immediately with the evidence and reason. A disputed plan requirement needs a material decision, not five unsuccessful fix rounds.
- Fix real Critical/Important issues that affect acceptance before completing dependent work. Track unrelated important discoveries with their actual severity and route them to the appropriate owner; being outside the diff does not make an issue minor.
- Defer optional minor improvements with a brief explanation when they are outside the requested scope. Do not expand the task merely to clear every polish suggestion.

Choose the smallest useful repair assignment. Reuse the implementer with relevant context or fix directly when that is simpler; a fresh investigator or reviewer is useful when the approach is stuck or the change warrants independent judgment. Verify the changed behavior and run affected project checks. Use [scoped follow-up review](../re-review-prompt.md) when fixes or remaining risk justify it, reusing valid evidence for unchanged code.

If attempts repeat without new evidence or progress, stop repeating the same approach. Investigate the cause, revise the plan, change the task boundary, or request missing material information. An iteration limit controls cost; it cannot convert a real unresolved defect into completion. A deferred issue that blocks acceptance or downstream correctness remains visibly incomplete until fixed or the user explicitly changes the requirement/scope.

Record decisions and unresolved findings in chat or the optional ledger. Keep progress updates concise and continue authorized independent work.
