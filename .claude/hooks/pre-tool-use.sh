#!/bin/bash
# Pre-Tool-Use Hook
# Validates Bash commands before execution
# Exit 0 = allow, Exit 2 = block

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only validate Bash commands
if [ "$TOOL_NAME" != "Bash" ]; then
  exit 0
fi

COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Block dangerous destructive commands
BLOCKED_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "dd if=/dev/zero"
  "> /dev/sda"
  "mkfs\."
  "git push --force origin main"
  "git push --force origin master"
  "git reset --hard HEAD~[0-9]"
  "DROP TABLE"
  "DROP DATABASE"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qE "$pattern"; then
    echo "BLOCKED: Command matches dangerous pattern '$pattern'" >&2
    echo "Command was: $COMMAND" >&2
    exit 2
  fi
done

# Warn on potentially risky commands (but allow)
WARN_PATTERNS=(
  "chmod 777"
  "sudo "
  "curl.*\| bash"
  "wget.*\| bash"
)

for pattern in "${WARN_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qE "$pattern"; then
    echo "WARNING: Risky pattern detected: '$pattern' in command: $COMMAND" >&2
  fi
done

exit 0
