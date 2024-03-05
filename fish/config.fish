
status --is-login; and begin
    # THIS SHOULD NEVER BE THE LOGIN SHELL
    echo "Oh, no. You are fucked!"
end

status --is-interactive; and begin
    # Interactive shell initialisation
    set -g fish_greeting

    # export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/.config/scripts"

    fish_vi_key_bindings

    eval (starship init fish)
end
