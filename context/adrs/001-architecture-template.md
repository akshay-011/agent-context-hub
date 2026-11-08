---
id: ADR-001
status: Accepted
date: 2026-11-09
tags: [architecture, cross-agent, context]
---
# ADR 001: Pragmatic Hybrid Multi-Agent Context Architecture

## Context
Developers work with multiple heterogeneous AI coding agents (AGY, Claude Code, Cursor, OpenCode, Codex). Re-explaining personal engineering standards in each tool causes fatigue, and dumping thousands of lines of documentation upfront into prompts causes token degradation ("Lost in the Middle").

## Decision
We adopt a decoupled, tri-tiered model:
1. **Authoring in Obsidian:** Human thoughts and rulebooks are authored in Markdown in an Obsidian vault directory (`~/workspace/agent-context-hub/context/` or `~/Vault/Context/`).
2. **Ahead-of-Time (AOT) Sync:** The `agent-sync` CLI compiles these notes into tool-native formats (`~/.claude/CLAUDE.md`, `~/.gemini/config/instructions.md`, `.cursor/rules/*.mdc`, `AGENTS.md`).
3. **On-Demand MCP Retrieval:** Deep notes and ADRs are queried on-demand via a sandboxed Model Context Protocol server, preserving prompt context.

## Consequences
- Single Source of Truth maintained in human-friendly Obsidian notes.
- Zero token bloat: global instructions remain under 400 tokens.
- Immediate cross-tool consistency on every note change.
