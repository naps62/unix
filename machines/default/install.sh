#!/bin/bash

#
# setup for my personal machine
#

echo ""
log "Setting up machine-specifics using $machine_name"


###################################################
### sym links                                   ###
###################################################

echo "   .latexmkrc"
ln_bak $myconfig/files/rc/latexmkrc $home/.latexmkrc

###################################################
### myrc settings                               ###
###################################################

log "   setting bash colors"
# set bash colors
set_not_env 'PS1_COLOR_NAME'    '"\[\e[01;34m\]"' # Blue
set_not_env 'PS1_COLOR_DIR'     '"\[\e[01;34m\]"' # Blue
set_not_env 'PS1_COLOR_PROMPTU' '"\[\e[01;32m\]"' # Green (user prompt)
set_not_env 'PS1_COLOR_PROMPTR' '"\[\e[01;31m\]"' # Red   (root prompt)
set_not_env 'PS1_COLOR_CMD'     '"\[\e[00m\]"'    # White
set_not_env 'PS1_COLOR_GIT'     '"\[\033[01;33m\]"' # Yellow
set_not_env 'PS1_NAME'          '"\u"'
set_not_env 'PS1_DIR'           '"\W"'
set_not_env 'PS1_GIT'           '"\$(__git_ps1)"'
set_not_env 'PS1_PROMPT_USER'   '"\$ "'
set_not_env 'PS1_PROMPT_ROOT'   '"# "'

log "   setting env vars"
# set clang as default compiler
#set_env 'CC'  'clang'
#set_env 'CXX' 'clang++'


###################################################
# from this point, only time consuming task     ###
# so confirmation is asked for each one         ###
# this can be avoided by calling script with -y ###
###################################################

###################################################
### package instalation                         ###
###################################################

echo ""
log "Package installation"

function apt_update {
	log "   update"
	sudo aptitude update
	log "   upgrade"
	sudo aptitude upgrade
	log "dist-upgrade"
	sudo aptitude dist-upgrade
}

op_ask 'Run apt update/upgrade/dist-upgrade? ' apt_update

function apt_packages {
	log "   package install"
	cat $machine/apt_list | xargs sudo aptitude install -y
}

op_ask "Run apt install for $machine_name/apt_list?" apt_packages

###################################################
### RVM/Ruby/ROR                                ###
###################################################

function rvm {
	log "   rvm (with rails)"
	curl -L https://get.rvm.io | bash -s stable --rails
}

op_ask "Install RVM with Ruby on Rails?      " rvm
