#!/usr/bin/env bash
set -euo pipefail
trap 'echo "$0: line $LINENO: $BASH_COMMAND: exitcode $?"' ERR
# ABOUTME: Installs Claude Code plugins (RTK, nWave) into the image at build time.
# ABOUTME: Run inside the Dockerfile as claude-user, after PATH includes ~/.local/bin.

# Install Rust Token Killer
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
rtk init -g --auto-patch
echo "MX: IGNORE ABOVE 'No hook installed' warning !!!"
echo "MX: IGNORE ABOVE 'No hook installed' warning !!!"
echo "MX: IGNORE ABOVE 'No hook installed' warning !!!"

# Install nWave harness
pipx install nwave-ai
nwave-ai install
ln -s /home/claude-user/.local/pipx/ /home/claude-user/.local/share/pipx
