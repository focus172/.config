#
# $ZDOTDIR/init.zsh
# This file is source by ~/.zshenv and is just a version controlled init
#


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$PATH:$HOME/.local/bin:$HOME/.config/scripts:$XDG_DATA_HOME/cargo/bin"

# this is set at the start so if I fuck up other things then I still have a shell
#export SHELL=$(which fish)

export LESSHISTFILE=-

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export npm_config_prefix="$XDG_DATA_HOME/npm"

# Once config is done we can set our shell to prefered fish

#export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
#export SUDO_ASKPASS="zenity"
export XDG_DESKTOP_DIR="$HOME/current"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"
#export XDG_PUBLICSHARE_DIR="$HOME"


export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="foot"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="feh"
#export COLORTERM="truecolor"
export OPENER="handlr open"
export PAGER="less"
export WM="Hyprland"
export MANPAGER='less'
export XDG_CURRENT_DESKTOP='Hyprland'

