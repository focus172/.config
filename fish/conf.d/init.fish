# This file is ran on all fish shells but only does anything on login shells 

if status --is-login 
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_CACHE_HOME="$HOME/.cache"
    

    export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts:$XDG_DATA_HOME/cargo/bin:$HOME/.config/scripts"
    # export SHELL=$(which fish)

    export LESSHISTFILE=-

    export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
    export CARGO_HOME="$XDG_DATA_HOME/cargo"
    export GNUPGHOME="$XDG_DATA_HOME/gnupg"
    export npm_config_prefix="$XDG_DATA_HOME/npm"

    #export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
    #export SUDO_ASKPASS="zenity"
    export XDG_DESKTOP_DIR="$HOME/current"
    export XDG_DOCUMENTS_DIR="$HOME/docs"
    export XDG_DOWNLOAD_DIR="$HOME/dl"
    export XDG_MUSIC_DIR="$HOME/aud/music"
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
    export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
end
