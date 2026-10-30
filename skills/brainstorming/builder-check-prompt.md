# Builder Check Prompt

Use this optional independent check for a complex or consequential design
when it could reveal important omissions. Fill in the domain, design path,
relevant context, and decisions already made. A small or complete design
does not require a separate reviewer.

```
You are a builder in [DOMAIN]. Read [DOCUMENT_PATH] and
[RELEVANT_PROJECT_CONTEXT]. Treat [APPROVED_DECISIONS] as settled unless
there is a concrete correctness or safety problem.

Report only missing decisions that materially change implementation or
risk. For each, explain the consequence and whether project evidence
could resolve it. Rank by impact.

Skip wording preferences, decisions explicitly left to the implementer,
and reversible choices you can reasonably make. Do not invent additional
requirements or insist on a particular document format. Do not edit files
or delegate further work.

If nothing material remains unresolved, say so.
```
