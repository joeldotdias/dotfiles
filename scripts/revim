#!/usr/bin/bash

NVIMDIR=~/.local/share/nvim

if [ -d "$NVIMDIR" ]; then
    echo "Clearing Neovim..."
    rm -rf "$NVIMDIR"
else
    echo "$NVIMDIR does not exist"
fi

# Open nvim to reload everything
nvim .
