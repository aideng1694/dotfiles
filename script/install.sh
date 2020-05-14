#!/usr/bin/env bash

# This scrip is to be ran locally. Another script actually downloads the repo. See `x/install.sh`

BACKUP_DIR="$HOME/.dotfiles/backups";
DOTFILES_DIR="$HOME/.dotfiles";
INSTALL_DIR="$HOME"

# Backup files
echo -e "\033[0;32mBacking up old dotfiles to \033[0;34m$BACKUP_DIR\033[0m";

# Make the backup dir
mkdir $BACKUP_DIR;

# Bash Files
mv "$HOME/.bashrc" "$BACKUP_DIR/bashrc";
mv "$HOME/.bash_profile" "$BACKUP_DIR/bash_profile";

# Git Files
mv "$HOME/.gitconfig" "$BACKUP_DIR/gitconfig";
mv "$HOME/.gitignore" "$BACKUP_DIR/gitignore";

# Vim Files
mv "$HOME/.vimrc" "$BACKUP_DIR/vimrc";

# NodeJS Files
mv "$HOME/.npmrc" "$BACKUP_DIR/npmrc";

# Symlink Files
echo -e "\033[0;32mSymlinking files to \033[0;34m$INSTALL_DIR\033[0m";

# Bash Files
ln -s "$DOTFILES_DIR/bash/bashrc" "$INSTALL_DIR/.bashrc";
ln -s "$DOTFILES_DIR/bash/profile" "$INSTALL_DIR/.bash_profile";

# Git Files
ln -s "$DOTFILES_DIR/git/gitconfig" "$INSTALL_DIR/.gitconfig";
ln -s "$DOTFILES_DIR/git/gitignore" "$INSTALL_DIR/.gitignore";

# Vim Files
ln -s "$DOTFILES_DIR/vim/vimrc" "$INSTALL_DIR/.vimrc";

# NodeJS Files
ln -s "$DOTFILES_DIR/node/npmrc" "$INSTALL_DIR/.npmrc";

mkdir $HOME/.npm-packages

# Add bins
chmod +x $DOTFILES_DIR/bin/*;
chmod -w $DOTFILES_DIR/bin/*;

# Update user
echo -e "\033[0;32mDotfiles are located in \033[0;34m$DOTFILES_DIR\033[0m";
echo -e "\033[0;32mDotfiles are installes in \033[0;34m$INSTALL_DIR\033[0m";
echo -e "\033[0;32mYou're old dotfiles are located in \033[0;34m$BACKUP_DIR\033[0m";
echo -e "";
echo -e "\033[0;35mComplete! Changes will take effect the next time you launch your terminal.\033[0m";
