# Bash dotfiles

Bash configuration files formally called as dotfiles intended for my use and backup.

# Usage

If you intend to use these files then clone the repository in your `HOME(~)`
folder.

    cd ~
    git clone git@github.com:joykabir/dotfiles.git

While in home path, create a file `.bashrc` with the following content:

    source ~/dotfiles/bashrc

And another file `.bash_profile` with the following content:

    PATH=/usr/local/bin:$PATH
    PATH=$HOME/bin:$PATH
    export PATH

  	if [ -f ~/.bashrc ];
  	then
  	    source ~/.bashrc
  	fi

Type `restart` and hit enter from bash.

# Contents

* git completion
* git branch parse
* smart bash colors for white background(I prefer white)
* `weather <city name>` shows weather
* `myip` shows your ip
* `up` goes one folder up (cd ..)
* `restart` sources .bashrc
* `lsm` executes ls -la
* `pyvenv` activates python virutalenv called **pyvenv** and
  upgrades all installed packages.
* more ...