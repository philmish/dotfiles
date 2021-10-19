#!/usr/bin/bash

selected=$(find ~/repos/github.com ~/repos/gitlab.com ~/repos/privat ~/repos/work ~/code_snippets ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
name=$(echo "$selected" | rev | cut -d "/" -f1 | rev | tr . _)

tmux_running=$(pgrep tmux)

if [[ -z tmux_running ]]; then
    tmux new-session -s $name -c $selected
    exit 0
fi

if ! tmux has-session -t $name 2>/dev/null; then
    tmux new-session -ds $name -c $selected
fi
