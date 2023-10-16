#!/bin/bash

echo "copying dotfiles"

wdir=${PWD}

touch ~/.zprofile

cp ${wdir}/vimrc 		${HOME}/.vimrc
cp ${wdir}/lvim.config.lua 	${HOME}/.config/lvim/config.lua
cp ${wdir}/tmux.conf 		${HOME}/.tmux.conf
cp ${wdir}/zshrc 		${HOME}/.zshrc

echo "dotfiles copied"
