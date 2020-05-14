#!/usr/bin/env bash

# Variables
INSTALL_DIR="$HOME/.dotfiles";

# If the installation directory does exist, delete it.
if [ -d "$INSTALL_DIR" ]; then
  rm -r $INSTALL_DIR;
fi

cd $INSTALL_DIR;

# Get the dotfiles.
git clone 'git://github.com/aideng1694/dotfiles.git' $INSTALL_DIR

# Run the dotfiles install script
bash "$INSTALL_DIR/script/install.sh";
