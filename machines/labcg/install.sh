#!/bin/bash

#
# setup for my labcg machine
#

op_ask "Run apt update/upgrade/dist-upgrade?" apt_update
op_ask "Run apt install for $machine_name/apt_install?" apt_packages
op_ask "Install RVM?" rvm
op_ask "Install/Update spf13-vim?" spf13vim
