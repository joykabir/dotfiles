
# Bash profile for login shells
# Mainly intended for MacOS.

# Path
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Export Sublime text editor as default
# Before that download and install sublime
# And set as default OS Terminal editor
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
export EDITOR='sublime -w'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LANGUAGE='en_US.utf-8'
  export LC_ALL='en_US.UTF-8'
fi

if [ -f ~/.bashrc ];then
  source ~/.bashrc
fi
