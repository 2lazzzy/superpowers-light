# Behavioral Validation for Skills

Use this reference when a skill's changed behavior is uncertain or consequential enough that realistic evaluation adds useful evidence. Small wording or metadata edits usually need focused structural and semantic checks instead.

## Choose a meaningful case

Start with an observed failure or a representative task. Define the intended outcome and permitted resources. Include a counterexample when the skill should deliberately take a lighter path or not activate.

| Change | Example case |
|---|---|
| Discovery trigger | An unclear recurring bug should activate debugging; a known typo should not trigger a full investigation |
| Approval boundary | A user asks to edit a skill locally; the agent completes validation without pushing a configured remote |
| Review targeting | A checkout contains staged, unstaged, and untracked task changes; the reviewer inspects all relevant content |
| Reference organization | The agent finds the correct command or field and applies it to the supplied fixture |

A skill can be correct without maximizing obedience to its procedure. Evaluate the user's outcome, authorization, scope, correctness, and cost. Reasonable adaptation is not automatically a failure.

## Run proportionally

Use an existing observation as the baseline when it establishes the problem. If the causal effect of new wording is uncertain, compare with and without it. Repeat samples only when variability matters to the decision; there is no fixed minimum for every edit.

For independent evaluation, provide a fresh evaluator with the skill, a realistic request, and minimum raw artifacts. Avoid giving the expected answer or prior diagnosis when testing whether the skill itself works. The coordinator may keep a rubric separately.

Run in disposable fixtures with explicit permissions. Simulations remain simulations: do not tell an evaluator it controls a real incident or ask it to mutate live systems. Pressure such as a deadline may be relevant to incident or authorization rules, but is unnecessary for a link correction or reference lookup.

## Evaluate the result

Inspect actual decisions and artifacts rather than counting phrases or asking the agent to recite the rule. Check whether it:

- completed the authorized task and respected concrete boundaries;
- selected a suitable amount of investigation, planning, review, and validation;
- handled the significant failure mode and relevant counterexample;
- reported evidence and uncertainty accurately.

If it fails, identify whether the cause is missing context, incorrect guidance, poor routing, or an unrealistic test. Correct the demonstrated issue and recheck affected behavior. Do not keep rewriting until every evaluator uses identical wording.

Stop when evidence is sufficient for the change and no material concern remains. State the tested scenarios and limits; a successful sample does not prove universal reliability.

Preserve existing and newly added regression test resources by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup; confirm the final state afterward. [CLAUDE_MD_TESTING.md](CLAUDE_MD_TESTING.md) offers example routing scenarios without prescribing a fixed campaign.
