#!/bin/bash

# .aliases.bash by oduudo

### debug 
if [ "$bash_debug" = yes ]; then echo Start of bash_aliases.bash
fi

### ALIASES ###
# my own

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias x="exit"
alias ep="echo $PATH"
alias sf="sudo find / -iname "
alias n="nano "
alias sn="sudo nano "
alias psg="ps -A | grep "
alias ssr="sudo shutdown -r now"
alias free="free -m -t"

alias ddcl="sudo /opt/sbin/ddclient -daemon=0 -debug -verbose -noquiet 2"

alias cls='clear'

alias reinst!='cd ~/.dotfiles && . ~/.dotfiles/script/bootstrap.s'
alias reload!='. ~/.bashrc'
alias count='wc -l'
alias tft='curl "http://itsthisforthat.com/api.php?text"'

alias shout="tr '[[:lower:]]' '[[:upper:]]'"

### cd
alias ..='cd ..'
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"
alias ..dot='cd ~/.dotfiles'

### ls -F:file types, -h:readable size, -v:logical order,
# ref: http://ss64.com/osx/ls.html

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
if ls --color -d . >/dev/null 2>&1; then  # GNU ls
	echo dircolors ok
	if [ "$bash_debug" = yes ]; then echo dircolors 
	fi
    
	export COLUMNS  # Remember columns for subprocesses.
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	
	function ls {
    command ls -Fhv --color=always --time-style=long-iso -C "$@" | less -R -X -F -E
	}
	#	alias ls='ls -Fhv --color=auto --time-style=long-iso'
	
	alias l='ls'			
    alias ll='ls -la'		# Long all
	alias la='ls -a'		# List all
	alias lr='ls -Rla'		# List recursive long incl. .files
	alias lt='ls -tla'		# List all, long sort nach Änderungszeit
	alias lh='ls --help'

    alias dir='dir --color=always'
    alias vdir='vdir --color=always'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
#else
#	alias l='ls --color=auto'			# Long form no user group, color
#	alias ll='ls -la --color=auto'		# Long
#	alias la="ls -AGFlh"					# List all, color, mark file types, long form, file size
#	alias lr="ls -RA"					# List recursive incl. .files
#	alias lt="ls -F"					# List mit Typisierung am Ende
fi

#alias l="ls -oG"		# Long form no user group, color
#alias ll="ls -l"		# Long
#alias la="ls -AGFoh"	# List all, color, mark file types, long form no user group, file size
#alias lr="ls -RA"		# List recursive incl. .files
#alias ls="ls -F"		# List mit Typisierung am Ende

# find
#alias find_source='find . -type f -not -path "*/target/*" -not -path "*/.svn/*" -not -path "*/.git/*" -not -name ".DS_Store" -not -iname "*.jar" -not -iname "*.gif" -not -iname "*.jpg" -not -iname "*.png"'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# rails
alias b="bundle"
alias be='bundle exec'
alias bi='bundle install --quiet'
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias rake='ruby -S rake'
alias tlog='tail -f log/development.log'
alias scaffold='script/generate nifty_scaffold'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt'
alias specs="rspec --format=documentation"

# commands starting with % for pasting from web
#alias %=' '

# necolas
# Allow aliases to be with sudo
alias sudo="sudo "

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"


### debug 
if [ "$bash_debug" = yes ]; then echo End of bash_aliases.bash
fi
