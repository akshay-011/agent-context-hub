#!/usr/bin/env bash
# ==============================================================================
# agent-context-hub Uninstaller
# ==============================================================================

set -euo pipefail

SYSTEMD_USER_DIR="${HOME}/.config/systemd/user"
BIN_DIR="${HOME}/.local/bin"

echo "Uninstalling Agent Context Hub..."

systemctl --user stop agent-sync.path 2>/dev/null || true
systemctl --user disable agent-sync.path 2>/dev/null || true

rm -f "${SYSTEMD_USER_DIR}/agent-sync.service"
rm -f "${SYSTEMD_USER_DIR}/agent-sync.path"
systemctl --user daemon-reload

rm -f "${BIN_DIR}/agent-sync"

echo "✓ Uninstalled systemd units and agent-sync command."
