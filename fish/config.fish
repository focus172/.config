#
# config.fish
#

set -g fish_greeting 

if status is-interactive

    # Waiting for fish async
    starship init fish | source &
    cat ~/.config/zsh/aliases.sh | source &

    if string match -q "Darwin" $(uname)
        brew shellenv | eval &
    else
        export RUSTC_WRAPPER=$(which sccache) 
    end

end


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

# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
#set -e fish_user_paths
#set -U fish_user_paths $HOME/.bin  $HOME/.local/bin $HOME/.emacs.d/bin $HOME/Applications /var/lib/flatpak/exports/bin/ $fish_user_paths

# set TERM "xterm-256color"                         # Sets the terminal type
# # set EDITOR "emacsclient -t -a ''"                 # $EDITOR use Emacs in terminal
# # set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode
#
# ### SET MANPAGER
# ### Uncomment only one of these!
#
# ### "bat" as manpager
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
#
# ### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
# function fish_user_key_bindings
#     # fish_default_key_bindings
#     fish_vi_key_bindings
# end
# ### END OF VI MODE ###
#
# ### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
# set fish_color_normal brcyan
# set fish_color_autosuggestion '#7d7d7d'
# set fish_color_command brcyan
# set fish_color_error '#ff6c6b'
# set fish_color_param brcyan
#
# ### SPARK ###
#
#
#
# ### FUNCTIONS ###
#
# # Functions needed for !! and !$
# function __history_previous_command
#   switch (commandline -t)
#   case "!"
#     commandline -t $history[1]; commandline -f repaint
#   case "*"
#     commandline -i !
#   end
# end
#
# function __history_previous_command_arguments
#   switch (commandline -t)
#   case "!"
#     commandline -t ""
#     commandline -f history-token-search-backward
#   case "*"
#     commandline -i '$'
#   end
# end
# # The bindings for !! and !$
# if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
#   bind -Minsert ! __history_previous_command
#   bind -Minsert '$' __history_previous_command_arguments
# else
#   bind ! __history_previous_command
#   bind '$' __history_previous_command_arguments
# end
#
# function backup --argument filename
#     cp $filename $filename.bak
# end
#
# # Function for copying files and directories, even recursively.
# # ex: copy DIRNAME LOCATIONS
# # result: copies the directory and all of its contents.
# function copy
#     set count (count $argv | tr -d \n)
#     if test "$count" = 2; and test -d "$argv[1]"
# 	set from (echo $argv[1] | trim-right /)
# 	set to (echo $argv[2])
#         command cp -r $from $to
#     else
#         command cp $argv
#     end
# end
#
# # Function for printing a column (splits input on whitespace)
# # ex: echo 1 2 3 | coln 3
# # output: 3
# function coln
#     while read -l input
#         echo $input | awk '{print $'$argv[1]'}'
#     end
# end
#
# # Function for printing a row
# # ex: seq 3 | rown 3
# # output: 3
# function rown --argument index
#     sed -n "$index p"
# end
#
# # Function for ignoring the first 'n' lines
# # ex: seq 10 | skip 5
# # results: prints everything but the first 5 lines
# function skip --argument n
#     tail +(math 1 + $n)
# end
#
# # Function for taking the first 'n' lines
# # ex: seq 10 | take 5
# # results: prints only the first 5 lines
# function take --argument number
#     head -$number
# end
#
# # Function for org-agenda
# function org-search -d "send a search string to org-mode"
#     set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
#         (mapcar #'org-link-display-format \
#         (org-ql-query \
#         :select #'org-get-heading \
#         :from  (org-agenda-files) \
#         :where (org-ql--query-string-to-sexp \"$argv\"))) \
#         \"
#     \"))")
#     printf $output
# end
#
# ### END OF FUNCTIONS ###
#
#
# ### ALIASES ###
# # \x1b[2J   <- clears tty
# # \x1b[1;1H <- goes to (1, 1) (start)
# alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'
#
# # root privileges
# alias doas="doas --"
#
# # navigation
# alias ..='cd ..'
# alias ...='cd ../..'
# alias .3='cd ../../..'
# alias .4='cd ../../../..'
# alias .5='cd ../../../../..'
#
# # vim and emacs
# alias vim='nvim'
# alias em='/usr/bin/emacs -nw'
# alias emacs="emacsclient -c -a 'emacs'"
#
