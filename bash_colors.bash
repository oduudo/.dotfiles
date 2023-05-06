#!/bin/bash

# bash_colors.bash by oduudo

### debug
if [ "$bash_debug" = yes ]; then echo Start of bash_colors.bash
fi

########## PROMPT
set_prompts() {
    local bold=""
	local reset=""
    local black=""
	local grey=""
    local red=""
	local lred=""
    local green=""
    local lgreen=""
	local brown=""
    local yellow=""
	local blue=""
	local lblue=""
    local purple=""
    local lpurple=""
    local cyan=""
    local lcyan=""
    local lgrey=""
    local white=""

	local nobkg=""
	local bkgblack=""
	local bkgred=""
	local bkggreen=""
	local bkglbrown=""
	local bkgblue=""
	local bkgpurple=""
	local bkgcyan=""
	local bkglgrey=""

    local hostStyle=""
    local userStyle=""

# set a fancy prompt (non-color, unless we know we "want" color)
#	case "$TERM" in
#		xterm-color) color_prompt=yes
# debug
#		echo $color_prompt case
#		;;
#	esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
	force_color_prompt=yes

#	if [ -n "$force_color_prompt" ]; then
#		if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#		if tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
	color_prompt=yes
#		else
#	color_prompt=
#		fi
#	fi

# debug
#	echo $color_prompt


    if [ "$color_prompt" = yes ]; then

# Textfarbe
        reset="00"
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
		s="\[\e["
		e="m\]"

        black="30"
#		grey="1;30"
		red="31"
#		lred="1;31"
		green="32"
#		lgreen="1;32"
#		brown="0;33"
		yellow="33"
		blue="34"
#		lblue="1;34"
		purple="35"
#		lpurple="1;35"
		cyan="36"
#		lcyan="1;36"
#		lgrey="0;37"
		white="37"
# Hintergrundfarbe
		nobkg="0"
		bkgblack="40"
		bkgred="41"
		bkggreen="42"
		bkglbrown="43"
		bkgblue="44"
		bkgpurple="45"
		bkgcyan="46"
		bkglgrey="47"

    fi

    # build the prompt

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="$bold;$red"
    else
        userStyle="$bold;$yellow"
    fi

    # connected via ssh
    if [[ "$SSH_TTY" ]]; then
        hostStyle="$bold;$red"
    else
        hostStyle="$yellow"
    fi

    # set the terminal title to the current working directory export PS1="\[\e[31;46m\]\u\[\e[m\] "
    PS1="\[\033]0;\w\007\]"

    PS1+="\n" # newline
	PS1+="$s$bkggreen;$purple$e\s \j"
	PS1+="$s$bkgblack$e\n" # newline
    PS1+="$s$userStyle$e\u" # username
    PS1+="$s$white$e@"
    PS1+="$s$hostStyle$e\h" # host
    PS1+="$s$white$e: "
    PS1+="$s$green$e\w" # working directory
#    PS1+="\$(prompt_git \"$white on $cyan\")" # git repository details
    PS1+="\n"
	PS1+="$s$white$e\$ " # $ (and reset color)
	PS1+="$s$reset$e"
	echo $PS1

    export PS1
	export PS2='+>'
	export PS4='++>'
}

set_prompts
unset set_prompts color_prompt force_color_prompt
##########
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

### debug
if [ "$bash_debug" = yes ]; then echo End of bash_color.bash
fi
