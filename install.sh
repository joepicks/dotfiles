#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"

link_file() {
    src="$1"
    dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "Backing up existing $dest to $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    echo "Linking $dest → $src"
    ln -sf "$src" "$dest"
}

# Top-level dotfiles
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# Config directories
link_file "$DOTFILES_DIR/.config/nvim" "$CONFIG_DIR/nvim"
link_file "$DOTFILES_DIR/.config/hypr" "$CONFIG_DIR/hypr"
link_file "$DOTFILES_DIR/.config/waybar" "$CONFIG_DIR/waybar"

echo "✅ Dotfiles symlinking complete."

