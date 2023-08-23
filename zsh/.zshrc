
source $ZDOTDIR/init.zsh

for f in $ZDOTDIR/conf.d/*.zsh
do
    # echo "sourcing: $f"
    source "$f"
done

zstyle ':antidote:bundle' use-friendly-names 'yes'

source '/usr/share/zsh-antidote/antidote.zsh'
# source "$ZDOTDIR/.antidote/antidote.zsh"

zsh_plugins=${ZDOTDIR}/plugins
antidote load ${zsh_plugins}.conf

# antidote bundle <${zsh_plugins}.conf >${zsh_plugins}.zsh

unset zsh_plugins
