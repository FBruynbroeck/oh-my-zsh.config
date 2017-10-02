# -------------------------------------------------------------------
# ALIAS
# -------------------------------------------------------------------
local buildout="~/buildout"

# Custom Alias
alias affinitic="cd ${buildout}/AFFINITIC; l"
alias arsia="cd ${buildout}/ARSIA; l"
alias gdl="cd ${buildout}/GDL; l"
alias cdv="cd ${buildout}/CADREDEVILLE; l"
alias finder="open -a finder ."
alias gdw="cd ${buildout}/GDW; l"
alias imio="cd ${buildout}/IMIO; l"
alias ric="cd ${buildout}/RIC; l"
alias bin/test="bin/test -c"
# PostgreSQL
alias postgres-silent='pg_ctl start -D /opt/local/pgsql/data/ > /dev/null &'
alias postgres-stop='pg_ctl stop -D /opt/local/pgsql/data/'
# Trac
alias t='trac_search arsia.affinitic'
alias ta='trac_search affinitic'
# Remove swp files
alias rmswp='find . -name "*.swp" -exec rm -rf {} \;'
# Shortcut version
alias copy-version="echo \`cat setup.py | grep 'name=' | cut -d \' -f2; cat setup.py | grep dev | awk '{print \$3}' | sed -r \"s/^'//;s/.{6}$//\"\` | pbcopy"
# Thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
# PostgresSQL cerise
alias psql-cerise-start="cd ${buildout}/ARSIA/docker-cerise-postgres && make up && cd -"
alias psql-cerise-stop="cd ${buildout}/ARSIA/docker-cerise-postgres && make stop && cd -"
# Git
alias gh="git remote -v | awk '/fetch/{print \$2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@org:@org/@' -e 's@com:@com/@' -e 's@be:@be/@' -e 's@\.git\$@@'"
# Vim
alias vimgst="vim \`git status --short | awk '{print \$2}'\`"
