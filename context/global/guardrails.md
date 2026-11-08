---
scope: global
description: Universal negative constraints, security boundaries, and git hygiene
---
# Strict Negative Constraints & Invariants

- ❌ **NO Stubs or Placeholders:** NEVER generate code with `// TODO: implement later`, pass blocks, or incomplete mock methods.
- ❌ **NO Swallowed Errors:** Catch blocks must never be empty; log or propagate with context.
- ❌ **NO Leaked Secrets:** Never write `.env` values, API tokens, personal keys, or credentials into source files or commit messages.
- ❌ **NO Dependency Bloat:** Avoid adding heavy third-party libraries (e.g. lodash, moment) when modern standard libraries provide clean primitives.
- ❌ **NO Breaking API Changes:** Maintain backwards compatibility or provide explicit, documented migration shims.
- 🔒 **Git Hygiene:** Strictly follow Conventional Commits format (`feat:`, `fix:`, `refactor:`, `chore:`, `test:`, `docs:`). Keep commits atomic.
