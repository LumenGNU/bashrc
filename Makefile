SHELL=/bin/bash

# @todo: применять профиль терминала из дампа

all: ~/.profile \
     ~/.bashrc \
     ~/.bash_logout \
     ~/.bash_ppp_command \
     ~/.bash_aliases \
     ~/.inputrc \
     ~/.local/share/mc/bashrc


~/.inputrc: ./inputrc
	cp $< $@

~/.local/share/mc/bashrc: ./mc_bashrc
	cp $< $@

~/.bash_ppp_command: ./bash_ppp_command ./ansi_sequences.m4
	m4 ./ansi_sequences.m4 $(<) | ./pprint - | awk '{$$1=$$1};1' > $(@)

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



