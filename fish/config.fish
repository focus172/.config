# ~/.config/fish/config.fish: DO NOT EDIT -- this file has been generated
# automatically by home-manager.

# Only execute this file once per shell.
set -q __fish_home_manager_config_sourced; and exit
set -g __fish_home_manager_config_sourced 1

# source /nix/store/i9b4y8lavw96gq6jskm0y5bzh9vbg6wa-hm-session-vars.fish



zoxide init fish | source


status --is-login; and begin

    # Login shell initialisation
    # set -g --export XDG_DATA_DIRS $HOME/.nix-profile/share:/usr/local/share/:/usr/share/
    # set -g --export FONTCONFIG_FILE /nix/store/2xji70cxxvpnpifjbyc586yraw9614p5-fontconfig-2.14.0/etc/fonts/fonts.conf

end

status --is-interactive; and begin

    # Abbreviations
    abbr --add --global -- gu gitui

    # Aliases
    alias cd z
    alias e nvim
    alias exa 'exa '
    alias i imv
    alias la 'exa -a'
    alias land 'cat $HOME/.config/george.txt | cowsay -W 70'
    alias ll 'exa -l'
    alias lla 'exa -la'
    alias ls exa
    alias lt 'exa --tree'
    alias sdn 'shutdown -h now'

    # Interactive shell initialisation
    set -g fish_greeting

    if string match Darwin (uname) >/dev/null
        /opt/homebrew/bin/brew shellenv | source
    end

    eval (starship init fish)

end
