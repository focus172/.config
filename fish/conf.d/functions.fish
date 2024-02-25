function backup --argument filename
    cp $filename $filename.bak
end

function br
    local cmd_file=(mktemp)
    if broot -t -h --outcmd "$cmd_file" "$argv"
        local cmd=(cat "$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        command rm -f "$cmd_file"
        return 1
    end
end

function mcd ()
    mkdir -p $1
    cd $1
end

function lfcd ()
    local tmp=(mktemp -uq)
    if lf -last-dir-path="$tmp" "$argv"
        if test -f "$tmp"
            local dir="(cat "$tmp")"
            [ -d "$dir" ] && [ "$dir" != "(pwd)" ] && cd "$dir"
        end
    end
end

# cd and ls after
function cd
    builtin cd $argv
    ls
end



## Iterator ##
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

function rown --argument index
    sed -n "$index p"
end

function skip --argument n
    tail +(math 1 + $n)
end

function take --argument number
    head -$number
end


### Git Stuff

# delete-branches() {
#   git branch |
#     grep --invert-match '\*' |
#     cut -c 3- |
#     fzf --multi --preview="git log {} --" |
#     xargs --no-run-if-empty git branch --delete --force
# }
#
# pr-checkout() {
#   local jq_template pr_number
#
#   jq_template='"'\
# '#\(.number) - \(.title)'\
# '\t'\
# 'Author: \(.user.login)\n'\
# 'Created: \(.created_at)\n'\
# 'Updated: \(.updated_at)\n\n'\
# '\(.body)'\
# '"'
#
#   pr_number=$(
#     gh api 'repos/:owner/:repo/pulls' |
#     jq ".[] | $jq_template" |
#     sed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' |
#     fzf \
#       --with-nth=1 \
#       --delimiter='\t' \
#       --preview='echo -e {2}' \
#       --preview-window=top:wrap |
#     sed 's/^#\([0-9]\+\).*/\1/'
#   )
#
#   if [ -n "$pr_number" ]; then
#     gh pr checkout "$pr_number"
#   fi
# }
#

### Openrc func

# rcstop() {
#     echo "sudo rc-service $1 stop"
#     sudo rc-service $1 stop
# }
#
# rcstart() {
#     echo "sudo rc-service $1 start"
#     sudo rc-service $1 start
# }
#
# rcrestart() {
#     echo "sudo rc-service $1 restart"
#     sudo rc-service $1 restart
# }
#
