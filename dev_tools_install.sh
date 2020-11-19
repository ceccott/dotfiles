#!/bin/bash

# pkg install
apt-get update


DEV_TOOLS="vim neovim git tmux ctags sshfs tmuxinator cmake python python3-pip nodejs ghex dconf-cli uuid-runtime\
 zsh meld"

apt-get install $DEV_TOOLS


apt-get autoclean
echo "pkg install done ..."


# git config
git config --global user.name ceccott
git config --global user.email ceccott@gmail.com

# 3rd party repos
cd ~
git clone git@github.com:ceccott/dotfiles.git
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/jocelynmallon/zshmarks.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zshmarks
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# bash -c  "$(wget -qO- https://git.io/vQgMr)"
echo "3rd party done ..."


# python packages
pip3 install numpy scipy pandas matplotlib seaborn jinja2 ipython jupyterlab 

#linking

echo "linking done ..."
