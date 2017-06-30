# My dotfiles

Bash configuration files formally called as dotfiles intended for my use and backup.

# Usage

Clone the repository in your `HOME(~)` folder.

    cd ~
    git clone git@github.com:joykabir/dotfiles.git

While in home path, create a file `.bashrc` with the following content:

    source ~/dotfiles/dot/bashrc

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
* `space` shows available disk space in current path
* `used` shows used dick space in current path
* `update` upgrades installed packages via brew
* `lsm` executes ls -la
* `pyenv` activates python 2.7 virutalenv called **pyenv** and
  upgrades all installed packages. Assumes that virualenv is already
  installed.

      pip install virtualenv
