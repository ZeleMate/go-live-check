#!/usr/bin/env bash
# PostToolUse hook: format the file Claude just edited. Never blocks (always exits 0).
set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0
file=$(jq -r '.tool_input.file_path // empty')
[ -n "$file" ] && [ -f "$file" ] || exit 0
root="${CLAUDE_PROJECT_DIR:-.}"

case "$file" in
  *.py)
    uv run --project "$root/python" --no-sync ruff format --quiet "$file" >/dev/null 2>&1
    uv run --project "$root/python" --no-sync ruff check --fix --quiet "$file" >/dev/null 2>&1
    ;;
  *.go)
    if command -v golangci-lint >/dev/null 2>&1; then
      golangci-lint fmt --config "$root/go/.golangci.yml" "$file" >/dev/null 2>&1
    else
      gofmt -w "$file" >/dev/null 2>&1  # one of the configured formatters, minus import grouping
    fi
    ;;
esac
exit 0
