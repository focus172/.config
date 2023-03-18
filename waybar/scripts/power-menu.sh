#!/bin/bash

entries="Cancel Logout Suspend Reboot Shutdown"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/power_off_config --style=$HOME/.config/wofi/widget_style.css | awk '{print tolower($1)}')

case $selected in
  cancel)
    ;;
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
