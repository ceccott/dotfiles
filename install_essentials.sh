#! /usr/bin/bash

#set -e

INSTALL_ROOT=$(pwd)
WGET_DST_FOLDER='.'
APT_REQ_PKGS='git make kitty python3-pip npm nodejs cargo curl vim neovim zsh cmake tmux'

echo "-> APT PACKAGES INSTALL"

sudo pacman -Sy $APT_REQ_PKGS

echo "-> OH-MY-ZSH INSTALL"
ZSH=$HOME/.config/oh-my-zsh/
rm -rf $HOME/.config/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
chsh -s $(which zsh)
echo 'export PATH=~/.local/bin:$PATH' >> $HOME/.zprofile
