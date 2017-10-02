if [ $VIM ]
then
    SH="⚡ "
fi

# http://www.anishathalye.com/2015/02/07/an-asynchronous-shell-prompt/

setopt prompt_subst # enable command substition in prompt

RPROMPT='[%*]'
PROMPT='' # no initial prompt, set dynamically

ASYNC_PROC=0
function precmd() {
    function async() {
        # Use haskell. More info https://github.com/olivierverdier/zsh-git-prompt#haskell-optional
        GIT_PROMPT_USE_PYTHON='haskell'
        # export ZSH_THEME_GIT_PROMPT_CACHE=1
        source $ZSH_CUSTOM/plugins/zsh-git-prompt/zshrc.sh
        # git theming
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$reset_color%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%} "
        ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
        ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[yellow]%}✚"
        # save to temp file
        printf "%s" "%{$fg[cyan]%}%n%{$fg[blue]%} ➜ %{$fg[green]%}%5~%{$reset_color%} $(git_super_status)$SH» " > "${HOME}/.zsh_tmp_prompt"

        # signal parent
        kill -s USR1 $$
    }

    # do not clear PROMPT, let it persist

    # kill child if necessary
    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi

    # start background computation
    async &!
    ASYNC_PROC=$!
}

function TRAPUSR1() {
    # read from temp file
    PROMPT="$(cat ${HOME}/.zsh_tmp_prompt)"

    # reset proc number
    ASYNC_PROC=0

    # redisplay
    zle && zle reset-prompt
}
