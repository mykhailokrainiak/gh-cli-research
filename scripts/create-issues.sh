#!/usr/bin/env bash
# Створює задачі з файлу issues.tsv (назва<TAB>мітки) і прив'язує їх до milestone "v0.1 MVP"
set -euo pipefail
file="${1:-scripts/issues.tsv}"
while IFS=$'\t' read -r title labels; do
  [ -z "$title" ] && continue
  gh issue create --title "$title" --body "Створено скриптом create-issues.sh" \
    --label "$labels" --milestone "v0.1 MVP" --assignee @me
done < "$file"
