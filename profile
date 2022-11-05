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
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/android_sdk/platform-tools" ]; then
  PATH="$HOME/.local/android_sdk/platform-tools:$PATH"
fi

# если доступна директория XDG_RUNTIME_DIR создать там директорию для
# временных файлов
if [ -d "${XDG_RUNTIME_DIR}" ]; then
  mkdir -p "${XDG_RUNTIME_DIR}/temp"
  TMPDIR="${XDG_RUNTIME_DIR}/temp"
fi

# визуальный редактор по умолчанию
# shellcheck disable=SC2034
VISUAL="code --new-window --wait"

# #так НЕлюзя:
# export VISUAL
# export TMPDIR
# etc.
