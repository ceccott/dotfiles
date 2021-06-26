#!/bin/bash
set -Eeuo pipefail

wdir=${PWD}

ln -sf ${wdir}/.vimrc 		${HOME}/
ln -sf ${wdir}/.tmux.conf 	${HOME}/
ln -sf ${wdir}/.zshrc 		${HOME}/
ln -sf ${wdir}/nvim/init.vim 	${HOME}/.config/nvim/
ln -sf ${wdir}/nvim/custom_snippets 	${HOME}/.config/nvim/

echo "dotfiles linked"


