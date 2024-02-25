#!/bin/sh
#
autoload -U colors && colors    # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

if [ "$TERM" = "linux" ]; then
    printf "
    \e]P0#191724
    \e]P1#eb6f92
    \e]P2#9ccfd8
    \e]P3#f6c177
    \e]P4#31748f
    \e]P5#c4a7e7
    \e]P6#ebbcba
    \e]P7#e0def4
    \e]P8#26233a
    \e]P9#eb6f92
    \e]PA#9ccfd8
    \e]PB#f6c177
    \e]PC#31748f
    \e]PD#c4a7e7
    \e]PE#ebbcba
    \e]PF#e0def4
    "
    # get rid of artifacts
    clear
fi
