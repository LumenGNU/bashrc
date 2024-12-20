SHELL=/bin/bash

# @todo: применять профиль терминала из дампа

all: ~/.profile \
     ~/.bashrc \
     ~/.bash_logout \
     ~/.bash_ppp_command \
     ~/.bash_aliases \
     ~/.inputrc \
     ~/.local/share/mc/bashrc \
     ~/.config/gtk-3.0/gtk.css \
	 ~/.Xresources.d/ppp.xresources
	dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal_dconf.dump


~/.inputrc: ./inputrc
	cp $< $@

~/.local/share/mc/bashrc: ./mc_bashrc
	cp $< $@

~/.config/gtk-3.0/gtk.css: gtk.css
	cp $< $@

~/.bash_ppp_command: ./bash_ppp_command
	# Удаления лишних пробелов между полями
	# Замены табуляций на пробелы
	# Удаления начальных и конечных пробелов
	cat $(<) | ./pprint - | awk '{$$1=$$1};1' > $(@)


## ~/.bashrc
~/.bashrc: ./bashrc | mkdirs
	./pprint ./bashrc > ~/.bashrc

~/.Xresources.d/ppp.xresources: ppp.xresources | mkdirs
	cat $(<) > $(@)


.PHONY: mkdirs
mkdirs:
	mkdir -p ~/.bash_completions
	mkdir -p ~/.Xresources.d

~/.%: ./%
	./pprint $< > $@


clean: 
	{ [[ -r /etc/skel/.profile ]]     && cat /etc/skel/.profile     > ~/.profile; }     || :> ~/.profile
	{ [[ -r /etc/skel/.bashrc ]]      && cat /etc/skel/.bashrc      > ~/.bashrc; }      || :> ~/.bashrc
	{ [[ -r /etc/skel/.bash_logout ]] && cat /etc/skel/.bash_logout > ~/.bash_logout; } || :> ~/.bash_logout
	{ [[ -r /etc/inputrc ]]           && cat /etc/inputrc           > ~/.inputrc; }     || :> ~/.inputrc
	rm -rf ~/.bash_ppp_command
	rm -rf ~/.bash_aliases
	rm -rf ~/.local/share/mc/bashrc
	rm -rf ~/.config/gtk-3.0/gtk.css



