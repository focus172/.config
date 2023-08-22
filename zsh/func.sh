backup() {
    cp $1 $1.bak
}

mcd () {
    mkdir -p "$1"
    cd "$1"
}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

### A Little Noisy
# cd () {
#     builtin cd "$argv"
#     ls
# }

## Iterators ##

coln() {
    while read -l input; do
        echo $input | awk '{print $'$1'}'
    done
}

# function rown --argument index
#     sed -n "$index p"
# end
#
# function skip --argument n
#     tail +(math 1 + $n)
# end
#
# function take --argument number
#     head -$number
# end

br() {
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
