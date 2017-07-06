## DOTFILES

Bash configuration files that I use for MacOS and backup in this repo.

### Contents

1. `bashrc`

   Bash config file excuted both for login and non-login shells.
   This file sources other dot files. Read this well-written blog
   about [bash configurations.](http://dghubble.com/blog/posts/.bashprofile-.profile-and-.bashrc-conventions/)

2. `bash_profile`

   Contains PATH variable settings and sources `.bashrc` file.

3. `bash_aliases`

    Contains all of my utility aliases

4. `bash_prompt`

    Contains color and font settings for the bash prompt. This works
    best on white background (I prefer white).

5. `gitconfig`

    The global git config file that should be placed in home path

6. `gitignore`

    Global git ignore file should be palced in home path.

7. `install.sh`

    Install script that creates symbolic links to the above dot files. The script
    backups existing dot files.

### Usage

Clone the repository in a preferred location. Run the install.sh that will create
dotfiles in home path and will add symbolic links.

    ./install.sh OR bash install.sh


### Note

Get the git-completion.bash file and copy in home folder before
install.sh is executed. The `.bashrc` file sources the `git-completion.bash` file.

    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash


### Acknowledgement

* https://github.com/sebdah/dotfiles
* https://github.com/mathiasbynens/dotfiles

### Warning

The codes should be reviewed first. The scripts should not be used without knowing what they entail.