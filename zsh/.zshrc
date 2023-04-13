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


if [ $(uname) = "Darwin" ]; then
		# run mac stuff
		source /Users/evanstokdyk/.config/zsh/mac.zsh
else
		# run linux stuff
		source /home/focus/.config/zsh/linux.zsh
fi

# adds colors if in tty
source /home/focus/.config/zsh/tty.sh

# Use neovim for vim if present.
# [ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"


#se() {
#	choice="$(find ~/.local/bin -mindepth 1 -printf '%P\n' | fzf)"
#	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
#	;}


# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	rsync="rsync -vrPlu" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ytt="yt --skip-download --write-thumbnail" \
	ffmpeg="ffmpeg -hide_banner" \
	..="cd .."

# Colorize commands when possible.
alias \
	l="exa -a --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="pacman" \
	xi="sudo xbps-install" \
	xr="sudo xbps-remove -R" \
	xq="xbps-query" \
	z="zathura" \
	icat="kitten icat"


alias \
	magit="nvim -c MagitOnly" \
	ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"\
	git="gix"


# source /etc/inputrc
#set editing-mode vi
#$if mode=vi

#set show-mode-in-prompt on
#set vi-ins-mode-string \1\e[6 q\2
#set vi-cmd-mode-string \1\e[2 q\2

#set keymap vi-command
# these are for vi-command mode
#Control-l: clear-screen
#Control-a: beginning-of-line

#set keymap vi-insert
# these are for vi-insert mode
#Control-l: clear-screen
#Control-a: beginning-of-line

#$endif


# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Prompt
# source <(starship init zsh --print-full-init)

#setopt autocd		# Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.
#setopt interactive_comments

# History in cache directory:
HISTSIZE=10000
SAVEHIST=20000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Load aliases and shortcuts if existent.
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
#autoload -U compinit
#zstyle ':completion:*' menu select
#zmodload zsh/complist
#compinit
#_comp_options+=(globdots)		# Include hidden files.

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

# # Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp -uq)"
#     trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' '^ulfcd\n'

# bindkey -s '^a' '^ubc -lq\n'

# bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

# bindkey '^[[P' delete-char

# # Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line
# bindkey -M vicmd '^[[P' vi-delete-char
# bindkey -M vicmd '^e' edit-command-line
# bindkey -M visual '^[[P' vi-delete

# Load syntax highlighting; should be last.
#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null




# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# if not running interactivly return

# completion cache path setup
# typeset -g comppath="$HOME/.cache"
# typeset -g compfile="$comppath/.zcompdump"

# if [[ -d "$comppath" ]]; then
# 	[[ -w "$compfile" ]] || rm -rf "$compfile" >/dev/null 2>&1
# else
# 	mkdir -p "$comppath"
# fi

# ---| zsh Internal Stuff |--- #
#SHELL=$(which zsh || echo '/bin/zsh')



# Show top 21 Commands used (thanks totoro
#toppy() {
#    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
#}

