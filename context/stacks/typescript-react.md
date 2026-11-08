---
scope: stack
globs: "**/*.{ts,tsx,jsx}"
description: Modern strict TypeScript and React architecture standards
---
# TypeScript & React Architecture Standards

- **Strict Typing:** Strict TypeScript mode is non-negotiable. Zero implicit or explicit `any` (use `unknown` with type narrowing/guards).
- **State Colocation:** Colocate state close to the components consuming it. Prefer pure functional transformations and derived state over synchronization effects (`useEffect`).
- **Testing Axioms:** Test visible user behavior with Vitest and React Testing Library. Mock network and boundary layers only—never mock internal component functions.
- **Code Style:** Functional components, immutable props, early returns.
