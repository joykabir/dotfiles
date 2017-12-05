
# Bash profile for login shells
# Mainly intended for MacOS.

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Make sure pip packages are installed in virtualenv
export PIP_REQUIRE_VIRTUALENV=true

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
