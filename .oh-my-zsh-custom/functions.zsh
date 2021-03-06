# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

# Return my IP address
function myip() {
     ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# Trac search
function trac_search() {

  # get the open command
  local open_cmd
  if [[ $(uname -s) == 'Darwin' ]]; then
    open_cmd='open'
  else
    open_cmd='xdg-open'
  fi

  local url="http://trac.$1.be/trac/ticket/"

  # no keyword provided, simply open the search engine homepage
  if [[ $# -le 1 ]]; then
    $open_cmd "$url"
    return
  fi
  shift   # shift out $1

  while [[ $# -gt 0 ]]; do
    url="${url}$1+"
    shift
  done

  url="${url%?}" # remove the last '+'

  $open_cmd "$url"
}

function change_base_buildout_version() {
    gsed -i "s:buildout.cerise.base/raw/[0-9.]*:buildout.cerise.base/raw/$1:g" *.cfg && git ci -a
}

function clone() {
  git clone git@git.affinitic.be:arsia/$1.git
}

# Exclude bad commands from history
function zshaddhistory() {
    whence ${${(z)1}[1]} >| /dev/null || return 1
}

# Forces the user to type exit or logout
set -o ignoreeof
