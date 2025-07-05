#!/bin/bash

modified=$(git diff --name-only --diff-filter=M)
added=$(git diff --cached --name-only --diff-filter=A)
untracked=$(git ls-files --others --exclude-standard)

files=$(echo -e "$modified\n$added\n$untracked" | sort -u)

if [ -z "$files" ]; then
    echo "No files with changes found."
    exit 0
fi

for file in $files; do
    echo "Processing: $file"
    gemini -p "Geminiのプロンプト"
done
