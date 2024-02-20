#!/bin/sh

dir="$HOME/.config/rofi/power/"
theme=$(ls ~/.config/rofi/power | shuf | head -n 1)

# CMDs
lastlogin="$(last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7)"
uptime="$(uptime | awk '{ print $3 }' | sed -e 's/,//g')"
host=$(hostname)

cmds="\
X kill window,     hyprctl kill
 lock hypr,       swaylock -eFfki ~/pic/wallpaper/nasaGrey.png
 leave hypr,      pkill Hyprland 
⏾ hibernate,       ${hib:-systemctl suspend-then-hibernate -i}
 reboot,          ${reb:-sudo -A reboot}
⏻ shutdown,        ${shut:-sudo -A shutdown -h now}"

# Options
hibernate=''
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "X Goodbye: $USER@$host" \
		-mesg " Uptime: $uptime" \
		-theme ${dir}/${theme}
}

# Confirmation CMD
confirm_cmd() {
	rofi \
		-theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}

	# rofi -dmenu \
	# 	-p 'Confirmation' \
	# 	-mesg 'Are you Sure?' \
	# 	-theme ${dir}/shared/confirm.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--hibernate' ]]; then
			systemctl hibernate
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			hyprctl exit
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
	run_cmd --shutdown
	;;
$reboot)
	run_cmd --reboot
	;;
$hibernate)
	run_cmd --hibernate
	;;
$lock)
	# swaylock
	;;
$suspend)
	run_cmd --suspend
	;;
$logout)
	run_cmd --logout
	;;
esac
