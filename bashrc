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

HISTIGNORE='rm *:encfs *:fap.sh *:'

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
fi


if [[ -d "${HOME}/.bashrc.d" ]]; then

  # если есть папка с автозавершенями, то используем.
  # будут подключены все файлы с расширением _autocomplete
  if [[ -d "${HOME}/.bashrc.d/completions" ]]; then
    while IFS= read -r -d '' file
    do
      # shellcheck source=/dev/null
      source "${file}"
    done < <(find "${HOME}/.bashrc.d/completions" -type f -print0)
  fi

  # shellcheck source=bashrc.d/aliases
  source "${HOME}/.bashrc.d/aliases"

  # shellcheck source=bashrc.d/surge_prompt_command
  source "${HOME}/.bashrc.d/surge_prompt_command"
  
fi

