#!/bin/bash
set -Eeuo pipefail

sudo apt install tmux
sudo pip install spotify-cli-linux

wdir=${PWD}
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "tmux setup complete"
