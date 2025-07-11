#!/usr/bin/env bash

shutdown=""
lock=""
logout=""
reboot=""
sleep=""

selected_option=$(echo "$shutdown
$lock
$reboot
$logout
$sleep" | rofi -dmenu -i -p "Power" \
    -theme "$XDG_CONFIG_HOME/rofi/power-theme.rasi")

if [ "$selected_option" == "$lock" ]; then
    hyprlock --immediate
elif [ "$selected_option" == "$logout" ]; then
    loginctl terminate-user "$(whoami)"
elif [ "$selected_option" == "$shutdown" ]; then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]; then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]; then
    systemctl suspend
fi
