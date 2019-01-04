# Path to your oh-my-zsh configuration.
export ZSH=$HOME/projects/repos/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="dogenpunk"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# ibus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#ibus-daemon -drx

#PATH=$PATH:/home/kenneth/google_appengine
PATH=$PATH:/home/kenneth/bin
#PATH=$PATH:/var/lib/gems/1.8/bin
export PIP_RESPECT_VIRTUALENV=true

# updated ruby version
PATH=$PATH:/home/kenneth/.gem/ruby/2.2.0/bin
# PsySH for php
PATH=$PATH:/home/kenneth/.composer/vendor/bin

# fix grep
my_grep_options=(--color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn)
alias grep='grep $my_grep_options' egrep='grep -E $my_grep_options' fgrep='grep -F $my_grep_options'

# Alias

alias prs='python manage.py runserver'
#alias psp='python manage.py shell_plus'
#alias prsp='python manage.py runserver_plus'
alias prs2.5='python2.5 manage.py runserver'
alias pyserv='python2 -m SimpleHTTPServer'
alias aprs='sudo /etc/init.d/apache2 restart'


# Functions

# open project
opj() {
    deactivate 2> /dev/null
    cd ~/projects/
    if [[ $# -eq 1 ]]; then
        cd $1
        if [ -d 'env' ]; then
            source env/bin/activate 2> /dev/null
        fi
    fi
    if ls ./apps/settings 2> /dev/null | grep -q "dev_kenneth"; then
        export DJANGO_SETTINGS_MODULE=apps.settings.dev_kenneth
    fi

    if ls ./.env 2> /dev/null; then
        # export environmental variables for django=configurations
        export "$(cat .env | grep -v ^# | grep -v ^$ | xargs -0)"
    fi
}

# opj auto-completion
_opj() {
    _files -/ -W '/home/kenneth/projects/'
}

#open repo
opr() {
    deactivate 2> /dev/null
    cd ~/projects/repos/
    if [[ $# -eq 1 ]]; then
        cd $1
    fi
}
#open repo auto-completion
_opr() {
    _files -/ -W '/home/kenneth/projects/repos/'
}

# autocompletion linking
compdef _opj opj
compdef _opr opr

prsp() {
    if ls ./apps/settings | grep -q "dev_kenneth"; then
        python manage.py runserver_plus --settings=apps.settings.dev_kenneth
    else
        python manage.py runserver_plus
    fi
}

psp() {
    if ls ./apps/settings | grep -q "dev_kenneth"; then
        python manage.py shell_plus --settings=apps.settings.dev_kenneth
    else
        python manage.py shell_plus
    fi
}

# django runserver
djrs() {
    if grep -q "django_extensions" settings*.py; then
        python manage.py runserver_plus $*
    else
        python manage.py runserver_plus  $*
    fi
}

# ack-grep open
ack-open() {
    local x="`ack-grep -l $* | xargs`"
    if [[ -n $x ]]; then
        command gvim -c `echo "/$*[-1]"` `echo "$x"`
    else
        echo "no files found"
    fi
}

# activate env and export .env file variables if any
ea() {
    if ls | grep -q 'env'; then
        source ./env/bin/activate
    fi
    if ls ./.env 2> /dev/null | grep -q '.env'; then
        export $(cat .env | grep -v ^# | xargs)
        echo 'populated django env vars'
    fi
}


dea() {
    deactivate
    if ls ./.env 2> /dev/null; then
        unset $(cat .env | grep -v ^# | xargs)
        echo 'unset django env vars'
    fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export MAKEFLAGS="-j$(expr $(nproc))"

### make edits default to gvim
export VISUAL='gvim -f'
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
