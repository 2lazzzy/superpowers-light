# Task Review Assignment

Use independent review when requested or justified by the change's impact and uncertainty. Scale review scope to concrete risks rather than requiring a new reviewer for every task.

```text
Review target: [requirements and relevant constraints]
Mode and snapshot: [commit range OR working-tree package and baseline]
Owned scope: [files/resources; known pre-existing or unrelated changes]
Inputs: [brief/report/package paths when available]
Risks to check: [specific behaviors, interfaces, failure modes]
```

Read the actual change and enough surrounding source/call sites to evaluate it. A diff is an entrypoint, not a prohibition on necessary context. Check requirements, correctness, compatibility, and relevant failure modes. Treat the implementer's explanations as claims to evaluate, not authority over severity. Report material plan defects as well as implementation defects.

For working-tree review, account for the final tracked contents, index, unstaged changes, and relevant untracked files. Use the explicitly identified snapshot and state which scope was reviewed. A commit-range diff does not include later uncommitted work. Changes after packaging need an updated check of the affected scope. If evidence is missing, inspect available sources or report precisely what cannot be verified.

The review is read-only on source files, index, HEAD, and branch state. Do not create a worktree, stage, commit, switch, stash, or reset to manufacture a review target. Avoid duplicate reviewers. Reuse valid test evidence for the same code; run an additional focused check only for a concrete doubt it can resolve and within the review's side-effect boundaries. Recommend needed heavy or mutating validation to the controller. Distinguish new warnings from unrelated baseline noise.

Grade by actual impact:

- **Critical/Important:** correctness, security, compatibility, data-loss, missing requirements, or other issues that must be resolved before acceptance. Explain the trigger and effect.
- **Minor:** optional polish or limited improvements that do not prevent acceptance.

An issue's location outside the current scope does not lower its severity. Report it separately with its actual impact and dependency on this change so the controller can route it. The controller can accept or reject objections immediately from evidence; there is no required retry count.

Return a compact report:

- Spec compliance and quality verdict, with any material evidence gaps.
- Findings with severity, file:line, trigger, effect, and proposed direction.
- Checks performed or evidence relied on, and review scope/limitations.
- Relevant strengths when useful to explain the assessment.

Preserve existing and newly added regression tests by default. Respect cleanup of explicitly temporary test artifacts when requested by the user or project. Evaluate the resulting artifact and recorded validation honestly; removed artifacts are not ongoing regression coverage.