# cd and ls after
cd() {
	builtin cd "$@" && l 
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

# ---| Correction  and Autocompletion |--- #
#zstyle ':completion:*:correct:*' original true
#zstyle ':completion:*:correct:*' insert-unambiguous true
#zstyle ':completion:*:approximate:*' max-errors 'reply=($(( ($#PREFIX + $#SUFFIX) / 3 )) numeric)'

# completion
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path "$comppath"
#zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose true
#zstyle ':completion:*' insert-tab false
#zstyle ':completion:*' accept-exact '*(N)'
#zstyle ':completion:*' squeeze-slashes true
#zstyle ':completion:*:*:*:*:*' menu select
#zstyle ':completion:*:match:*' original only
###zstyle ':completion:*:-command-:*:' verbose false
#zstyle ':completion::complete:*' gain-privileges 1
#zstyle ':completion:*:manuals.*' insert-sections true
#zstyle ':completion:*:manuals' separate-sections true
#zstyle ':completion:*' completer _complete _match _approximate _ignored
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# labels and categories
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:matches' group 'yes'
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:options' auto-description '%d'
#zstyle ':completion:*:default' list-prompt '%S%M matches%s'
#zstyle ':completion:*' format ' %F{green}->%F{yellow} %d%f'
#zstyle ':completion:*:messages' format ' %F{green}->%F{purple} %d%f'
#zstyle ':completion:*:descriptions' format ' %F{green}->%F{yellow} %d%f'
#zstyle ':completion:*:warnings' format ' %F{green}->%F{red} no matches%f'
#zstyle ':completion:*:corrections' format ' %F{green}->%F{green} %d: %e%f'

# menu colours
#eval "$(dircolors)"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=36=0=01'

# command parameters
#zstyle ':completion:*:functions' ignored-patterns '(prompt*|_*|*precmd*|*preexec*)'
#zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
#zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
#zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
#zstyle ':completion:*:(vim|nvim|vi|nano):*' ignored-patterns '*.(wav|mp3|flac|ogg|mp4|avi|mkv|iso|so|o|7z|zip|tar|gz|bz2|rar|deb|pkg|gzip|pdf|png|jpeg|jpg|gif)'

# hostnames and addresses
# zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
# zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
# zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
# zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
# zstyle -e ':completion:*:hosts' hosts 'reply=( ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ } ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*} ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}})'
# ttyctl -f

# # For tty
# if [ "$TERM" = "linux" ] ; then
#     echo -en "\e]P0232323"
# fi

# initialize completion
#compinit -u -d "$compfile"

# zsh auto suggestions and syntax highlighting and auto completion
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom Highlight syntax
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4C566A,underline"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="false"

# fzf source
#source /usr/share/fzf/key-bindings.zsh

###############################
# ****** ALIAS SECTION ****** #
###############################

# alias for making a directory and cd to it
mcd () {
    mkdir -p $1
    cd $1
}

# alias for searching through ps
#alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 
# alias for mkdir so that it makes required parent directory
#alias mkdir="mkdir -p"
# alias for ranger
#alias fm='ranger'
# alias for searching and installing packages
#alias pacs="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
# alias for searching and installing packages from AUR
#alias yays="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
# alias for searching and removing packages from system
#alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
# alias for searching packages from system
#alias p="pacman -Q | fzf"
# alias for wifi
#alias wifi="nmtui-connect"
# alias for grep
#alias grep='grep --color=auto'
# alias for Neovim
#alias v='nvim'
# alias for verbose cp, mv, rm
#alias mv='mv -v'
#alias cp='cp -vr'
#alias rm='rm -vr'
# alias for checking dunst
#alias dun='killall dunst && dunst &

# ---------------P R O M P T------------------
# Init Starship
#eval "$(starship init zsh)"
# Setup Starship custom prompt
#export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml


# Default programs:
#export EDITOR="nvim"
#export TERMINAL="st"
#export TERMINAL_PROG="st"
#export BROWSER="librewolf"

# Change the default crypto/weather monitor sites.
# export CRYPTOURL="rate.sx"
# export WTTRURL="wttr.in"

# ~/ Clean-up:
#export XDG_CONFIG_HOME="$HOME/.config"
#export XDG_DATA_HOME="$HOME/.local/share"
#export XDG_CACHE_HOME="$HOME/.cache"
#export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
#export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
#export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
#export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
#export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
#export GNUPGHOME="$XDG_DATA_HOME/gnupg"
#export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
#export KODI_DATA="$XDG_DATA_HOME/kodi"
#export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
#export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
#export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
#export CARGO_HOME="$XDG_DATA_HOME/cargo"
#export GOPATH="$XDG_DATA_HOME/go"
#export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
#export UNISON="$XDG_DATA_HOME/unison"
#export HISTFILE="$XDG_DATA_HOME/history"
#export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
#export ELECTRUMDIR="$XDG_DATA_HOME/electrum"

# Other program settings:
#export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.config/scripts/askpass"
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
#export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.
#export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.



#alias startw="wpa supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf"
#[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && setsid shortcuts >/dev/null 2>&1


# Switch escape and caps if tty and no passwd required:
#sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null

# export XDG_DATA_HOME="$HOME/.local/share"
#
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"




# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}





# Alias for commands I use often
# alias chad='startx ~/.config/chadwm/scripts/run.sh'
# alias sudo='doas'
alias v="nvim"
#alias rm="trash-put"
#alias ls='exa --color=auto --icons' # my preferred listing
#alias l='ls -l'
#alias la='ls -a'
#alias lla='ls -la'
#alias lt='ls --tree'
#alias svim='sudoedit'
alias gu="gitui"
#export TERM='xterm-256color'
#export EDITOR='nvim'
#export VISUAL='nvim'
# alias lf='lfrun'
#alias m='neomutt'
alias r='newsboat' 
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

#alias wgu="sudo wg-quick up nebula"
#alias wgd="sudo wg-quick down nebula"



alias gl='git clone'
#alias de='doasedit'


alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'

#export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '



# Cheat query
#cht() {
#    curl -s "cheat.sh/$(echo -n "$*" | jq -sRr @uri)"
#}

#lf () {
#    tmp="$(mktemp)"
#    # `command` is needed in case `lfcd` is aliased to `lf`
#    command lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp"
#        if [ -d "$dir" ]; then
#            if [ "$dir" != "$(pwd)" ]; then
#                cd "$dir"
#            fi
#        fi
#    fi
#}


bindkey '^f' lf


#export FZF_DEFAULT_OPTS='
#  --color fg:#b6beca,bg:#13171b
#  --color bg+:#ef7d7d,fg+:#2c2f30
#  --color hl:#dadada,hl+:#13171b,gutter:#13171b
#  --color pointer:#373d49,info:#606672
#  --border
#  --color border:#13171b
#  --height 13'

#export FZF_CTRL_R_OPTS="
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"


