#!/bin/bash

#set -e

echo "-- linking folders in config --"

wdir=${PWD}
CFG_DIR=${wdir}/config

mkdir -p "$HOME/.config"

for cdir in "$CFG_DIR"/*/; do
	dir_name=$(basename "$cdir")
	target="$HOME/.config/$dir_name"
	if [ -e "$target" ] || [ -L "$target" ]; then
		echo "$dir_name already linked or exists, skipping"
	else
		echo "linking $dir_name"
		ln -s "$cdir" "$target"
	fi
done

echo "-- configs linked --"
