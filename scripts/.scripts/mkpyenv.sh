#!/bin/bash

while getopts n:d:r: flag
do
    case "${flag}" in
        n) name=${OPTARG};;
        d) directory=${OPTARG};;
        r) requirements=${OPTARG};;
    esac
done

if [ -z "$name" ] || [ -z "$directory" ];
    then
        echo "Please provide a directory and a environment name"
        exit 1
fi

if [ "$directory" == '.' ];
    then
        dir=$(pwd)/$name
    else
            dir=$(pwd)/$directory/$name
fi

function make {
    python3 -m venv $dir
}

make;
source $dir/bin/activate;
pip install --upgrade pip

if [ ! -z "$requirements" ];
then
    pip install -r $requirements;

fi
