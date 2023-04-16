#
# config.fish
#

# Many import things are covered in init.zshrc
# file as using fish as a login shell is 
# dangerous.

set -g fish_greeting 

if status is-interactive

    if string match -q "Darwin" $(uname)

        set -g XDG_DATA_HOME "$HOME/.local/share"
        set -g CARGO_HOME "$XDG_DATA_HOME/cargo"
        
        set -g PATH "$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/scripts:$CARGO_HOME/bin"
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export XDG_DATA_HOME="$HOME/.local/share"

        set -g RUSTUP_HOME "$XDG_DATA_HOME/rustup"
        set -g GNUPGHOME "$XDG_DATA_HOME/gnupg"  
    else
        export RUSTC_WRAPPER=$(which sccache) 
    end
 
    starship init fish | source &

    # Alias things
    alias ..="cd .."
    alias l="exa -a"
    alias land="cat ~/.config/assets/george.txt"
    alias hgrep="history | grep"
    alias h="history"
    alias hclear="history --delete"
    alias lf="/home/focus/.config/lf/lfrun"
    alias math="math \"$1\""

end

# if status is-interactive
#         #source ~/.config/zsh/.zshrc
#         starship init fish | source &
#
#
# set -l teal 94e2d5
# set -l flamingo f2cdcd
# set -l mauve cba6f7
# set -l pink f5c2e7
# set -l red f38ba8
# set -l peach fab387
# set -l green a6e3a1
# set -l yellow f9e2af
# set -l blue 89b4fa
# set -l gray 1f1d2e
# set -l black 191724
#     
# # Completion Pager Colors
# set -g fish_pager_color_progress $gray
# set -g fish_pager_color_prefix $mauve
# set -g fish_pager_color_completion $peach
# set -g fish_pager_color_description $gray
#
# # Some config
# set -g fish_greeting
#
# # Git config
# set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_showupstream informative
# set -g __fish_git_prompt_showdirtystate yes
# set -g __fish_git_prompt_char_stateseparator ' '
# set -g __fish_git_prompt_char_cleanstate '✔'
# set -g __fish_git_prompt_char_dirtystate '✚'
# set -g __fish_git_prompt_char_invalidstate '✖'
# set -g __fish_git_prompt_char_stagedstate '●'
# set -g __fish_git_prompt_char_stashstate '⚑'
# set -g __fish_git_prompt_char_untrackedfiles '?'
# set -g __fish_git_prompt_char_upstream_ahead ''
# set -g __fish_git_prompt_char_upstream_behind ''
# set -g __fish_git_prompt_char_upstream_diverged 'ﱟ'
# set -g __fish_git_prompt_char_upstream_equal ''
# set -g __fish_git_prompt_char_upstream_prefix ''''
#
#
# set -g man_blink -o $teal
# set -g man_bold -o $pink
# set -g man_standout -b $gray
# set -g man_underline -u $blue
#
#
# # Directory abbreviations
# abbr -a -g l 'ls'
# abbr -a -g la 'ls -a'
# abbr -a -g ll 'ls -l'
# abbr -a -g lal 'ls -al'
# abbr -a -g d 'dirs'
# abbr -a -g h 'cd $HOME'
#
# # Locale
#
# # Exports
#
# # Term
# switch "$TERM_EMULATOR"
# case '*kitty*'
# 	export TERM='xterm-kitty'
# case '*'
# 	export TERM='xterm-256color'
# end
#
#
# # User abbreviations
# abbr -a -g ytmp3 'youtube-dl --extract-audio --audio-format mp3'				# Convert/Download YT videos as mp3
# abbr -a -g cls 'clear'																								# Clear
# abbr -a -g h 'history'																								# Show history
# abbr -a -g upd 'paru -Syu --noconfirm'																								# Update everything
# abbr -a -g please 'sudo'
# # Polite way to sudo
# abbr -a -g fucking 'sudo'																						# Rude way to sudo
# abbr -a -g sayonara 'shutdown now'																	# Epic way to shutdown
# abbr -a -g shinei 'kill -9'																						# Kill ala DIO
# abbr -a -g priv 'fish --private'																				# Fish incognito mode
# abbr -a -g sshoff 'sudo systemctl stop sshd.service'										# Stop ssh service
# abbr -a -g untar 'tar -zxvf'																					# Untar
# abbr -a -g genpass 'openssl rand -base64 20'													# Generate a random, 20-charactered password
# abbr -a -g sha 'shasum -a 256'																			# Test checksum
# abbr -a -g ipe 'curl ifconfig.co'																				# Get external IP address
# abbr -a -g ips 'ip link show'																					# Get network interfaces information
# abbr -a -g wloff 'rfkill block wlan'																			# Block wlan, killing wifi connection
# abbr -a -g wlon 'rfkill unblock wlan'																		# Unblock wlan, start wifi connection
#
# # Source plugins
# # Useful plugins: archlinux bang-bang cd colorman sudope vcs
#
#
# # Get terminal emulator
# # set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')
#
# # Neofetch
# # switch "$TERM_EMULATOR"
# # case '*kitty*'
# #       neofetch --backend 'kitty'
# # case '*tmux*' '*login*' '*sshd*' '*konsole*'
# #	neofetch --backend 'ascii' --ascii_distro 'arch_small' 
# # case '*'
# # 	neofetch --backend 'w3m' --xoffset 34 --yoffset 34 --gap 0
# # end
#
# end
#
