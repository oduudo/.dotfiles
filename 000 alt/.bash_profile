#!/bin/bash

# bash_profile

### debug
#bash_debug=yes
if [ "$bash_debug" = yes ]; then echo Start of .bash_profile
fi

if [ -f $HOME/.dotfiles/bashrc.bash ]; then
    . $HOME/.dotfiles/bashrc.bash
fi

### debug 
if [ "$bash_debug" = yes ]; then echo End of .bash_profile
fi
