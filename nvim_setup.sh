#!/bin/bash
set -xEeuo pipefail

mkdir -p ~/.config/nvim/site/autoload
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/colors

python3 -m pip install --user --upgrade pynvim


# vim-plug install
sh -c 'curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

wdir=${PWD}
ln -sf ${wdir}/nvim/init.vim 	${HOME}/.config/nvim/
ln -sf ${wdir}/nvim/custom_snippets 	${HOME}/.config/nvim/

# install nvim plugins
vim +PlugInstall +qall

echo "neovim setup complete"
