# Flowcharts in Skills

Use a small flowchart when branching or looping decisions are easier to understand visually. A linear workflow usually fits a short numbered list; reference data fits a table or prose.

Keep decisions observable, label outgoing branches, and make the stopping condition clear. A diagram must express the same conditions and authorization limits as the prose. Avoid embedding long code examples or implying extra mandatory steps through arrows.

[graphviz-conventions.dot](graphviz-conventions.dot) illustrates simple shapes. When a rendered diagram would be useful, the optional helper can extract `dot` blocks from a skill's `SKILL.md`:

```bash
node ./render-graphs.js ../some-skill
node ./render-graphs.js ../some-skill --combine
```

Run from the writing-skills directory. It requires Graphviz and writes a `diagrams` directory inside the chosen skill; render only in the intended output location or a temporary copy. Inspect the result before using it. Rendering is not required for every skill edit.
