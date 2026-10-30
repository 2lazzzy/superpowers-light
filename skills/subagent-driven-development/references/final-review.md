# Review the Combined Result and Finish

Inspect the combined changes against acceptance criteria, ownership boundaries, and integration risks. A whole-change independent review is appropriate for important changes, an explicit request, or gaps left by earlier reviews; it is not required again when equivalent coverage of the unchanged result already exists.

Use [requesting-code-review](../../requesting-code-review/SKILL.md) with an exact commit range or working-tree snapshot, the actual requirements, relevant verification, and unresolved findings. Do not commit solely to create a review range. A working-tree package must include relevant new files and identify unrelated pre-existing edits; stop writers in its scope during packaging/review.

Assess findings immediately using [fix-loop](fix-loop.md). Fix and verify important problems before completion. Further checks or review should follow new changes and unresolved risk, not a fixed one-wave rule. Record legitimate deferrals and evidence-backed rejections without downgrading severity by scope or exhausting a retry quota.

Before final acceptance, preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup. Inspect the final change set and perform necessary checks after removal. Describe temporary validation accurately.

Keep useful decisions and evidence for handoff. Remove only this task's scratch files when no longer needed; never assume Git history contains uncommitted evidence. Use [finishing-a-development-branch](../../finishing-a-development-branch/SKILL.md) only for an authorized integration step or a genuinely undecided integration request. Otherwise report the completed local work, verification, and limitations in place. Important unresolved findings mean the task is not complete.
