#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# ИСТОРИЯ

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups
# HISTCONTROL=:ignorespace:ignoredups

HISTIGNORE='rm *:encfs *:'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


# ОКНО ТЕРМИНАЛА
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ГЛОБИНГ
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar



# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  # shellcheck source=bash_aliases
  source ~/.bash_aliases
fi

# АВТОЗАВЕРШЕНИЯ
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
  # если есть папка с автозавершенями, то используем.
  # будут подключены все файлы с расширением _autocomplete
  if [ -d ~/.bash_completions ]; then
    for f in ~/.bash_completions/*_autocomplete; do
      # shellcheck disable=SC1090
      source "$f"
    done
  fi
fi

# shellcheck source=/home/lumen/.byobu/prompt
[ -r ~/.byobu/prompt ] && source ~/.byobu/prompt   #byobu-prompt#

# shellcheck source=bash_ppp_command
source ~/.bash_ppp_command

