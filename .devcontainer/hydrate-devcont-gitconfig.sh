#!/usr/bin/env bash
set -eu

# Hydrates devcontainer global git config with dumped host git config.
# Written by @stewartadam on GitHub
# https://github.com/microsoft/vscode-remote-release/issues/2084#issuecomment-2289987894
TMP_DIR=tmp-gitconfig
for conf in .gitconfig.global .gitconfig.local; do
  if [ -f "$TMP_DIR/$conf" ]; then
    echo "*** Parsing ${conf##.gitconfig.} Git configuration export"
    while IFS='=' read -r key value; do
      case "$key" in
      user.name | user.email | user.signingkey | commit.gpgsign)
        echo "Set Git config ${key}=${value}"
        git config --global "$key" "$value"
        ;;
      esac
    done <"$TMP_DIR/$conf"
    rm -rf "$TMP_DIR"
  fi
done