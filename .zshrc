# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(git zshmarks vi-mode colorize)

source $ZSH/oh-my-zsh.sh

# User configuration

# ZSHMARKS config
alias jj="jump"
alias bb="bookmark"
alias bbd="deletemark"
alias bbs="showmarks"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/omw6xo/.vimpkg/bin

source ~/.zprofile
#source ~/.tmuxinator/tmuxinator.zsh

#disable ctrl s and ctrl q
stty -ixon
