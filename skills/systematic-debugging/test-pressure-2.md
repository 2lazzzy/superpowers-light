# Scenario: Repeated Timing Fixes

This is a simulation in a disposable test fixture.

A payment-status test intermittently sees `pending` instead of `completed`. Increasing sleeps from 100 ms to 2000 ms has not made it reliable. Logs show the payment operation finishes, but the test has no observation confirming that the status update is committed. Three attempted changes have failed.

Choose a useful next experiment and explain what observation would distinguish delayed completion, stale reads, and a missing update. Consider event or state observation rather than another guessed timeout. Do not infer an architectural defect from the attempt count alone. State what you can conclude now and what evidence is still missing.
