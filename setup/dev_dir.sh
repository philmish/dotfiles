#!/usr/bin/env bash

DEVDIR="$HOME/dev"

mkdir -p $DEVDIR/{dap,php}

cd $DEVDIR/dap
mkdir -p debugpy && cd debugpy
python -m venv debugpy && debugpy/bin/python -m pip install debugpy


