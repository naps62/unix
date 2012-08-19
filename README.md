# linux-restore

Utility to restore my linux environments after a fresh install

## Structure

### linux-restore

main script. Running this will apply all the implemented setup to the current user.

Usage:

	linux-restore [-m <machine-name>] [-c] [-y]
	  -m <machine-name> machine config to use. defaults to "default"
	  -y skip confirmations
	  -b backup every replaced file
	  -h show this


### files

several common files (bashrc, ssh, vim, etc). Installer creates links to them



### machines

Machine specific installations. I use not only my laptop, but also several remote machines. Here i create a folder for each different environemnt i require, each one with the specific configurations for that environment. Corresponding script is called by the top level one
