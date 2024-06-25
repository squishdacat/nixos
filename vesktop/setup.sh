#!/bin/sh

VSH=$HOME/.config/vesktop/

# Check if dir exists
if [ ! -d $VSH ]; then
  mkdir -p $VSH
fi


ln -s $(pwd)/settings $VSH
ln -s $(pwd)/themes $VSH

