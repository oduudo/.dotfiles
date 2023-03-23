#!/bin/bash

##### bash_config by oduudo

### debug 
if [ "$bash_debug" = yes ]; then echo Start of bash_config.bash
fi

#Only "exit" or "logout" will log off the system.
set -o ignoreeof

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

########## Text editing/viewing.
#
export LANG=de_DE.utf-8
#de_DE.utf-8
export CLICOLOR=1 #Colorizes output of ls and others.
#export EDITOR=vi
export EDITOR=nano
export VISUAL=$EDITOR
export PAGER=less
export LESS='-r-i-P%f (%i/%m) Line %lt/%L' #Better prompt, case-insensitive search by default.

#Command line editing options.
set -o emacs
##########

########## History
HISTFILE=~/.bash_history
# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Ignore duplicate commands or starting space in the history
export HISTCONTROL=ignoreboth

# Increase the maximum number of lines contained in the history file
export HISTFILESIZE=2000
# Increase the maximum number of commands to remember
export HISTSIZE=2000

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; history -c; history -r"
#export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
##########

########## Bash Completion
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
##########

########## Manpages
#export MANPATH=/opt/local/share/man:$MANPATH

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"
##########

### ??
#export ENV=$HOME/.bashrc


### debug 
if [ "$bash_debug" = yes ]; then echo End of bash_config.bash
fi
