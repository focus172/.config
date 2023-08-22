# TODO: have this only ran once on shell init

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE=-

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/.config/scripts"
# export PATH="$PATH:$HOME/.local/share/go/bin/"

## MACOS ONNLY
# export XDG_DESKTOP_DIR="$HOME/Desktop"
# export XDG_DOCUMENTS_DIR="$HOME/Documents"
# export XDG_DOWNLOAD_DIR="$HOME/Downloads"
# export XDG_MUSIC_DIR="$HOME/Music"
# export XDG_PICTURES_DIR="$HOME/Pictures"
# export PATH="$PATH:/opt/homebrew/opt/coreutils/libexec/gnubin"

export XDG_DESKTOP_DIR="$HOME/cur"
export XDG_DOCUMENTS_DIR="$HOME/dox"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_MUSIC_DIR="$HOME/aud"
export XDG_PICTURES_DIR="$HOME/pix"
export XDG_PUBLICSHARE_DIR="$HOME"

export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="imv"
export OPENER="handlr open"
# export PAGER="less"
export WM="Hyprland"
# export MANPAGER='less'
# export XDG_CURRENT_DESKTOP='Hyprland'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|clear)"

