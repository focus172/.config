source "$HOME/.config/fish/init.fish"

status --is-login; and begin
    # Login shell initialisation
    # set -g --export XDG_DATA_DIRS $HOME/.nix-profile/share:/usr/local/share/:/usr/share/
    # set -g --export FONTCONFIG_FILE /nix/store/2xji70cxxvpnpifjbyc586yraw9614p5-fontconfig-2.14.0/etc/fonts/fonts.conf
end

status --is-interactive; and begin
    # Interactive shell initialisation
    set -g fish_greeting

    if string match Darwin (uname) >/dev/null
        /opt/homebrew/bin/brew shellenv | source
    end


    eval (starship init fish)
end
