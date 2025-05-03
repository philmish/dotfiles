#!/usr/bin/bash

if [[ -z $(pgrep tmux) ]]; then
    echo "Tmux Server is not running, no sessions to connect to."
    exit 1
fi

selected=$(tmux list-sessions | fzf)

if [[ -z $selected ]]; then
    echo "No session to open selected."
    exit 1
fi
name=$(echo "$selected" | awk -F: '{print $1}')
tmux attach-session -t "$name"
