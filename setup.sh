#!/bin/bash

# VARS

DIRS=(/code/repos /code/poc /code/work /Wallpaper /fonts)


# UTILS

create_dirs() {
    for i in "${DIRS[@]}"
    do
        mkdir -p $HOME/$i
        echo `Created dir -> $i`
    done
}
