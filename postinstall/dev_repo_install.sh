#!/bin/bash

# repo clone

mkdir -p ~/Dev
cd ~/Dev

REPO_LIST="\
git@github.com:ceccott/stm32-controller.git\
 git@github.com:ceccott/ulog.git\
 git@github.com:ceccott/misc.git\
 git@github.com:ceccott/aoc2kXX.git\
 git@github.com:ceccott/musikontrol.git\
 git@github.com:ceccott/Phazyo_the_game.git\
 git@github.com:ceccott/Unity2DScripts.git\
 git@github.com:ceccott/unity-vim-tmux.git\
 git@github.com:ceccott/dashlord.git\
 git@github.com:ceccott/litelog.git\
 git@github.com:ceccott/litegraph.git\
 git@github.com:ceccott/wkspace.git\
 git@github.com:ceccott/Esmeralda.git\
"


for element in ${REPO_LIST}
do
  echo "clonning $element"
  git clone $element
done

echo "cloning done ..."
