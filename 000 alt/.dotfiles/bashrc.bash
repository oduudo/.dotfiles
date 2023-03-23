#!/bin/bash

# bashrc by oduudo

### debug 
if [ "$bash_debug" = yes ]; then echo Start of bashrc.bash
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# shortcut to this dotfiles path is $BASH
export BASH=$HOME/.dotfiles
export DOTFILES=$HOME/.dotfiles


####### sourcing config files
# Up-front dotfiles configuration
# Not part of `load_dotfiles` because it must be sourced before anything else
# to be sure that commands like `brew` (when installed in a custom location)
# are already added to the PATH.
#[ -r $HOME/.dotfilesrc ] && source $HOME/.dotfilesrc;

load_dotfiles() {

    declare -a files=(
#        $HOME/.rvm/scripts/rvm 				# Load RVM into a shell session *as a function*
        $HOME/.dotfiles/bash_config.bash 		# Options and Exports
		$HOME/.dotfiles/bash_path.bash 			# Path modifications
        $HOME/.dotfiles/bash_aliases.bash 		# Aliases
        $HOME/.dotfiles/functions/* 			# Functions
        $HOME/.dotfiles/bash_prompt.bash 		# Custom bash prompt

#		$HOME/.dotfiles/inputrc.bash
#        $(brew --prefix)/etc/bash_completion 	# Bash completion (installed via Homebrew)
#        $HOME/.bash_profile.local 				# Local and private settings not under version control (e.g. git credentials)
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
            source ${files[$index]}
			if [ "$bash_debug" = yes ]; then echo ${files[$index]}
			fi
        fi
    done
}

load_dotfiles
unset load_dotfiles
######## sourcing config files


### debug 
if [ "$bash_debug" = yes ]; then echo End of bashrc.bash
fi
