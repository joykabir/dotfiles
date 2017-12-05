# Aliases for making command line pleasant.

# ls but better: add some color to your life.
if [ "$(uname -s)" == "Darwin" ]; then
  alias ls="ls -G"
else
  alias ls="ls --color=auto"
fi

alias lsm="ls -hlAFG"
alias cls="clear;lsm"

# Download webpage items
# Usage - download https://data.gov
alias download="wget --random-wait -r -p --no-parent -e robots=off -U mozilla"

# USAGE - weather cleveland OR weather 44106
weather() { curl wttr.in/"$1"; }

# myip: prints out your IP address
alias myip="curl icanhazip.com"

# Gets space left on disk
alias space="df -h"

# Recursively gets how much space is used
alias used="du -ch -d 1"

# incognito: no saving your command history!
incognito() {
  case $1 in
    start)
    set +o history;;
    stop)
    set -o history;;
    *)
    echo -e "USAGE: incognito start - disable command history.
       incognito stop  - enable command history.";;
  esac
}

# pman: render the given manpage in Preview.app
if [ "$(uname -s)" == "Darwin" ]; then
  pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
fi

# reveal: Finder, open current folder programmaticaly.
if [ "$(uname -s)" == "Darwin" ]; then
  alias reveal="open ."
fi

# Get libs versions
alias libversions='
    java -version;
		git --version;
		node --version;
		npm --version;
    gradle --version;
    python --version;
    pytest --version;
    pylint --version;
		uname -a;
	'
# extract:  Extract most known archives with one command
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Improving the terminal for fast typers
# --------------------------------------
alias cd..='cd ../'                         # Go back 1  level
alias ..='cd ../'                           # Go back 1  level
alias ...='cd ../../'                       # Go back 2  levels
alias .3='cd ../../../'                     # Go back 3  levels
alias .4='cd ../../../../'                  # Go back 4  levels
alias .5='cd ../../../../../'               # Go back 5  levels
alias .6='cd ../../../../../../'            # Go back 6  levels
alias c='clear'
alias show_options='shopt'
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat' # make10mb:     Creates a file of 10mb size (all zeros)

# Get top process eating memory
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'

# Python server
# --------------------------------------------
alias server='python -m SimpleHTTPServer 8000'

# Start calculator with math support
alias bc='bc -l'

# My python virtualenv
function cvenv() {
  cd ~/ebwork/cd-develop/aws_scripts/Golem
  source ~/venv/cd-aws/bin/activate
  pip install -U pip ; pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}

# Auto run unit tests and pylint

golem_test() {
    covfile=`find_file_up .coveragerc`
    if [ $# = 0 ]; then
                if [ -n "$covfile" ]; then
            py.test -n auto --cov-config $covfile --cov=golem golem
                else
                    py.test -n auto --cov=golem golem
                fi
                coverage report
    else
                TFILE=`find_file_down $1 test_`
                if [ -z "$TFILE" ]; then
                   echo "File not found."
                else
                    if [ -n "$covfile" ]; then
                py.test --cov-report=annotate --cov-config $covfile --cov=golem $TFILE
                    else
                py.test --cov-report=annotate --cov=golem $TFILE
                    fi
                    coverage report -m `find_file_down $1`
                fi
    fi
}

golem_lint() {
    pylrc=`find_file_up .pylintrc`

    if [ -n "$pylrc" ]; then
        plcmd() {
                    pylint --rcfile $pylrc -j 0 -r n $1
                }
    else
        plcmd() {
                    pylint -j 0 -r n $1
                }
    fi

    if [ $# = 0 ]; then
        plcmd golem
    else
        plcmd `find_file_down $1`
    fi
}

find_file_up() {
    file=$1
    if [ $# = 1 ]; then
        path=$PWD
    else
        path=$2
    fi

    if [ -e $path/$file ]; then
        echo $path/$file
    fi

    if [ "$path" == "/" ]; then
        echo
                return
    fi

    find_file $file `dirname $path`
}

find_file_down() {
    file=$1
    if [ $# = 1 ]; then
        prefix=""
    else
        prefix=$2
    fi

    echo `find golem -name $prefix$file.py -print -quit`
}

alias gl=golem_lint
alias gt=golem_test

# Pip global install
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

