#!/bin/bash

# .prompts.bash by oduudo

### debug
if [ "$bash_debug" = yes ]; then echo Start of bash_prompt.bash
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

########## PROMPT
set_prompts() {
	# Funktionen
    local reset=""
	local bold=""
	local dim=""
	local italon=""
	local italoff=""
	local underline=""
	local underlineoff=""
	local blink=""
	local reverse=""
	local reverseoff=""
	local hidden=""
	local s=""
	local e=""

	# Textfarbe
    local black=""
	local dgrey=""
    local red=""
	local bred=""
    local green=""
    local bgreen=""
    local yellow=""
	local byellow=""
	local blue=""
	local bblue=""
    local purple=""
    local bpurple=""
    local cyan=""
    local bcyan=""
    local white=""
	local bwhite=""

	# Hintergrundfarbe
	local nobg=""
	local bgblack=""
	local bgdgrey=""
	local bgred=""
	local bgbred=""
	local bggreen=""
	local bgbgreen=""
	local bgyellow=""
	local bgbyellow=""
	local bgblue=""
	local bgbblue=""
	local bgpurple=""
	local bgbpurple=""
	local bgcyan=""
	local bgbcyan=""
	local bggrey=""
	local bgwhite=""

    local hostStyle=""
    local userStyle=""

# set a fancy prompt (non-color, unless we know we "want" color)
	case "$TERM" in
		xterm-color) color_prompt=yes
		if [ "$bash_debug" = yes ]; then echo $color_prompt case
		fi
		;;
	esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
	force_color_prompt=yes

	if [ -n "$force_color_prompt" ]; then
#		if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		if tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
	color_prompt=yes
		else
	color_prompt=
		fi
	fi
	if [ "$bash_debug" = yes ]; then echo $color_prompt if
	fi

######
#	color_prompt=yes

    if [ "$color_prompt" = yes ]; then

# Funktionen
        reset="0"
		bold="1"  #oder light
		dim="2"
		italon="3"
		italoff="23"
		underline="4"
		underlineoff="24"
		blink="5"
		reverse="7"
		reverseoff="27"
		hidden="8"
		s="\[\e["	# Start Escape
		e="m\]"		# End Escape

# Textfarbe d:dark, b:bright
        black="30"
		dgrey="90"
		red="31"
		bred="91"
		green="32"
		bgreen="92"
		yellow="33"
		byellow="93"
		blue="34"
		bblue="94"
		purple="35"
		bpurple="95"
		cyan="36"
		bcyan="96"
		white="37"
		bwhite="97"

# Hintergrundfarbe
		nobg="00"
		bgblack="40"
		bgdgrey="100"
		bgred="41"
		bgbred="101"
		bggreen="42"
		bgbgreen="102"
		bgyellow="43"
		bgbyellow="103"
		bgblue="44"
		bgbblue="104"
		bgpurple="45"
		bgbpurple="105"
		bgcyan="46"
		bgbcyan="106"
		bggrey="47"
		bgwhite="107"

    fi

    # build the prompt

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="$bold$e$s$red"
    else
        userStyle="$bgreen"
    fi

    # connected via ssh
    if [[ "$SSH_TTY" ]]; then
        hostStyle="$red"
    else
        hostStyle="$bgreen"
    fi

	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
	# \d:Datum, \D{%A, %d.%m.%Y}:Datum, \t:Zeit24h
    # set the terminal title to the current working directory export PS1="\[\e[31;46m\]\u\[\e[m\] "
    # PS1="\[\033]0;\w\007\]"

	# Title
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
	# Prompt
    PS1+="\n" # newline
	PS1+="$s$bwhite$e[$WSL_DISTRO_NAME] \s \V, Jobs: \j"
	PS1+="\n" # newline
    PS1+="$s$userStyle$e\u" # username
#    PS1+="$s$reset$e"
	PS1+="$s$green$e@"
    PS1+="$s$hostStyle$e\h" # host
	PS1+="  $s$bred$e\D{%A, %d.%m.%Y %H:%M:%S}\n"
#    PS1+="$s$white$e: "
#	PS1+="\n"
    PS1+="$s$bblue$e\w" # working directory
#    PS1+="\$(prompt_git \"$white on $cyan\")" # git repository details
    PS1+="\n"
	PS1+="$s$white$e\$ " # $ (and reset color)
	PS1+="$s$reset$e"

### debug
	if [ "$bash_debug" = yes ]; then echo $PS1
	fi

    export PS1
	export PS2='+>'
	export PS4='++>'
}

set_prompts
unset set_prompts color_prompt force_color_prompt
##########


### debug
if [ "$bash_debug" = yes ]; then
	echo
	echo txt standard colors 30 - 37 :
	echo
# bkg standard colors
	for C in {30..37}; do
		echo -en "\e[${C}m$C "
	done
	echo -e "\e(B\e[m"

	echo
	echo txt high intensity colors 90 - 97 :
	echo
# bkg high intensity colors
	for C in {90..97}; do
		echo -en "\e[${C}m$C "
	done
	echo -e "\e(B\e[m"

	echo
	echo bkg standard colors 40 - 47 :
	echo
# bkg standard colors
	for C in {40..47}; do
		echo -en "\e[${C}m$C "
	done
	echo -e "\e(B\e[m"

	echo
	echo bkg high intensity colors 100 - 107 :
	echo
# bkg high intensity colors
	for C in {100..107}; do
		echo -en "\e[${C}m$C "
	done
	echo -e "\e(B\e[m"
	echo
	echo 256 colors 48 :
	echo
# 256 colors
	for C in {16..255}; do
		echo -en "\e[48;5;${C}m$C "
	done
	echo -e "\e(B\e[m"
	echo
	echo 256 colors 38 :
	echo
# 256 colors
	for C in {16..255}; do
		echo -en "\e[38;5;${C}m$C "
	done
	echo -e "\e(B\e[m"

	echo End of bash_prompt.bash
fi
