# @todo: применять профиль терминала из дампа

all: ~/.profile ~/.bashrc ~/.bash_logout ~/.bash_ppp_command ~/.bash_aliases ~/.inputrc ~/.local/share/mc/bashrc


~/.inputrc: ./inputrc
	cp $< $@

~/.local/share/mc/bashrc: ./mc_bashrc
	cp $< $@

~/.%: ./%
	./pprint $< > $@
