#!/usr/bin/bash

interup () {
    exit 1
}

trap interup INT

selected=$(tmux list-sessions | fzf)
name=$(echo "$selected" | awk -F: '{print $1}')
`tmux attach-session -t "$name"`
