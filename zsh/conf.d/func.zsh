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

# vim: ft=sh
