bindkey -v
export KEYTIMEOUT=1

### colors
# autoload -U colors
# colors

# autoload run-help

# zsh parameters
# typeset -U path

# cdpath=(. ~)
# DIRSTACKSIZE=60

# LISTMAX=0
# LOGCHECK=60
# HISTSIZE=20000
# HISTFILE="$XDG_DATA_HOME/zsh/history"
# MAILCHECK=1
# READNULLCMD=less
# REPORTTIME=15
# SAVEHIST=30000000
# TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'
# watch=(all)
# WATCHFMT='%n %a %l from %m at %t.'
# WORDCHARS="${WORDCHARS:s#/#}"

# zsh options
setopt auto_pushd
setopt pushd_silent
setopt PUSHD_IGNORE_DUPS
#   auto_name_dirs \
#   auto_resume \
#   no_beep \
#   cdable_vars \
#   csh_null_glob \
#   extended_glob \
#   extended_history \
#   no_glob_dots \
#   hist_allow_clobber \
#   hist_find_no_dups \
#   no_hist_ignore_all_dups \
#   hist_ignore_dups \
#   hist_reduce_blanks \
setopt hist_save_no_dups
#   inc_append_history \
#   no_list_ambiguous \
#   no_list_beep \
#   long_list_jobs \
#   magic_equal_subst \
#   no_notify \
#   prompt_subst \
#   pushd_minus \
#   pushd_to_home \
#   rc_quotes \
#   no_share_history \
#   shwordsplit \
#   transient_rprompt \
#   hist_ignore_space \
#   no_equals

alias d='dirs -v'
# for index ({1..4}) alias "$index"="cd +${index}"; unset index

  
# modules
# autoload -U url-quote-magic bracketed-paste-magic
# zle -N self-insert url-quote-magic
# zle -N bracketed-paste bracketed-paste-magic

# Enable auto-execution of functions.
# unset preexec_functions
# unset precmd_functions
# unset chpwd_functions
# typeset -ga preexec_functions
# typeset -ga precmd_functions
# typeset -ga chpwd_functions

# tab-completion
autoload -Uz compinit
compinit -i -d "${XDG_DATA_HOME}/zsh/zcompdump"

# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion::complete:cd::' tag-order '! users' -
# zstyle ':completion::complete:-command-::' tag-order '! users' -
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
# zstyle ':completion:*:descriptions' format "- %d -"
# zstyle ':completion:*:corrections' format "- %d - (errors %e})"
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:kill:*:processes' command "ps x"
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/cache
# zstyle ':completion:*' special-dirs true

# _comp_options+=(globdots)

setopt notify

# load starship
# if [ $(tty) != "/dev/tty*" ]; then
    eval "$(starship init zsh)"
# else
#     PROMPT="# "
# fi
