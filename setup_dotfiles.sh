#!/bin/bash

set -e

echo "copying dotfiles"

wdir=${PWD}

touch ~/.zprofile

ln -sf ${wdir}/vimrc 		${HOME}/.vimrc
ln -sf ${wdir}/lvim.config.lua 	${HOME}/.config/lvim/config.lua
ln -sf ${wdir}/tmux.conf 		${HOME}/.tmux.conf
ln -sf ${wdir}/zshrc 		${HOME}/.zshrc

echo "dotfiles copied"
