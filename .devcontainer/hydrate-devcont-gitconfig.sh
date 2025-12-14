#!/usr/bin/env bash
set -eu

# Hydrates devcontainer global git config with dumped host git config.
# Written by @stewartadam on GitHub
# https://github.com/microsoft/vscode-remote-release/issues/2084#issuecomment-2289987894
# The reason to use this rather than simply mounting host config files is that my personal
# global git config uses the includeIf directive in the usual way (referring to a parent
# directory on the host), which doesn't port well to devcontainers.
TMP_DIR=tmp-gitconfig
for conf in .gitconfig.global .gitconfig.local; do
  if [ -f "$TMP_DIR/$conf" ]; then
    echo "*** Parsing ${conf##.gitconfig.} Git configuration export"
    while IFS='=' read -r key value; do
        echo "Set Git config ${key}=${value}"
        git config --global "$key" "$value"
    done <"$TMP_DIR/$conf"
    rm -rf "$TMP_DIR"
  fi
done