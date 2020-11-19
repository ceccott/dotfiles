#!/bin/bash

# pkg install
add-apt-repository -y ppa:numix/ppa
apt-get update

TOOLS_LIST="freecad gimp cpufreqd indicator-cpufreq gdebi xournal gparted curl qalculate"

MEDIA_LIST="snapd vlc mattermost-desktop"

ASPECT_LIST="numix-gtk-theme numix-icon-theme-circle papirus-icon-theme gnome-tweak-tool caffeine"

apt-get install -y $TOOLS_LIST
apt-get install -y $SW_LIST
apt-get install -y $ASPECT_LIST

apt-get autoclean
echo "pkg install done ..."

# 3rd party sw
wget https://github.com/meetfranz/franz/releases/download/v5.5.0/franz_5.5.0_amd64.deb
dpkg -i franz_5.5.0_amd64.deb
wget https://github.com/BoostIO/boost-releases/releases/download/v0.15.3/boostnote_0.15.3_amd64.deb
dpkg -i boostnote_0.15.3_amd64.deb
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
add-apt-repository 'deb https://typora.io/linux ./'
apt-get update && apt-get install typora
wget https://go.skype.com/skypeforlinux-64.deb
apt install -y ./skypeforlinux-64.deb
wget https://zoom.us/client/latest/zoom_amd64.deb
apt install -y ./zoom_amd64.deb
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
dpkg -i download\?dl=packages%2Fubuntu%2Fdropbox_2020.03.04_amd64.deb 
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update && sudo apt-get install -y spotify-client
wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9522/wps-office_11.1.0.9522.XA_amd64.deb
dpkg -i wps-office_11.1.0.9522.XA_amd64.deb
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
dpkg -i steam.deb

echo "3rd party done ..."


#linking

echo "linking done ..."
