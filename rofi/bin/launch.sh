#!/bin/sh

style=$(ls ~/.config/rofi/launch | shuf | head -n 1)
path=$(echo "$HOME/.config/rofi/launch/$style")

rofi \
	-show drun \
    -matching fuzzy \
	-theme "$path"
