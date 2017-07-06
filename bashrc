
# Don't enable any potentially breaking features
# if the shell session is non-interactive

if [[ $- != *i* ]] ; then
        return
fi

# Source extra configuration files

source ${HOME}/.bash_prompt
source ${HOME}/.bash_aliases

# Git completion, get from
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
