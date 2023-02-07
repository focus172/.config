
# set path
set -gx PATH "$PATH:Users/evanstokdyk/.local/bin:Users/evanstokdyk/.pub-cache/bin:Users/evanstokdyk/.local/flutter/bin"
set -gx PATH "$PATH:/opt/homebrew/bin:User/evanstokdyk/.cargo/env"


eval "$(/opt/homebrew/bin/brew shellenv)"

/bin/sh ~/.cargo/env

if status is-interactive

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
