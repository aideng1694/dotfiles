#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles";

# Restore files
echo -e "\033[0;36mRestoring up old dotfiles from \033[0;34m$BACKUP_DIR\033[0m";

# Bash Files
rm -r "$DOTFILES_DIR/bash";

# Git Files
rm -r "$DOTFILES_DIR/git";

# Vim Files
rm -r "$DOTFILES_DIR/vim";

# NodeJS Files
rm -r "$DOTFILES_DIR/node";

# Remove dotfiles directory
echo -e "\033[0;36mDownloading dotfiles...\033[0m";

wget 'https://github.com/aideng1694/dotfiles/archive/master.zip' -O dotfiles.tmp.zip -o /dev/null;
unzip dotfiles.tmp.zip -d $DOTFILES_DIR;
rm -f dotfiles.tmp.zip;

# Update user
echo -e "\033[0;36mComplete! Changes will take effect the next time you launch your terminal.\033[0m";
