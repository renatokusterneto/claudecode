#!/bin/bash
# Session Start Hook
# Injects project context at the start of every Claude Code session

PROJECT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'unknown')"
UNCOMMITTED="$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')"
LAST_COMMIT="$(git log --oneline -1 2>/dev/null || echo 'no commits')"

cat <<EOF
=== Session Context ===
Branch:      $BRANCH
Last commit: $LAST_COMMIT
Dirty files: $UNCOMMITTED

Available agents:  code-reviewer, debugger, planner, security-reviewer
Available skills:  /code-review, /test-gen, /debug, /docs, /refactor, /security-audit, /pr-description
======================
EOF
