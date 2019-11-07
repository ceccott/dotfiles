#!/bin/bash
set -Eeuo pipefail

wdir=${PWD}

ln -sf ${wdir}/.vimrc 		${HOME}/
ln -sf ${wdir}/.tmux.conf 	${HOME}/
ln -sf ${wdir}/.zshrc 		${HOME}/
ln -sf ${wdir}/nvim 		${HOME}/.config/ 

echo "dotfiles linked"


