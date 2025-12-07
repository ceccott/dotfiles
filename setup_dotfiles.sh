#!/bin/bash

#set -e

echo "linking dotfiles"

wdir=${PWD}

touch ~/.zprofile

ln -sf ${wdir}/nvim/lua/ ${HOME}/.config/nvim/
ln -sf ${wdir}/.vimrc ${HOME}/.vimrc
ln -sf ${wdir}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${wdir}/.zshrc ${HOME}/.zshrc

echo "dotfiles linked"
