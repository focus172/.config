#
# config.fish
#

# don't write dumb files
export LESSHISTFILE="/dev/null"
set -g fish_greeting ""

if status is-interactive

    if string match -q "Darwin" $(uname)
        set -g PATH "$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/scripts"
        eval "$(/opt/homebrew/bin/brew shellenv)"
   
    else
#  	set -g PATH "$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/scripts"
	export RUSTC_WRAPPER=$(which sccache)

        alias starts="exec dbus-run-session sway" 
        alias starth="exec dbus-run-session Hyprland"
  
    end

    # Set global variables
    # set -g EDITOR "$(which nvim)"
    
    # Start starship
    eval "$(starship init fish)"

    # Alias things
    alias home="cd ~"
    alias ..="cd .."
    alias c="clear"
    alias ls="exa -a"
    alias land="cat ~/.config/assets/george.txt"
    alias hgrep="history | grep"

    # math shit
    alias math="math \"$1\""

end
