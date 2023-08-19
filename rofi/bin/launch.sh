# style=$(ls ~/.config/rofi/launch | shuf | head -n 1)
style="style-6.rasi"
path=$(echo "$HOME/.config/rofi/launch/$style")

rofi \
	-show drun \
	-theme "$path"
