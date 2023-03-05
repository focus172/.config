#
# config.fish
#

# set path
set -g PATH "$PATH:/Users/evanstokdyk/.local/bin:/Users/evanstokdyk/.pub-cache/bin:/Users/evanstokdyk/.local/flutter/bin:/Users/evanstokdyk/.cargo/bin"
set -g EDITOR "$(which nvim)"

# add things as vars needed for stuff only on mac
if string match -q "/Users/evanstokdyk" $HOME
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # echo is does not match
end

# don't write dumb files
export LESSHISTFILE="/dev/null"
set -g fish_greeting ""

if status is-interactive

  # Start starship
  eval "$(starship init fish)"
  
  # Alias things
  alias home="cd ~"
  alias ..="cd .."
  alias c="clear"
  alias ls="ls -A --color=tty"
  alias land="cat ~/.config/george.txt"
  alias nnn="nnn -H"
  alias startw="exec dbus-run-session sway"

  # math shit
  alias math="math \"$1\""

  # Creating Diced CLI
  # alias diced="kotlinc -script /Users/evanstokdyk/code/Diced/Diced.kts# Commands to run in interactive sessions can go here
end

