#
# $ZDOTDIR/init.zsh
# This file is source by ~/.zshenv and is just a version controlled init
#


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"


export PATH="$PATH:$HOME/.local/bin:$HOME/.config/scripts:$XDG_DATA_HOME/cargo/bin"

#export BROWSER=""

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Once config is done we can set our shell to prefered fish
export SHELL=$(which fish)
