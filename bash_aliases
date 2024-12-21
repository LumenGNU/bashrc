#!/bin/bash

# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#   alias ls='ls --color=auto'
#   #alias dir='dir --color=auto'
#   #alias vdir='vdir --color=auto'

#   alias grep='grep --color=auto'
#   alias fgrep='fgrep --color=auto'
#   alias egrep='egrep --color=auto'
# fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
  
# some more ls aliases
alias ls='ls --hyperlink=auto --color=auto '
alias ll='ls -AlF --group-directories-first --sort=extension -p'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


command -v batcat >/dev/null && alias less='batcat'
command -v codium >/dev/null && alias code='codium'

alias whatthecommit='curl "https://whatthecommit.com/index.txt" && echo " "'
