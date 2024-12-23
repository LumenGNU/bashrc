#!/bin/bash

# @file: bashrc

# ~/.bashrc: выполняется bash(1) для неинтерактивных оболочек
# Примеры конфигурации: /usr/share/doc/bash/examples/startup-files

# Выход если оболочка неинтерактивная
case $- in
  *i*) ;;
    *) return;;
esac

#
# История команд
#
HISTCONTROL='ignorespace:ignoreboth:erasedups'
HISTIGNORE='&:l:ll:ls:pwd:[bf]g:exit:history*:rm *:encfs *:fap.sh *:'
HISTSIZE=1000
HISTFILESIZE=2000

# Добавлять команды в историю, не перезаписывать
shopt -s histappend

# Не разрывать многострочные команды
shopt -s cmdhist

#
# Настройки терминала
#
# Обновлять размер окна после каждой команды
shopt -s checkwinsize

# Включить расширенный глобинг с поддержкой **
shopt -s globstar

# Поддержка бинарных файлов в less, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


#
# Автодополнение
#
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi


#
# Пользовательские настройки
#
if [[ -d "${HOME}/.bashrc.d" ]]; then
    # Загрузка автодополнений
    if [[ -d "${HOME}/.bashrc.d/completions" ]]; then
        while IFS= read -r -d '' file; do
            # shellcheck source=/dev/null
            source "${file}"
        done < <(find "${HOME}/.bashrc.d/completions" -type f -print0)
    fi

    # Загрузка алиасов и промпта
    # shellcheck source=bashrc.d/aliases
    source "${HOME}/.bashrc.d/aliases"
    # shellcheck source=bashrc.d/surge_prompt_command
    source "${HOME}/.bashrc.d/surge_prompt_command"
fi

