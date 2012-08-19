#!/bin/bash

#
# setup for my personal machine
#

echo ""
log "Setting up machine-specifics using $machine_name"


###################################################
### myrc settings                               ###
###################################################

log "   setting bash colors"
# set bash colors
set_not_env 'PS1_COLOR_NAME'    '"\033[01;32m"' # Green
set_not_env 'PS1_COLOR_DIR'     '"\033[01;32m"' # Green
set_not_env 'PS1_COLOR_PROMPTU' '"\033[01;32m"' # Green (user prompt) no root access here :(
set_not_env 'PS1_COLOR_CMD'     '"\033[00m"'    # White
set_not_env 'PS1_NAME'          '"SeARCH "'
set_not_env 'PS1_DIR'           '"\W "'
set_not_env 'PS1_PROMPT_USER'   '"\$ "'

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
### install additional packages                 ###
###################################################

###################################################
### RVM/Ruby                                    ###
###################################################

function rvm {
	log "   rvm"
	curl -L https://get.rvm.io | bash -s stable --ruby
}

op_ask "Install RVM?" rvm