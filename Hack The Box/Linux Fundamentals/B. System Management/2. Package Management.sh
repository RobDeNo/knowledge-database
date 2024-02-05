dpkg	    # The dpkg is a tool to install, build, remove, and manage Debian packages. The primary and more user-friendly front-end for dpkg is aptitude.
apt	        # Apt provides a high-level command-line interface for the package management system.
aptitude	# Aptitude is an alternative to apt and is a high-level interface to the package manager.
snap	    # Install, configure, refresh, and remove snap packages. Snaps enable the secure distribution of the latest apps and utilities for the cloud, servers, desktops, and the internet of things.
gem	        # Gem is the front-end to RubyGems, the standard package manager for Ruby.
pip	        # Pip is a Python package installer recommended for installing Python packages that are not available in the Debian archive. It can work with version control repositories (currently only Git, Mercurial, and Bazaar repositories), logs output extensively, and prevents partial installs by downloading all requirements before starting installation.
git	        # Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals.

#checking the list of repositories
cat /etc/apt/sources.list
# APT uses apt cache database(used for ofline package view0)
apt-cache search impacket
apt-cache show impacket-scripts #view additional information
apt list --installed #list all installed packges
sudo apt install impacket-scripts -y #searching for packagaes that are missing and installing them

### GIT ###
when working ith a GIT clone, make a folder and download the clone into that directory
mkdir ~/nishang/ && git clone https://github.com/samratashok/nishang.git ~/nishang

### DKPG ###
you can download the TOOLS and PROGRAMS seperatly
wget http://archive.ubuntu.com/ubuntu/pool/main/s/strace/strace_4.21-1ubuntu1_amd64.deb
    # this method runs a wget to grab the package
    sudo dpkg -i strace_4.21-1ubuntu1_amd64.deb 
    # after downloading the file you will use the dkpg to install the .deb file
    strace -h
    #checking to make sure the program runs properly
mkdir ~/winrm && git clone https://github.com/Hackplayers/evil-winrm.git ~/winrm


