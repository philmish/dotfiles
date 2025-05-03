#!/usr/bin/bash

selected=$(find ~/projects/public ~/projects/private  ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected ]]; then
    echo "No directory selected to create a session from."
    exit 1
fi

name=$(echo "$selected" | rev | cut -d "/" -f1 | rev | tr . _)
tmux_running=$(pgrep tmux)
if [[ -z tmux_running ]]; then
    tmux new-session -s $name -c $selected
    exit 0
fi

if ! tmux has-session -t $name 2>/dev/null; then
    tmux new-session -ds $name -c $selected
else
    tmux attach-session -t $name
fi
