#!/bin/bash

#
# setup for my Raspberry Pi web server (rasp62)
#

echo ""
log "Setting up machine-specifics using $machine_name"


###################################################
### myrc settings                               ###
###################################################

log "   setting bash colors"
# set bash colors
set_not_env 'PS1_COLOR_NAME'    '"\[\033[01;32m\]"' # Green
set_not_env 'PS1_COLOR_DIR'     '"\[\033[01;32m\]"' # Green
set_not_env 'PS1_COLOR_PROMPTU' '"\[\033[01;32m\]"' # Green (user prompt)
set_not_env 'PS1_COLOR_PROMPTR' '"\[\033[01;31m\]"' # Red   (root prompt)
set_not_env 'PS1_COLOR_CMD'     '"\[\033[00m\]"'    # White
set_not_env 'PS1_NAME'          '"rasp62 "'
set_not_env 'PS1_DIR'           '"\W"'
set_not_env 'PS1_PROMPT_USER'   '"\$ "'
set_not_env 'PS1_PROMPT_ROOT'   '"# "'


###################################################
### ascii art Message Of The Day                ###
###################################################

log "generating MOTD"
sudo sh motd_generator


###################################################
# from this point, only time consuming task     ###
# so confirmation is asked for each one         ###
# this can be avoided by calling script with -y ###
###################################################

###################################################
### package purgin                              ###
###################################################

echo ""
log "Purging unused packages"

function apt_purge {
	cat $machine/apt_purge | xargs sudo apt-get --yes purge
	sudo apt-get --yes autoremove
	sudo apt-get --yes autoclean
	sudo apt-get --yes clean
}

op_ask 'Run apt purge for $machine_name/apt_purge?' apt_purge


###################################################
### package instalation                         ###
###################################################

echo ""
log "Package installation"


function apt_update {
	log "   update"
	sudo apt-get update
	log "   upgrade"
	sudo apt-get upgrade
	log "dist-upgrade"
	sudo apt-get dist-upgrade
}

op_ask 'Run apt update/upgrade/dist-upgrade? ' apt_update

function apt_packages {
	log "   package install"
	cat $machine/apt_list | xargs sudo apt-get --yes install
}

op_ask "Run apt install for $machine_name/apt_list?" apt_packages

###################################################
### RVM/Ruby/ROR                                ###
###################################################

function rvm {
	log "   rvm (with rails)"
	curl -L https://get.rvm.io | sudo bash -s stable --rails
}

op_ask "Install RVM with Ruby on Rails?      " rvm