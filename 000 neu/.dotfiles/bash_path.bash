#!/bin/bash

# bash_paths by oduudo

### debug
if [ "$bash_debug" = yes ]; then echo Start of bash_path.bash
fi

########## PATH

# Directories to be prepended to PATH
declare -a dirs_to_prepend=(
#	"/opt/bin"
#	"/opt/sbin"
#    "/usr/local/bin" # Ensure that this bin always takes precedence over `/usr/bin`
)

# echo $PATH | grep -o /usr/local/bin | wc -w
# echo $PATH | grep -o ${dirs_to_prepend[$index]} | wc -w
# Directories to be appended to PATH
declare -a dirs_to_append=(
#    "/usr/bin"
#    "$HOME/bin"
    "$HOME/.dotfiles/bin"
	"$HOME/mycode/portfoilios_entwicklung"
#    "$HOME/.rvm/bin"
#    "$(brew --prefix coreutils)/libexec/gnubin" # Add brew-installed GNU core utilities bin
#    "$(brew --prefix)/share/npm/bin" # Add npm-installed package bin
)

# Prepend directories to PATH
for index in ${!dirs_to_prepend[*]}
do
    if [ -d ${dirs_to_prepend[$index]} ]; then
		dircount=$(echo $PATH | grep -o ${dirs_to_prepend[$index]} | wc -w)
		if [ "$dircount" -eq 0 ]; then
			#echo $PATH | grep -o ${dirs_to_prepend[$index]} | wc -w
			# If these directories exist and are not in the PATH, then prepend them to existing PATH
			PATH="${dirs_to_prepend[$index]}:$PATH"
		fi
    fi
done

# Append directories to PATH
for index in ${!dirs_to_append[*]}
do
    if [ -d ${dirs_to_append[$index]} ]; then
		dircount=$(echo $PATH | grep -o ${dirs_to_append[$index]} | wc -w)
		if [ "$dircount" -eq 0 ]; then
			# If these bins exist and are not in the PATH, then append them to existing PATh
			PATH="$PATH:${dirs_to_append[$index]}"
		fi
    fi
done

unset dirs_to_prepend dirs_to_append

export PATH

##########


### debug
if [ "$bash_debug" = yes ]; then echo End of bash_path.bash
fi
