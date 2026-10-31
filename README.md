# gh-cli-research

Дослідження автоматизації роботи з GitHub через GitHub CLI (`gh`) без відкриття браузера.
Самостійна робота з дисципліни «Проєктний практикум», Крайняк Михайло, група 451.

## Корисні команди gh

| Задача | Команда |
|---|---|
| Створити репозиторій | `gh repo create NAME --public --clone` |
| Створити мітку | `gh label create NAME --color HEX` |
| Створити задачу | `gh issue create --title T --label L --milestone M` |
| Задачі у JSON | `gh issue list --json number,title --jq '.[]'` |
| Створити PR | `gh pr create --title T --body "Closes #N"` |
| Злити PR | `gh pr merge N --squash --delete-branch` |
| Довільний запит до API | `gh api repos/{owner}/{repo}/milestones` |
| Реліз | `gh release create v0.1.0 -F notes.md` |

## Склад репозиторію

- `scripts/create-issues.sh` — пакетне створення задач з TSV-файлу;
- `scripts/release-notes.sh` — нотатки релізу із закритих задач milestone;
- `gh-issue-report/` — розширення `gh issue-report`.
