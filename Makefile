all: ~/.profile ~/.bashrc ~/.bash_logout ~/.bash_ppp_command ~/.bash_aliases

~/.%: ./%
	./pprint $< > $@
