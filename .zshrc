export ZSH=~/.oh-my-zsh
export UPDATE_TEMPLATEDIR_DAYS=8
export UPDATE_TEMPLATEDIR_CMD='~/.buildout/git.scripts/bin/reload_hooks ~/buildout/ARSIA'
ZSH_CUSTOM=~/.oh-my-zsh-custom
ZSH_THEME=francois
plugins=(git python web-search dirhistory tmux tmuxinator docker docker-compose autoenv update-git-templatedir ssh-agent)
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:~/.oh-my-vim/bin
autoenv_init
