# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# source ${ZDOTDIR:-~}/.antidote/antidote.zsh # for linux

autoload -Uz compinit && compinit
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
antidote load ${zsh_plugins}.txt
antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh

# history
alias history="history 1"
HISTFILE=~/.zsh_history
HISTSIZE=100000000000
SAVEHIST=100000000000
setopt SHARE_HISTORY
setopt histignoredups

# you may need to manually set your language environment
export LANG=en_US.UTF-8

# preferred editor for everything
# export EDITOR='nvim'

# aliases
alias uni="cd $HOME/Desktop/Dropbox/university"

alias bup="brew update && brew upgrade && brew cleanup"
alias ls="exa"
alias tree="tree -C"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gp="git push"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export GOPATH="$HOME/go"; 
export GOROOT="$HOME/.go"; 
export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

alias g="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g


# alias to update rio term
alias rio-update="curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/raphamorim/rio/main/scripts/install.sh | bash"
