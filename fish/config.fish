# set path
export PATH="$PATH:/Users/evanstokdyk/.local/bin:/Users/evanstokdyk/.pub-cache/bin:/Users/evanstokdyk/.local/flutter/bin:/Users/evanstokdyk/.cargo/bin"


# add things as vars needed for stuff
eval "$(/opt/homebrew/bin/brew shellenv)"
/bin/sh ~/.cargo/env
export XDG_CONFIG_HOME="~/.config"

# don't write dumb files
export LESSHISTFILE="/dev/null"
set -g fish_greeting ""




if status is-interactive

  # Start starship
  # eval "$(starship init fish)"
  

  # Alias things
  alias home="cd ~"
  alias ..="cd .."
  alias c="clear"
  alias ls="ls --color=tty"


  # Start starship
  # eval "$(starship init fish)"


  # Creating Diced CLI
  # alias diced="kotlinc -script /Users/evanstokdyk/code/Diced/Diced.kts# Commands to run in interactive sessions can go here

end



