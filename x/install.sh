#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles";
INSTALL_DIR="$HOME"

if [[ ! -d "$INSTALL_DIR" ]]; then
  mkdir -p $INSTALL_DIR;
fi

cd $INSTALL_DIR;

wget 'https://github.com/aideng1694/dotfiles/archive/master.zip' -O dotfiles.tmp.zip -o /dev/null;
unzip dotfiles.tmp.zip -d $DOTFILES_DIR;
rm -f dotfiles.tmp.zip;
