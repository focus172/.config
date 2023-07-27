# Aliases
# see abbr.fish for a more full picture of my aliases


# Aliases
alias e nvim
# alias exa 'exa '
alias i imv
alias it img2sixel

# file viewing
alias ls exa
alias la 'exa -a'
alias ll 'exa -l'
alias lla 'exa -la'
alias lt 'exa --tree'

# alias land 'cat $HOME/.config/george.txt | cowsay -W 70'
# alias sdn 'shutdown -h now'

# alias ls="exa --color=auto --group-directories-first" # --icons 
# alias lt="ls --tree --level=3"
# alias l.='la | grep -E "^\."'

# core utils
alias cp="cp -ivr"
alias mv="mv -iv"
alias mkd="mkdir -pv"
alias bat="bat --color always --plain"
alias bat="bat --color never --plain --pageing never"


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
alias vim="nvim"


alias free='free -m'
alias lynx='lynx -vikeys'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'


# git
# alias addup='git add -u'
# alias addall='git add .'
# alias branch='git branch'
# alias checkout='git checkout'
# alias clone='git clone'
# alias commit='git commit -m'
# alias fetch='git fetch'
# alias pull='git pull origin'
# alias push='git push origin'
# alias stat='git status'  # 'status' is protected name so using 'stat' instead

# gpg encryption
# verify signature for isos
# alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
# alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"



# adds colors if in tty
# source /home/focus/.config/zsh/tty.sh
# source /home/focus/.config/zsh/aliases.sh
# source "/home/focus/.config/zsh/functions.sh"

# Todo: find out what this does
#source /etc/inputrc



# Use lf to switch directories and bind it to ctrl-o

# ********** The Binding of  **********
# bindkey -s '^o' '^ulfcd\n'
# bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
# bindkey '^e' edit-command-line




# Show top 21 Commands used (thanks totoro
#toppy() {
#        history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
#}


# Lang
#export LANG=en_US.UTF-8

# fzf source
#source /usr/share/fzf/key-bindings.zsh



# ---------------P R O M P T------------------


# Other program settings:
# export SUDO_ASKPASS="$HOME/.config/scripts/askpass"
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
#export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.


#alias startw="wpa supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf"


# Switch escape and caps if tty and no passwd required:
#sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null

#export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '

# export FZF_DEFAULT_OPTS='
#         --color hl:#dadada,hl+:#13171b,gutter:#13171b
#         --color bg+:#ef7d7d,fg+:#2c2f30
#         --color pointer:#373d49,info:#606672
#         --height 13'

# --color fg:#b6beca,bg:#13171b
# --border
# --color border:#13171b


#export FZF_CTRL_R_OPTS="
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"
