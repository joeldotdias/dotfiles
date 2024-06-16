#!/usr/bin/env bash

if pgrep -x Hyprland >/dev/null; then
    hyprctl dispatch exit
    sleep 2

    # if hyprland didn't close force kill it
    if pgrep -x Hyprland >/dev/null; then
        killall -9 Hyprland
    fi
fi
