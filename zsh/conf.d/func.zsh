backup() {
    cp $1 $1.bak
}

mcd () {
    mkdir -p "$1"
    cd "$1"
}

### A Little Noisy
# cd () {
#     builtin cd "$argv"
#     ls
# }

### Openrc func

rcstop() {
    echo "sudo rc-service $1 stop"
    sudo rc-service $1 stop
}

rcstart() {
    echo "sudo rc-service $1 start"
    sudo rc-service $1 start
}

rcrestart() {
    echo "sudo rc-service $1 restart"
    sudo rc-service $1 restart
}

### Changing dir with nav functions

lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

br () {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(cat "$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}

## Iterators ##

coln () {
    while read -l input; do
        echo $input | awk '{print $'$1'}'
    done
}

rown () {
    sed -n "$1 p"
}

skip () {
    tail +$(($1 + 1))
}

take () {
    head -$1
}

### Git Stuff

delete-branches() {
  git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --" |
    xargs --no-run-if-empty git branch --delete --force
}

pr-checkout() {
  local jq_template pr_number

  jq_template='"'\
'#\(.number) - \(.title)'\
'\t'\
'Author: \(.user.login)\n'\
'Created: \(.created_at)\n'\
'Updated: \(.updated_at)\n\n'\
'\(.body)'\
'"'

  pr_number=$(
    gh api 'repos/:owner/:repo/pulls' |
    jq ".[] | $jq_template" |
    sed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' |
    fzf \
      --with-nth=1 \
      --delimiter='\t' \
      --preview='echo -e {2}' \
      --preview-window=top:wrap |
    sed 's/^#\([0-9]\+\).*/\1/'
  )

  if [ -n "$pr_number" ]; then
    gh pr checkout "$pr_number"
  fi
}

# vim: ft=sh
