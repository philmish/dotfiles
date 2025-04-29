#!/usr/bin/bash

WP_DIR="~/wallpapers"

while getopts d: flag
do
    case "${flag}" in
        d) WP_DIR=${OPTARG};;
    esac
done

if ! command -v feh &> /dev/null
then
	echo "feh is not installed"
	exit 1
fi

if [ ! -d "$WP_DIR" ]
then
	echo "Wallpaper directory $WP_DIR is not a directory"
	exit 1
fi

selected=`ls $WP_DIR | fzf`
`feh --bg-scale $WP_DIR/$selected`
