#$include /etc/inputrc
# inputrc

### debug 
if [ "$bash_debug" = yes ]; then echo Start of inputrc.bash
fi

# Use case-insensitive TAB autocompletion
set completion-ignore-case on

# Auto list tab completions (use instead of TAB-cycling)
set show-all-if-ambiguous on

# Make TAB cycle through possible completions
"\t": menu-complete
# Make SHIFT-TAB reverse cycle through possible completions
"\e[Z": "\e-1\C-i"

# Use the string that has already been typed as the prefix for searching
# through commands (i.e. more intelligent Up/Down-arrow behavior)
"\e[B": history-search-forward
"\e[A": history-search-backward
#"\e[5~": history-search-backward
#"\e[6~": history-search-forward

### debug 
if [ "$bash_debug" = yes ]; then echo End of inputrc.bash
fi

####
# /etc/inputrc - global inputrc for libreadline
# See readline(3readline) and `info rluserman' for more information.

# Be 8 bit clean.
set input-meta on
set output-meta on

# To allow the use of 8bit-characters like the german umlauts, uncomment
# the line below. However this makes the meta key not work as a meta key,
# which is annoying to those which don't need to type in 8-bit characters.

# set convert-meta off

# try to enable the application keypad when it is called.  Some systems
# need this to enable the arrow keys.
# set enable-keypad on

# see /usr/share/doc/bash/inputrc.arrows for other codes of arrow keys

# do not bell on tab-completion
# set bell-style none
# set bell-style visible

# some defaults / modifications for the emacs mode
$if mode=emacs

# allow the use of the Home/End keys
"\e[1~": beginning-of-line
"\e[4~": end-of-line

# allow the use of the Delete/Insert keys
"\e[3~": delete-char
"\e[2~": quoted-insert

# mappings for "page up" and "page down" to step to the beginning/end
# of the history
# "\e[5~": beginning-of-history
# "\e[6~": end-of-history

# alternate mappings for "page up" and "page down" to search the history
# "\e[5~": history-search-backward
# "\e[6~": history-search-forward

# mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving
"\e[1;5C": forward-word
"\e[1;5D": backward-word
"\e[5C": forward-word
"\e[5D": backward-word
"\e\e[C": forward-word
"\e\e[D": backward-word

$if term=rxvt
"\e[7~": beginning-of-line
"\e[8~": end-of-line
"\eOc": forward-word
"\eOd": backward-word
$endif

# for non RH/Debian xterm, can't hurt for RH/Debian xterm
# "\eOH": beginning-of-line
# "\eOF": end-of-line

# for freebsd console
# "\e[H": beginning-of-line
# "\e[F": end-of-line

$endif

# mappings for up and down arrows search history
# "\e[B": history-search-forward
# "\e[A": history-search-backward