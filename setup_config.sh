
#!/bin/bash

#set -e

echo "-- linking folders in config --"

wdir=${PWD}
CFG_DIR=${wdir}/config

for cdir in "$CFG_DIR"/*/ ; do
  dir_name=$(basename "$cdir")
  echo "linking $dir_name"
  ln -sf $cdir $HOME/.test/$dir_name
done

echo "-- configs linked --"
