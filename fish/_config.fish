
set -g fish_greeting

if status is-interactive
    # Waiting for fish async
    starship init fish | source &

    if string match -q "Darwin" $(uname)
        brew shellenv | eval &
    else \
    if string match -q "*NixOs*" $(uname -r)
        # Note this cant be done in the background beacuse 
        # some processes require its result

        # TODO: this is being translated every time 
        # Could this be done at comp time 
        # or just insured it is only dont once
        # just put this in init.fish ?
        cat ~/.nix-profile/etc/profile.d/hm-session-vars.sh \
            | bablefish \
            | source
    end
end
