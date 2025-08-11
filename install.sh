#!/usr/bin/env bash
set -e

# Change this to where your dotfiles folder is located
REPO="$HOME/dotfiles"

ln -sf "$REPO/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO/.tmux.conf" "$HOME/.tmux.conf"

ln -snf "$REPO/alacritty" "$HOME/.config/alacritty"
ln -snf "$REPO/hypr" "$HOME/.config/hypr"
ln -snf "$REPO/nvim" "$HOME/.config/nvim"
ln -snf "$REPO/waybar" "$HOME/.config/waybar"

echo "Symlinks created."
