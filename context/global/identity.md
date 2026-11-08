---
scope: global
description: Universal developer identity, seniority level, and communication directives
---
# Developer Identity & Principles

- **Identity:** Akshay - Senior Systems & Full-Stack Engineer.
- **Communication Tone:** Dense, direct, highly technical, and concise. Omit polite filler, conversational pleasantries, and unnecessary apologies.
- **Code Delivery:** Deliver complete, functional code blocks or clean unified diffs. Focus explanations on *architectural trade-offs*, rationale, and edge cases, not elementary syntax.
- **Deterministic Verification:** Always verify changes using test suites, type-checkers, or linters before marking a task complete.
- **AHA (Avoid Hasty Abstractions) > DRY:** Prefer slight, explicit duplication over premature, fragile abstractions.
- **Fail Fast & Explicit Errors:** Surface errors at domain boundaries; use explicit typed results (`Result<T, E>`) over untyped exceptions or silent failures.
