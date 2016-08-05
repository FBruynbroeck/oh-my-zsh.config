![Oh My Zsh](https://s3.amazonaws.com/ohmyzsh/oh-my-zsh-logo.png)

## Oh My Zsh

### Installation

Oh My Zsh is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

#### via curl

`curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`

#### via wget

`wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh`

### More information

Oh My Zsh: https://github.com/robbyrussell/oh-my-zsh

## My custom Zsh

### Installation

`cd ~/.oh-my-zsh`

`git clone git@bitbucket.org:FBruynbroeck/oh-my-zsh.config.git custom`

### Configuration (ZSHRC)

`vim ~/.zshrc`

`export ZSH=$HOME/.oh-my-zsh`

`ZSH_THEME="francois"`

`plugins=(git web-search dirhistory tmux tmuxinator docker docker-compose boot2docker autoenv)`

`source $ZSH/oh-my-zsh.sh`

### Configuration (ZSH-GIT-PROMPT)

After submodule init, run 'cabal build' from zsh-git-prompt folder

### Configuration (VPN for alias)

For Arsia, Affinitic and Maison:

- Install Viscosity
- Add Arsia, Affinitic and Maison in the configuration of your Viscosity

For Cirb:

- Install openconnect (brew install openconnect)
- Change your login in the vpn-cirb-start alias
- Insert your password in ~/.cirbvpnpass

### Configuration (Cerise DB for alias)

- Install docker (https://www.docker.com/products/docker-toolbox)
- Clone docker-cerise-postgres in your ~/buildout/ARSIA/ folder
