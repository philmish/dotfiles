#!/usr/bin/bash

interup () {
    exit 1
}

trap interup INT

if [[ -z $(pgrep tmux) ]]; then
    echo "Tmux Server is not running, no sessions to connect to."
    exit 1
fi

selected=$(tmux list-sessions | fzf)
name=$(echo "$selected" | awk -F: '{print $1}')
tmux attach-session -t "$name"
