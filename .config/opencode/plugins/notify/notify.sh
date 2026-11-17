#!/bin/bash
# Windows toast via WSL, same mechanism as ~/.claude/notify.sh. Usage: notify.sh [title] [message]
title="${1:-opencode}"
msg="${2:-Aguardando sua interação!}"
# Single quotes would break out of the PowerShell string.
pwsh.exe -Command "New-BurntToastNotification -Text '${title//\'/}', '${msg//\'/}'"
