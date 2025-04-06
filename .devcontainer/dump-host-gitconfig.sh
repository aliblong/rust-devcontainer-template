#!/usr/bin/env bash
set -eu

# Dumps host git config in workspace dir, where the devcontainer can access it
TMP_DIR=tmp-gitconfig
mkdir -p "$TMP_DIR"
git config -l --global --include > "$TMP_DIR/.gitconfig.global"
git config -l --local --include > "$TMP_DIR/.gitconfig.local"