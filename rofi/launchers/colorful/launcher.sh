#!/usr/bin/env bash

theme="style_1"
dir="$HOME/.config/rofi/launchers/colorful"

# dark
ALPHA="#00000000"
BG="#000000ff"
FG="#FFFFFFff"
SELECT="#101010ff"

# accent colors
#COLORS=('#EC7875' '#61C766' '#FDD835' '#42A5F5' '#BA68C8' '#4DD0E1' '#00B19F' \
#		'#FBC02D' '#E57C46' '#AC8476' '#6D8895' '#EC407A' '#B9C244' '#6C77BB')
#ACCENT="${COLORS[$(( $RANDOM % 14 ))]}ff"


# comment these lines to disable random style
themes=($(ls -p --hide="launcher.sh" --hide="colors.rasi" $dir))
theme="${themes[$(( $RANDOM % 5 ))]}"

echo $theme

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"


