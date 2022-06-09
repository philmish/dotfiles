#!/usr/bin/bash

selected=`ls ~/Wallpapers | fzf`
`feh --bg-scale ~/Wallpapers/$selected`
