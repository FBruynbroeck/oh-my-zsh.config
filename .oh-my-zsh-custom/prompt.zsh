svn_status() {
    local rev branch
    if in_svn; then
        rev=$(svn_get_rev_nr)
        branch=$(svn_get_branch_name)
        if [ `svn_dirty_choose_pwd 1 0` -eq 1 ]; then
            echo -n "$rev@$branch"
            echo -n "±"
        else
            echo -n "$rev@$branch"
        fi
    fi
}

gitlab_status() {
    if [[ -d '.git' ]]; then
        URL=`git remote -v | awk '/fetch/{print \$2}' | sed -e 's@/@%2F@' | sed -e 's@:@/api/v4/projects/@' | sed -Ee 's#(git@|git://)#http://#' -e 's@org:@org/@' -e 's@com:@com/@' -e 's@be:@be/@' -e 's@.git$@/pipelines@' 2>/dev/null`
        TOKEN=`cat ~/.gitlabtoken 2>/dev/null`
        SHA=`git log -n 1 --pretty=format:"%H" 2>/dev/null`
        SHA=${1:-$SHA}
        STATUS=`curl --connect-timeout 1 --header "PRIVATE-TOKEN: $TOKEN" -s "$URL" 2>/dev/null | jq '.[]|select(.sha=="'$SHA'")' 2>/dev/null | jq .status 2>/dev/null`
        if [[ "$STATUS" == '"success"' ]]; then
            echo -n $emoji[thumbs_up_sign]
        elif [[ "$STATUS" == '"failed"' ]]; then
            echo -n $emoji[thumbs_down_sign]
        elif [[ "$STATUS" == '"running"' ]]; then
            echo -n $emoji[fisted_hand_sign]
        elif [[ "$STATUS" == 'null' ]]; then
            echo -n $emoji[pile_of_poo]
        fi
    fi
}

sh_status() {
    if [ $VIM ]; then
        echo -n $emoji[high_voltage_sign]
    fi
}

git_status() {
    # Use haskell. More info https://github.com/olivierverdier/zsh-git-prompt#haskell-optional
    GIT_PROMPT_USE_PYTHON='haskell'
    source $ZSH_CUSTOM/plugins/zsh-git-prompt/zshrc.sh
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
    ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[yellow]%}✚"
    echo -n `git_super_status`
}

username() {
    echo -n "%{$fg[cyan]%}%n%{$reset_color%}"
}

arrow() {
    echo -n " %{$fg[blue]%}➜ %{$reset_color%}"
}

current_path() {
    echo -n "%{$fg[green]%}%5~%{$reset_color%}"
}

build_prompt() {
    username
    arrow
    current_path
    git_status
    svn_status
    gitlab_status
    sh_status
    echo -n " » "
}

function chpwd {
  if [[ -d '.git' ]]; then
      git fetch --quiet &> /dev/null &!
  fi
}
