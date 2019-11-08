#!/bin/bash
set -Eeuo pipefail

wdir=${PWD}

ln -sf ${wdir}/.vimrc 		${HOME}/
ln -sf ${wdir}/.tmux.conf 	${HOME}/
ln -sf ${wdir}/.zshrc 		${HOME}/
mkdir -p ${HOME}/.config/
ln -sf ${wdir}/nvim 		${HOME}/.config/ 

# vim plug install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "dotfiles linked"
echo "run plug install from nvim"
