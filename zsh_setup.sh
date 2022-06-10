#!/bin/bash
set -Eeuo pipefail

wdir=${PWD}

# zsh install
sudo apt install zsh

# oh-my-zsh install
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/jocelynmallon/zshmarks.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zshmarks
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

# nerdfont install
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip" -O font.zip
unzip font.zip -d ~/.local/share/font
rm font.zip
fc-cache -f -v

touch ~/.zprofile


