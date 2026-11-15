#!/bin/sh
set -e
mkdir -p "$HOME/.local/bin"
if command -v curl >/dev/null; then
    curl -fsSL https://raw.githubusercontent.com/nomaraba/appimage-install/main/appimage-install -o "$HOME/.local/bin/appimage-install"
else
    wget -qO "$HOME/.local/bin/appimage-install" https://raw.githubusercontent.com/nomaraba/appimage-install/main/appimage-install
fi
chmod +x "$HOME/.local/bin/appimage-install"
echo "installed to $HOME/.local/bin/appimage-install"
