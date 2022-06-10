#!/bin/bash
set -Eeuo pipefail

echo "updating..."

sudo apt update

wdir=${PWD}

touch ~/.zprofile

ln -sf ${wdir}/.vimrc 		${HOME}/
ln -sf ${wdir}/.tmux.conf 	${HOME}/
ln -sf ${wdir}/.zshrc 		${HOME}/

echo "dotfiles linked"

# tools setup
./zsh_setup.sh
./tmux_setup.sh
./nvim_setup.sh

sudo apt autoremove

# Terminal colors
#bash -c  "$(wget -qO- https://git.io/vQgMr)"

echo "tools configured"

