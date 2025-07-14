#!/usr/bin/env bash
set -e

BIN_DIR="/opt/kubeutils/bin"
KUBESORT_URL="https://raw.githubusercontent.com/ramadasmr/kubesort/refs/heads/main/kubesort"

sudo mkdir -p "$BIN_DIR"
curl -L -o kubesort "$KUBESORT_URL"
chmod +x kubesort
sudo mv kubesort "$BIN_DIR"

SHELL_RC="${HOME}/.bashrc"
[ -n "$ZSH_VERSION" ] && SHELL_RC="${HOME}/.zshrc"

if ! grep -q "$BIN_DIR" "$SHELL_RC"; then
  echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$SHELL_RC"
fi

if ! grep -q "alias ksort=" "$SHELL_RC"; then
  echo "alias ksort=\"kubesort\"" >> "$SHELL_RC"
fi

export PATH="$BIN_DIR:$PATH"
alias ksort="kubesort"
