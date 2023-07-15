
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

