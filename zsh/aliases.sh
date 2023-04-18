# vim:ft=zsh
# Aliases
# @Focus172

# core utils
alias cp="cp -ivr" 
alias mv="mv -iv"
alias mkd="mkdir -pv"
alias bat="bat --color always --plain"
# yt-dl stuff
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt-dlp --embed-metadata -i -x -f bestaudio/best --audio-format opus"
alias ytt="yt-dlp --embed-metadata -i --skip-download --write-thumbnail"

alias ..="cd .."
alias wget="wget --hsts-file /dev/null"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 

# ****** Packaging ******
alias pacs="pacman -Slq | fzf -m --preview 'cat \$(pacman -Si {1}) \$(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias pars="paru -Slq | fzf -m --preview 'cat \$(paru -Si {1}) \$(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -S"
alias pacr="pacman -Qqe | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
#alias p="pacman -Q | fzf"
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq)' #; paru -c' 

alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"

alias ka="killall"
alias g="gix"
alias sdn="shutdown -h now"
alias e="$EDITOR"
alias v="$VISUAL"
alias p="pacman"
alias z="zathura"
alias vdiff="nvim -d"
#alias dun='killall dunst && dunst &

# contreversal
# a script that just moves the things to some other place, cleared by cron job
#alias rm="trash"
alias rm="rm -vI" 


#alias sudo='doas'
alias gu="gitui"
alias m='neomutt'
alias r='newsboat' 
alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'

# file viewing
alias ls="exa --color=auto --icons --group-directories-first"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree --level=3"
#alias lf="lf"
#alias br="br -t -h"

