# -------------------------------------------------------------------
# EXPORTS
# -------------------------------------------------------------------

local buildout="$HOME/.buildout"

# Terminale
export TERM=screen-256color

# Oracle
export ORACLE_HOME=$HOME/.oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export TNS_ADMIN="${buildout}/oracle/"

# User configuration
export PATH="/opt/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export EDITOR='/usr/bin/vim'
export SVN_EDITOR='/usr/bin/vim'
export OLDPWD=$HOME
export LSCOLORS=exfxcxdxbxegedabagacad

# Arsia
export ZOPE_DIRECTORY="${buildout}/zope"
export CLIENT_HOME="${buildout}/var/pass"
export PASSWORD_DIR="${buildout}/var/"

# History
export HISTFILE=$HOME/.history
export HISTIGNORE='mc:mc *:ps:du:su*:exit:ls:/tmp/*:cd *:cd'
export HISTSIZE=16384
export SAVEHIST=16384

# Postgres
export PGHOST='localhost'

# Virtualenv
export VIRTUALENV24='virtualenv-2.4'
export VIRTUALENV27='virtualenv-2.7'

# CC
export CC=/usr/bin/gcc

# SQL
export SA_MIN_LOG_SLOW_SQL=1

# Pentaho
export PENTAHO_SERVER_URL='http://localhost:8080/pentaho'

# Git
export GIT_AUTHOR_NAME='FBruynbroeck'
export GIT_AUTHOR_EMAIL='francois.bruynbroeck@hotmail.com'
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

# Trac
export TRAC_URL='http://trac.arsia.affinitic.be'

# Robot
export PLONE_CSRF_DISABLED=true
