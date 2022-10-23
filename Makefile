all: ~/.profile ~/.bashrc ~/.bash_logout ~/.bash_ppp_command

~/.%: ./%
	./pprint $< > $@
