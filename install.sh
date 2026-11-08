#!/usr/bin/env bash
# ==============================================================================
# agent-context-hub Installer
# Configures agent-sync, systemd boot watcher daemon, and initial global sync.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
SYSTEMD_USER_DIR="${HOME}/.config/systemd/user"
DEFAULT_VAULT_DIR="${HOME}/Vault"

echo "================================================================="
echo " Installing Agent Context Hub"
echo "================================================================="

# 1. Ensure prerequisites
if ! command -v python3 >/dev/null 2>&1; then
    echo "[ERROR] python3 is required." >&2
    exit 1
fi

python3 -c "import yaml" 2>/dev/null || {
    echo "[INFO] Installing pyyaml..."
    python3 -m pip install --user pyyaml || {
        echo "[ERROR] Failed installing pyyaml. Please run: pip install pyyaml" >&2
        exit 1
    }
}

# 2. Install binary to ~/.local/bin/agent-sync
mkdir -p "${BIN_DIR}"
ln -sf "${SCRIPT_DIR}/bin/agent-sync.py" "${BIN_DIR}/agent-sync"
chmod +x "${BIN_DIR}/agent-sync"
echo "✓ Installed CLI: ${BIN_DIR}/agent-sync"

# 3. Setup Obsidian Vault convenience symlink (~/Vault/Context -> repo/context)
if [ ! -e "${DEFAULT_VAULT_DIR}/Context" ]; then
    mkdir -p "${DEFAULT_VAULT_DIR}"
    ln -s "${SCRIPT_DIR}/context" "${DEFAULT_VAULT_DIR}/Context"
    echo "✓ Linked Obsidian Vault path: ${DEFAULT_VAULT_DIR}/Context -> ${SCRIPT_DIR}/context"
fi

# 4. Install systemd user services
mkdir -p "${SYSTEMD_USER_DIR}"
cp "${SCRIPT_DIR}/systemd/agent-sync.service" "${SYSTEMD_USER_DIR}/"
cp "${SCRIPT_DIR}/systemd/agent-sync.path" "${SYSTEMD_USER_DIR}/"
echo "✓ Installed systemd user units to ${SYSTEMD_USER_DIR}"

# 5. Enable lingering so user daemons run at boot/reboot
if command -v loginctl >/dev/null 2>&1; then
    loginctl enable-linger "${USER}" 2>/dev/null || true
    echo "✓ Enabled machine boot persistence (systemd user lingering)"
fi

# 6. Reload and enable systemd path watcher
systemctl --user daemon-reload
systemctl --user enable --now agent-sync.path
echo "✓ Enabled and started systemd watcher: agent-sync.path"

# 7. Initial compilation run
echo ""
echo "Running initial global synchronization..."
"${BIN_DIR}/agent-sync"

echo ""
echo "================================================================="
echo " Installation Complete!"
echo " Any change in your Obsidian Context directory will now"
echo " automatically sync to all AI tools (AGY, Claude Code, Cursor)."
echo " The watcher will automatically start whenever your machine boots."
echo "================================================================="
"${BIN_DIR}/agent-sync" --status
