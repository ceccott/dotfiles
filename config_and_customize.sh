#! /bin/bash

NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip"

echo "-> NERD FONT INSTALL"
mkdir $HOME/.fonts
wget $NERD_FONT_URL -O font.zip
unzip font.zip -d ~/.fonts/
fc-cache -fv

echo "->TMUX CONFIG"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo "->ZSH AND SPACESHIP PROMPT CONFIG"
ZSH_CUSTOM="$HOME/.config/oh-my-zsh/custom"
git clone https://github.com/jocelynmallon/zshmarks.git ${ZSH_CUSTOM}/plugins/zshmarks
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM}/plugins/zsh-vi-mode
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#CLEANUP
rm font.zip
