#!/usr/bin/env bash

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd="${cwd/#$home/~}"

# Git branch and diff size
git_part=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    diff_stats=$(git -C "$cwd" diff --numstat 2>/dev/null; git -C "$cwd" diff --cached --numstat 2>/dev/null)
    insertions=$(echo "$diff_stats" | awk '$1 != "-" {s+=$1} END {print s+0}')
    deletions=$(echo "$diff_stats" | awk '$2 != "-" {s+=$2} END {print s+0}')
    modified=$(echo "$diff_stats" | awk '$1 == "-" && $2 == "-" {c++} END {print c+0}')
    diff_str=""
    [ "$insertions" -gt 0 ] && diff_str+="\033[32m+${insertions}\033[0m "
    [ "$deletions"  -gt 0 ] && diff_str+="\033[31m-${deletions}\033[0m "
    [ "$modified"   -gt 0 ] && diff_str+="\033[33m~${modified}\033[0m "
    diff_str="${diff_str% }"
    if [ -n "$diff_str" ]; then
      git_part="$branch ${diff_str}"
    else
      git_part="$branch"
    fi
  fi
fi

# Context usage with progress bar
[ -z "$used" ] || [ "$used" = "null" ] && used="0"
printf -v used_int "%.0f" "$used"
filled=$(( used_int * 10 / 100 ))
[ "$filled" -gt 10 ] && filled=10
empty=$(( 10 - filled ))
if [ "$used_int" -ge 80 ]; then
  color="\033[31m"; battery_icon=$(python3 -c "import sys; sys.stdout.write('\uf244')")
elif [ "$used_int" -ge 50 ]; then
  color="\033[33m"; battery_icon=$(python3 -c "import sys; sys.stdout.write('\uf242')")
else
  color="\033[32m"; battery_icon=$(python3 -c "import sys; sys.stdout.write('\uf240')")
fi
reset="\033[0m"
bar=""
for ((i=0; i<filled; i++)); do bar+="█"; done
for ((i=0; i<empty;  i++)); do bar+="░"; done
ctx_part="${battery_icon} ${color}${bar}${reset} ${used_int}%"

# Assemble parts
parts=()
icon_folder=$(python3 -c "import sys; sys.stdout.write('\uf07b')")
icon_branch=$(python3 -c "import sys; sys.stdout.write('\ue725')")
icon_model=$(python3 -c "import sys; sys.stdout.write('\uf489')")
parts+=("${icon_folder} ${short_cwd}")
[ -n "$git_part" ] && parts+=("${icon_branch} ${git_part}")

parts2=()
[ -n "$ctx_part" ] && parts2+=("$ctx_part")
[ -n "$model" ]    && parts2+=("${icon_model} ${model}")

line1=""
for i in "${!parts[@]}"; do
  [ $i -gt 0 ] && line1+=" | "
  line1+="${parts[$i]}"
done

line2=""
for i in "${!parts2[@]}"; do
  [ $i -gt 0 ] && line2+=" | "
  line2+="${parts2[$i]}"
done

result="$line2"
[ -n "$line1" ] && result+="\n\n${line1}"
printf "%b" "$result"
