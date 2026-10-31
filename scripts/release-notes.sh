#!/usr/bin/env bash
# Формує нотатки релізу з закритих задач указаного milestone, згрупованих за типом
set -euo pipefail
milestone="${1:?вкажіть назву milestone}"
echo "## Що увійшло до релізу ($milestone)"
gh issue list --state closed --milestone "$milestone" --limit 200 \
  --json number,title,labels \
  --jq '.[] | (if any(.labels[]; .name == "bug") then "Виправлено" elif any(.labels[]; .name == "documentation") then "Документація" else "Нове" end) as $t | "- **\($t):** \(.title) (#\(.number))"' </dev/null
