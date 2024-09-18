#! /bin/bash


APT_PKGS='dconf-cli uuid-runtime'
PIP_PKGS='spotify-cli-linux'
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip"
GNOME_TERMINAL_THEME_NUM=224

echo "-> APT INSTALL"
#sudo yum install -y $APT_PKGS

echo "-> PIP INSTALL"
sudo pip3 install $PIP_PKGS

echo "-> NERD FONT INSTALL"
mkdir $HOME/.fonts
wget $NERD_FONT_URL  -O font.zip
unzip font.zip -d ~/.fonts/
fc-cache -fv

echo "-> GNOME-TERMINAL THEME INSTALL"
echo $GNOME_TERMINAL_THEME_NUM | TERMINAL=gnome-terminal bash -c "$(wget -qO- https://git.io/vQgMr)"

echo "->TMUX CONFIG"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "->VIM CONFIG"
mkdir -p .vim/tmp
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "->ZSH AND SPACESHIP PROMPT CONFIG"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/jocelynmallon/zshmarks.git ${ZSH_CUSTOM}/plugins/zshmarks
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM}/plugins/zsh-vi-mode
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#CLEANUP
rm font.zip
