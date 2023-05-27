
set -g fish_greeting 

if status is-interactive
    # Waiting for fish async
    starship init fish | source &

    if string match -q "Darwin" $(uname)
        brew shellenv | eval &
    else  
        cat ~/.nix-profile/etc/profile.d/hm-session-vars.sh | babelfish | source
    end
end
