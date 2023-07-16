# This file is ran on all fish shells but only does anything on login shells 

set -q __init_config_sourced; and exit
set -g __init_config_sourced 1

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# export SHELL=$(which fish)

export LESSHISTFILE=-

set -g RUSTUP_HOME "$XDG_DATA_HOME/rustup"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
set -g CARGO_HOME "$XDG_DATA_HOME/cargo"
set -g GNUPGHOME "$XDG_DATA_HOME/gnupg"
# export npm_config_prefix="$XDG_DATA_HOME/npm"

export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/.config/scripts"
export PATH="$PATH:$HOME/.local/share/go/bin/"

# set -g PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass"

export XDG_DESKTOP_DIR="$HOME/cur"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_MUSIC_DIR="$HOME/aud"
export XDG_PICTURES_DIR="$HOME/pix"
#export XDG_PUBLICSHARE_DIR="$HOME"

export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="foot"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="imv"
export OPENER="handlr open"
export PAGER="less"
export WM="Hyprland"
export MANPAGER='less'
export XDG_CURRENT_DESKTOP='Hyprland'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

if string match Darwin (uname) >/dev/null
    export PATH="$PATH:/opt/homebrew/opt/coreutils/libexec/gnubin"
end

