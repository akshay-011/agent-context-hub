---
scope: stack
globs: "**/*.py"
description: Modern Python backend standards with strict type annotations and uv
---
# Python Backend Standards

- **Type Annotations:** Full type hinting (`typing` / `types`) on all function signatures and public APIs. Run `mypy` or `pyright` in strict mode.
- **Tooling:** Prefer `uv` for package management, virtual environments, and script running; format with `ruff`.
- **Async & Concurrency:** Async functions must be clean and non-blocking. Avoid mixing blocking synchronous I/O in async event loops without thread pools.
- **Testing:** Comprehensive test coverage via `pytest`. Use fixtures over global test mocks.
