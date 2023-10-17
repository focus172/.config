# Aliases

# letters
alias e=nvim
alias i=imv
alias z="zathura"
alias o="$OPENER"
alias m="mpv"
alias n='newsboat'

alias l='eza -l'
alias ls=eza
alias la='eza -a'
alias ll='eza -la'
alias lt="eza --tree --level=3"
alias lsi="eza --group-directories-first --icons"
alias l.='la | grep -E "^\."'

# alias land 'cat $HOME/.config/george.txt | cowsay -W 70'
# alias sdn 'shutdown -h now'


# core utils
alias cp="cp -ivr"
alias mv="mv -iv"
alias rm="rm -vI" # this cuases errors on busybox
alias mkd="mkdir -pv"

alias cat="bat --plain --paging never --color auto"
alias bat="bat --color always"


# yt-dl stuff
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt-dlp --embed-metadata -i -x -f bestaudio/best --audio-format vorbis"
alias ytt="yt-dlp --embed-metadata -i --skip-download --write-thumbnail"

alias cdf="cd \$(fd -t d . | fzf)"

alias wget="wget --hsts-file /dev/null"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias vdiff="nvim -d"

alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"

alias h=history
alias zr='zellij run -c --'

alias ka="killall"

alias nmutt='neomutt'

# root privileges
alias doas="doas --"
#alias sudo='doas'

alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'


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
# alias stat='git status'

# TODO: remove /etc/inputrc

### ************* The Binding of  ************* ###
bindkey -s '^o' '^ulf\n'
bindkey -s '^f' '^ucdf\n'
# bindkey '^e' edit-command-line

### fzf source
### CTRL-T - Paste the selected file path(s) into the command line
### ALT-C - cd into the selected directory (DOESNT WORK)
### CTRL-R - Paste the selected command from history into the command line
# DOESNT WORK ON NIX
source /usr/share/fzf/key-bindings.zsh

# history
alias history="history 1"
# HISTFILE=~/.zsh_history
# HISTSIZE=100000000000
# SAVEHIST=100000000000
# setopt SHARE_HISTORY
# setopt histignoredups



alias 'cpu-savepower'='cpupower frequency-set -g powersave'
alias 'cpu-performance'='cpupower frequency-set -g performance'

# Lang
# export LANG=en_US.UTF-8



# ---------------P R O M P T------------------
#
# Other program settings:
# export SUDO_ASKPASS="$HOME/.config/scripts/askpass"
# export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.

# alias startw="wpa supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf"


export SUDO_PROMPT=$'Password ->\033[32;05;16m %u\033[0m  '

export FZF_DEFAULT_OPTS='
        --color hl:#dadada,hl+:#13171b,gutter:#13171b
        --color bg+:#ef7d7d,fg+:#2c2f30
        --color pointer:#373d49,info:#606672
        --height 13'

# --color fg:#b6beca,bg:#13171b
# --border
# --color border:#13171b


export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# autoload -Uz compinit && compinit


# aliases
alias uni="cd $HOME/dox/skool/13/"
alias uni-jap="cd $HOME/dox/skool/13/fall/japn/"

alias doom1="chocolate-doom -iwad $HOME/dox/games/DOOM1.wad"
alias doom2="chocolate-doom -iwad $HOME/dox/games/DOOM2.wad"


# # opam configuration
# [[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# alias gaa="git add --all"
# alias gcm="git commit -m"
# alias gp="git push"

# alias to update rio term
# alias rio-update="curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/raphamorim/rio/main/scripts/install.sh | bash"
