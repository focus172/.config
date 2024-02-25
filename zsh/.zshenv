#!/bin/sh

# I have had some problems with GDM "eating" my path sometimes so this just 
# sets the path for each process locally
PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/.config/scripts"
