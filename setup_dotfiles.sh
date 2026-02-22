#!/bin/bash

#set -e

echo "linking dotfiles"

wdir=${PWD}

touch ~/.zprofile

ln -sf ${wdir}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${wdir}/.zshrc ${HOME}/.zshrc

echo "dotfiles linked"
