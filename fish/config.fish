
set -g fish_greeting 

if status is-interactive
    # Waiting for fish async
    starship init fish | source &

    if string match -q "Darwin" $(uname)
        brew shellenv | eval &
    else if string match -q "*nix*" $(uname -r)
        # cat ~/.nix-profile/etc/profile.d/nix.sh | bablefish | source &
    end
end
