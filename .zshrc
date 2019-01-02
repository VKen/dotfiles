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

#alias mrtun='ssh -p 8443 kenneth@103.241.63.30 -L 8003:54.255.22.178:80 -N' # Production
alias mrtun='ssh -p 8443 kenneth@103.241.63.30 -L 8003:54.255.23.167:80 -N &' # Staging
alias mrftp='ssh -p 8443 kenneth@103.241.63.30 -D 8005 -N &' # SSH Tunneling for FTP SOCKS 5 Proxy
alias mrdb='ssh -p 8443 kenneth@103.241.63.30 -L 3307:54.254.126.165:3306 -N &' # MRDB  #can't use rds host name, have to use ip
alias tunweb2py1='ssh -p 8443 kenneth@103.241.63.30 -L 2345:127.0.0.1:2345'  # bridge
alias tunweb2py2='ssh kenneth@192.168.101.210 -L 2345:127.0.0.1:8976'  # to be run on jump server after bridging
alias tunweb2py='ssh -t -t -p 8443 kenneth@103.241.63.30 -L 2345:127.0.0.1:2345 ssh kenneth@192.168.101.210 -L 2345:127.0.0.1:8976'  # combined tunnelling
alias tunRadiusFailover='ssh -t -t -p 8443 kenneth@103.241.63.30 -L 5433:127.0.0.1:2346 ssh kenneth@192.168.101.210 -L 2346:192.168.101.209:5432'  # combined tunnelling
alias tunRadius1='ssh -t -t -p 8443 kenneth@103.241.63.30 -L 5434:127.0.0.1:2347 ssh kenneth@192.168.101.210 -L 2347:192.168.101.153:5432'  # combined tunnelling
alias tunRadius2='ssh -t -t -p 8443 kenneth@103.241.63.30 -L 5434:127.0.0.1:2347 ssh kenneth@192.168.101.210 -L 2347:192.168.101.154:5432'  # combined tunnelling
#alias mrdb='ssh -p 8443 kenneth@103.241.63.30 -L 3307:myrepublicdb.ckuan079dhtb.ap-southeast-1.rds.amazonaws.com:3306 -N &' # MRDB
alias mrjump1='ssh -p 8443 kenneth@103.11.48.123'  # old jump server
alias mrjump2='ssh -p 8443 kenneth@103.241.63.30'  # OPCO
alias mrjump3='ssh -p 8443 kenneth@103.11.48.187'  # for MROSS
#alias voipApiServer='ssh root@103.7.203.6'
alias tunvoipApiServer='ssh -p 8443 kenneth@103.11.48.123 -L 7777:103.7.203.6:22'
#alias mrvoiptun=''
alias tunMROSSDB='ssh -p 8443 kenneth@103.11.48.123 -L 2346:192.168.100.122:5432' # local network
alias tunMROSS='ssh kenneth@103.11.48.123 -p 8443 -L 58988:103.11.48.186:58988'  # public address
alias tunMROSSWeb='ssh -t -t -L18680:127.0.0.1:18680 kenneth@103.11.48.123 -p8443 ssh -L 18680:127.0.0.1:8001 kenneth@192.168.100.186'

alias tunmrapigit='ssh -p 8443 kenneth@103.241.63.30 -L 4567:192.168.101.210:22' # git tunnel

alias tunfnp='ssh -t -t -p 8443 kenneth@103.241.63.30 -L 2345:127.0.0.1:2345 ssh root@fnp.myrepublic.com.sg'  # direct to fnp server
alias tunopennet='ssh -t -t -p 8443 kenneth@103.241.63.30 -L 1234:127.0.0.1:2345 ssh kenneth@192.168.101.210 -L 2345:202.79.218.232:8680'  # opennet soap endpoint

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

# ack open
ack-open() {
    local x="`ack -l $* | xargs`"
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
