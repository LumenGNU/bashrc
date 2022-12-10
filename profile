#!/bin/bash

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    # shellcheck disable=SC1091
    . "$HOME/.bashrc"
  fi
fi

## PATH
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

PATH="./node_modules/.bin:$PATH"

## CDPATH
# shellcheck disable=SC2016
CDPATH='.:$HOME'
if [ -d "$HOME/Документы/Projects" ]; then
  CDPATH="${CDPATH}:$HOME/Документы/Projects"
fi
export CDPATH

## TMPDIR
# если доступна директория XDG_RUNTIME_DIR создать там директорию для
# временных файлов
if [ -d "${XDG_RUNTIME_DIR}" ]; then
  mkdir -p "${XDG_RUNTIME_DIR}/temp"
  TMPDIR="${XDG_RUNTIME_DIR}/temp"
fi

## VISUAL
# визуальный редактор по умолчанию
# shellcheck disable=SC2034
VISUAL='code --new-window --wait'

# #так НЕлюзя:
# export VISUAL
# export TMPDIR
# etc.

if [ -d "$HOME/.local/share/android" ]; then
  export ANDROID_HOME="$HOME/.local/share/android"
  export ANDROID_SDK_ROOT="$ANDROID_HOME"
  export ANDROID_AVD_HOME="$HOME/.local/share/android/android_avd"
  PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
fi
