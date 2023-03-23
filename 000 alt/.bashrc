#!/bin/bash

# .bashrc by oduudo

# debug bash profiles, yes:ja
# bash_debug=yes
if [ "$bash_debug" = yes ]; then echo Start of .bashrc 
fi

if [ -f $HOME/.dotfiles/bashrc.bash ]; then
    . $HOME/.dotfiles/bashrc.bash
fi

#[ -n "$PS1" ] && source ~/.bash_profile

### debug 
if [ "$bash_debug" = yes ]; then echo End of .bashrc
fi
