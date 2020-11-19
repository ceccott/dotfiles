#!/usr/bin/env bash

# vim plug install
curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo -E su

pip3 install pynvim
pip3 install jedi
pip3 install yapf
pip3 install pylint
pip3 install cpplint

#ccls install
#cd /tmp
#git clone --depth=1 --recursive https://github.com/MaskRay/ccls
#cd ccls
#wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
#tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
#cmake -H. -BRelease -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
#cmake --build Release --target install
