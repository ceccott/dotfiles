#!/bin/bash
set -Eeuo pipefail

wdir=${PWD}

ln -sf ${wdir}/.vimrc 		${HOME}/
ln -sf ${wdir}/.tmux.conf 	${HOME}/
ln -sf ${wdir}/.zshrc 		${HOME}/

#setup vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "dotfiles linked"
