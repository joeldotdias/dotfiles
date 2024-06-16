#!/usr/bin/env bash

killall waybar
pkill waybar
sleep 0.5

waybar -c "${HOME}/.config/waybar/config.jsonc" -s "${HOME}/.config/waybar/styles.css"
