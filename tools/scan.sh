#!/usr/bin/env bash
set -euo pipefail
echo "== Repo hygiene =="
echo "Untracked files:"; git ls-files --others --exclude-standard
echo; echo "Modified files:"; git status --porcelain
echo; echo "Recent branches:"; git branch --sort=-committerdate | head -n 10
