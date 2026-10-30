---
name: brainstorming
description: Clarify unresolved requirements or compare consequential design choices before implementation; use for requested design discussions or materially ambiguous features.
---

# Brainstorming

Resolve the decisions that change what should be built. If the request is already clear and low risk, proceed with the requested work without a design interview.

## Establish what is already known

Read the request, relevant code, existing design documents, and earlier decisions. Identify the desired outcome, constraints, and unresolved choices. Do not ask the user to repeat information the project already supplies.

Distinguish a decision the user owns (product behavior, scope, a consequential tradeoff) from a reversible implementation detail you can settle using existing conventions. Ask concise, concrete questions only about the former. Group related questions when that saves a round trip; a message does not need to end with a question.

When the user asks for a recommendation or authorizes reasonable assumptions, propose a concrete approach and state significant assumptions. Continue work that does not depend on unanswered questions. Do not treat silence as approval for a decision that actually needs it.

## Compare approaches when there is a real choice

Explain the viable alternatives and their relevant tradeoffs. Recommend one based on the existing project and the user's goals. Do not invent extra options or ask the user to choose routine implementation details.

For consequential unresolved choices, get the decision before dependent implementation. For an already approved design or a clear implementation request, preserve the authorization and proceed without another design-approval ceremony.

## Record only what the work needs

- Small, clear change: a sentence or short plan in chat; no design file required.
- Ordinary feature: capture the intended behavior, relevant decisions, and validation in chat.
- Complex or risky work, work spanning sessions, or a handoff: reuse the existing design if it covers the decisions. Write or extend a concise design only where durable context is missing: intent, constraints, chosen approach, important alternatives, failure cases, and open decisions. Follow the project's existing documentation location; otherwise `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md` is a convention, not a required artifact.

Do not commit a document unless Git changes are authorized. Do not introduce a second approval gate for decisions already approved. If the user requested design only, deliver the design without starting implementation.

For a complex design where an independent builder could catch consequential omissions, use [builder-check-prompt.md](builder-check-prompt.md). Supply relevant project context with the design. Resolve facts from the code and minor implementation choices yourself; ask the user only about remaining material decisions. A builder check is optional for ordinary work.

## Visuals and experiments

Use a diagram, mockup, or short experiment when it resolves a concrete uncertainty. Prefer the available visualization tools. The optional local [visual companion](visual-companion.md) is for an agreed interactive browser session; it is not required for UI discussions.

A requested throwaway prototype may use minimal validation. Label its limitations and do not represent it as production-ready. If the user asks to retain it, identify the additional checks or design decisions needed before using it as production code; do not restart discovery from scratch.

## Continue

Once the needed decisions are resolved, proceed within the user's authorized scope. Use [writing-plans](../writing-plans/SKILL.md) only when a durable multi-step plan is useful; otherwise implement from the short plan. Increase the planning depth if new evidence changes the risk or scope, explaining the concrete reason.
