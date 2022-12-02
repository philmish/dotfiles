#!/bin/bash

# VARS

DIRS=(/code/repos /code/poc /code/work /Wallpaper /fonts)

# UTILS

get_package_manager() {
    declare -A osInfo;
    osInfo[/etc/arch-release]=pacman
    osInfo[/etc/debian_version]=apt
    osInfo[/etc/alpine-release]=apk
    osInfo[/etc/redhat-release]=yum

    for f in ${!osInfo[@]}
    do
        if [[ -f $f ]]; then
            PKG=${osInfo[$f]}
        fi
    done
}

create_dirs() {
    for i in "${DIRS[@]}"
    do
        mkdir -p $HOME/$i
        echo `Created dir -> $i`
    done
}
