#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles";
BACKUP_DIR="$DOTFILES_DIR/backups";

# Bash Files
rm -r "$DOTFILES_DIR/bash";

# Git Files
rm -r "$DOTFILES_DIR/git";

# Vim Files
rm -r "$DOTFILES_DIR/vim";

# NodeJS Files
rm -r "$DOTFILES_DIR/node";

# Save the backup dir from the git clone
mv $BACKUP_DIR /tmp/dotfiles_backup

# Re-download dotfiles directory
echo -e "\033[0;36mDownloading dotfiles...\033[0m";

git clone git://github.com/aideng1694/dotfiles.git $DOTFILES_DIR

# Restore backup dir
mv /tmp/dotfiles_backup $BACKUP_DIR;

# Update user
echo -e "\033[0;36mComplete! Changes will take effect the next time you launch your terminal.\033[0m";
