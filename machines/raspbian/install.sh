#!/bin/bash

#
# setup for my Raspberry Pi web server (rasp62)
#

echo "generating MOTD"
sudo sh $machine/motd_generator

op_ask "Run apt purge for $machine/apt_purge?" apt_purge
op_ask "Run apt update/upgrade/dist-upgrade?" apt_update
op_ask "Run apt install for $machine_name/apt_install?" apt_packages
op_ask "Install RVM with Ruby on Rails?" rvm
