#!/bin/zsh

#
# Zoomer Shell
# ~/.config/zsh/.zshrc
# @Focus172
#

#--------------------------------------------------------------------------------
#	▒███████▒  ██████  ██░ ██     ▄████▄   ▒█████   ███▄    █   █████▒██▓  ▄████  #
#	▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒   ▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █ ▓██   ▒▓██▒ ██▒ ▀█▒ #
#	░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░   ▒▓█    ▄ ▒██░  ██▒▓██  ▀█ ██▒▒████ ░▒██▒▒██░▄▄▄░ #
#	  ▄▀▒   ░  ▒   ██▒░▓█ ░██    ▒▓▓▄ ▄██▒▒██   ██░▓██▒  ▐▌██▒░▓█▒  ░░██░░▓█  ██▓ #
#	▒███████▒▒██████▒▒░▓█▒░██▓   ▒ ▓███▀ ░░ ████▓▒░▒██░   ▓██░░▒█░   ░██░░▒▓███▀▒ #
#	░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒   ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒ ░   ░▓   ░▒   ▒  #
#	░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░     ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░      ▒ ░  ░   ░  #
#	░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░   ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░    ▒ ░░ ░   ░  #
#	  ░ ░          ░   ░  ░  ░   ░ ░          ░ ░           ░         ░        ░  #
#	░                            ░                                                #
#---------------------------Stolen From: @rxyhn----------------------------------


# adds colors if in tty
source /home/focus/.config/zsh/tty.sh

source /home/focus/.config/zsh/aliases.sh

source "/home/focus/.config/zsh/functions.sh"

# Todo: find out what this does
#source /etc/inputrc

set editing-mode vi
#$if mode=vi

#set show-mode-in-prompt on
#set vi-ins-mode-string \1\e[6 q\2
#set vi-cmd-mode-string \1\e[2 q\2

#set keymap vi-command
# these are for vi-command mode
#Control-l: clear-screen
#Control-a: beginning-of-line


#$endif

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#setopt autocd		# Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.
#setopt interactive_comments

# History in cache directory:
HISTSIZE=10000
SAVEHIST=20000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"


# vi mode
#bindkey -v
#export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
# function zle-keymap-select () {
#     case $KEYMAP in
#         vicmd) echo -ne '\e[1 q';;      # block
#         viins|main) echo -ne '\e[5 q';; # beam
#     esac
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o

# ********** The Binding of  **********
bindkey -s '^o' '^ulfcd\n'
bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

# bindkey '^[[P' delete-char

# # Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line
# bindkey -M vicmd '^[[P' vi-delete-char
# bindkey -M vicmd '^e' edit-command-line
# bindkey -M visual '^[[P' vi-delete

# Load syntax highlighting; should be last.
#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null


# completion cache path setup
# typeset -g comppath="$HOME/.cache"
# typeset -g compfile="$comppath/.zcompdump"

# if [[ -d "$comppath" ]]; then
# 	[[ -w "$compfile" ]] || rm -rf "$compfile" >/dev/null 2>&1
# else
# 	mkdir -p "$comppath"
# fi

# ---| zsh Internal Stuff |--- #


# Show top 21 Commands used (thanks totoro
#toppy() {
#        history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
#}

# cd and ls after
cd() {
	builtin cd "$@" && ls 
}


# Lang
#export LANG=en_US.UTF-8

# completion
#setopt CORRECT
#setopt NO_NOMATCH
#setopt LIST_PACKED
#setopt ALWAYS_TO_END
#setopt GLOB_COMPLETE
#setopt COMPLETE_ALIASES
#setopt COMPLETE_IN_WORD

# job control
#setopt AUTO_CONTINUE
#setopt LONG_LIST_JOBS

# history control
#setopt HIST_VERIFY
#setopt SHARE_HISTORY
#setopt HIST_IGNORE_SPACE
#setopt HIST_SAVE_NO_DUPS
#setopt HIST_IGNORE_ALL_DUPS

# misc
#setopt EXTENDED_GLOB
#setopt TRANSIENT_RPROMPT
#setopt INTERACTIVE_COMMENTS

#autoload -U compinit     # completion
#autoload -U terminfo     # terminfo keys
#zmodload -i zsh/complist # menu completion
#autoload -U promptinit   # prompt

# better history navigation, matching currently typed text
#autoload -U up-line-or-beginning-search; zle -N up-line-or-beginning-search
#autoload -U down-line-or-beginning-search; zle -N down-line-or-beginning-search

# set the terminal mode when entering or exiting zle, otherwise terminfo keys are not loaded
#if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#	zle-line-init() { echoti smkx; }; zle -N zle-line-init
#	zle-line-finish() { echoti rmkx; }; zle -N zle-line-finish
#fi

# initialize completion

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# fzf source
#source /usr/share/fzf/key-bindings.zsh


# alias for making a directory and cd to it

# ---------------P R O M P T------------------


# Other program settings:
export SUDO_ASKPASS="$HOME/.config/scripts/askpass"
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
#export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.


#alias startw="wpa supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf"
#[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && setsid shortcuts >/dev/null 2>&1


# Switch escape and caps if tty and no passwd required:
#sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null


# allows broot to cd into places




#export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '

export FZF_DEFAULT_OPTS='
        --color hl:#dadada,hl+:#13171b,gutter:#13171b
        --color bg+:#ef7d7d,fg+:#2c2f30
        --color pointer:#373d49,info:#606672
        --height 13'

# --color fg:#b6beca,bg:#13171b
# --border
# --color border:#13171b


#export FZF_CTRL_R_OPTS="
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"

source "/home/focus/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


