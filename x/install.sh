#!/usr/bin/env bash

# Variables
DOTFILES_DIR="$HOME/.dotfiles";
INSTALL_DIR="$HOME"

# If the installation directory doesn't exist, create it.
if [[ ! -d "$INSTALL_DIR" ]]; then
  mkdir -p $INSTALL_DIR;
fi

cd $INSTALL_DIR;

# Get the dotfiles.
wget 'https://github.com/aideng1694/dotfiles/archive/master.zip' -O dotfiles.tmp.zip -o /dev/null;
unzip dotfiles.tmp.zip -d $DOTFILES_DIR;
rm -f dotfiles.tmp.zip;

# Run the dotfiles install script
bash "$INSTALL_DIR/script/install.sh";
