autoload -Uz compinit && compinit

# history
alias history="history 1"
HISTFILE=~/.zsh_history
HISTSIZE=100000000000
SAVEHIST=100000000000
setopt SHARE_HISTORY
setopt histignoredups

# aliases
alias uni="cd $HOME/Desktop/Dropbox/university"


# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

alias gaa="git add --all"
alias gcm="git commit -m"
alias gp="git push"

# alias to update rio term
alias rio-update="curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/raphamorim/rio/main/scripts/install.sh | bash"
