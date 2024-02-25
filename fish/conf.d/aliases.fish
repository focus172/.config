# Aliases
# see abbr.fish for a more full picture of my aliases

# Aliases
alias e nvim
alias exa 'eza '
alias i imv
alias it img2sixel

# file viewing
alias ls exa
alias la 'exa -a'
alias ll 'exa -l'
alias lla 'exa -la'
alias lt 'exa --tree --level=3'
alias lss="exa --group-directories-first --icons"
# alias l.='la | grep -E "^\."'

# alias land 'cat $HOME/.config/george.txt | cowsay -W 70'
# alias sdn 'shutdown -h now'

# core utils
alias cp="cp -ivr"
alias mv="mv -iv"
alias mkd="mkdir -pv"
alias cat="bat --plain --paging never --color auto"
alias bat="bat --color always --plain"


# yt-dl stuff
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt-dlp --embed-metadata -i -x -f bestaudio/best --audio-format vorbis"
alias ytt="yt-dlp --embed-metadata -i --skip-download --write-thumbnail"


alias ..="cd .."
alias cdf="cd (fd -t d . | fzf)"
alias wget="wget --hsts-file /dev/null"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias vdiff="nvim -d"

alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"


alias ka="killall"
alias g="gix"
# alias e="$EDITOR"
# alias v="$VISUAL"
# alias z="zathura"
# alias o="$OPENER"
alias m="mpv"
alias n='newsboat'

alias rm="rm -vI" # this cuases errors on busybox
alias nmutt='neomutt'

# root privileges
alias doas="doas --"
#alias sudo='doas'

alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'


# vim
alias vi="vim"
alias vim="nvim"


alias free='free -m'
alias lynx='lynx -vikeys'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'



# TODO: find out what this does
# source /etc/inputrc


# Use lf to switch directories and bind it to ctrl-o

# ********** The Binding of  **********
# bindkey -s '^o' '^ulfcd\n'
# bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
# bindkey '^e' edit-command-line


# Created by person named `totoro`
function toppy --description 'Show top 21 Commands used'
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n 21
end


# Lang
# export LANG=en_US.UTF-8

# fzf source
# source /usr/share/fzf/shell/key-bindings.fish

# Other program settings:
# export SUDO_ASKPASS="$HOME/.config/scripts/askpass"
# export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.

# alias startw="wpa supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf"



