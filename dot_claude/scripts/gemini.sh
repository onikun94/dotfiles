#!/bin/bash

echo "Current working directory: $(pwd)"

git_root=$(git rev-parse --show-toplevel 2>/dev/null)
if [ $? -eq 0 ] && [ "$git_root" != "$(pwd)" ]; then
    echo "Moving to Git repository root: $git_root"
    cd "$git_root"
fi

modified=$(git diff --name-only --diff-filter=M)
added=$(git diff --cached --name-only --diff-filter=A)
untracked=$(git ls-files --others --exclude-standard)

files=$(echo -e "$modified\n$added\n$untracked" | sort -u)

if [ -z "$files" ]; then
    echo "No files with changes found."
    exit 0
fi

mkdir -p .claude/output

for file in $files; do
    echo "Processing: $file"
    output_dir=".claude/output/$(dirname "$file")"
    mkdir -p "$output_dir"
    output_file="$output_dir/$(basename "${file%.md}_out.md")"
    
    if echo "$modified" | grep -q "^$file$"; then
        git diff "$file" | gemini -p "この差分の変更内容を説明して" > "$output_file"
    else
        gemini -p "このファイルの内容を説明して" < "$file" > "$output_file"
    fi
done
