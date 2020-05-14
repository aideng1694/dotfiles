#!/usr/bin/env bash

BACKUP_DIR="$HOME/.dotfiles/backups";
DOTFILES_DIR="$HOME/.dotfiles";
INSTALL_DIR="$HOME"

# Restore files
echo -e "\033[0;32mRestoring old dotfiles from \033[0;34m$BACKUP_DIR\033[0m";

# Bash Files
rm "$HOME/.bashrc";
rm "$HOME/.bash_profile";

mv "$BACKUP_DIR/bashrc" "$HOME/.bashrc";
mv "$BACKUP_DIR/bash_profile" "$HOME/.bash_profile";

# Git Files
rm "$HOME/.gitconfig";
rm "$HOME/.gitignore";

mv "$BACKUP_DIR/gitconfig" "$HOME/.gitconfig";
mv "$BACKUP_DIR/gitignore" "$HOME/.gitignore";

# Vim Files
rm "$HOME/.vimrc";

mv "$BACKUP_DIR/vimrc" "$HOME/.vimrc";

# NodeJS Files
rm "$HOME/.npmrc";

mv "$BACKUP_DIR/npmrc" "$HOME/.npmrc";

# Remove dotfiles directory
echo -e "\033[0;31mDeleting dotfiles directory...\033[0m";

rm -r $INSTALL_DIR

# Update user
echo -e "\033[0;35mComplete! Changes will take effect the next time you launch your terminal.\033[0m";
