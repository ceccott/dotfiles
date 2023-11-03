#! /usr/bin/bash

INSTALL_ROOT=$(pwd)
WGET_DST_FOLDER='.'
APT_REQ_PKGS='git make python3-pip npm nodejs cargo curl vim zsh cmake tmux clangd build-essential gettext'
PIP_REQ_PKGS='numpy'

echo "-> APT PACKAGES INSTALL"

sudo apt install -y $APT_REQ_PKGS

echo "-> PYTHON PACKAGES INSTALL"
sudo pip3 install $PIP_REQ_PKGS

echo "-> OH-MY-ZSH INSTALL"
rm -rf $HOME/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
echo 'export PATH=/home/leonardo/.local/bin:$PATH' >> $HOME/.zshrc

echo "-> NVIM AND LUNAR VIM INSTALL"
if [[ $(nvim --version | head -n 1) != 'NVIM v0.9.4' ]]; then
  wget https://github.com/neovim/neovim/archive/refs/tags/stable.tar.gz -O $WGET_DST_FOLDER/nvim-stable.tar.gz
  tar -xf nvim-stable.tar.gz
  cd neovim-stable
  make -s CMAKE_BUILD_TYPE=Release
  sudo make install
  cd $INSTALL_ROOT
fi
# LUNARVIM
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) --yes

# CLEANUP
echo "-> CLEANUP"
sudo rm -rf neovim-stable nvim-stable.tar.gz
