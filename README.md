# Minimalist Arch Linux Setup

## Install:
```bash
git clone https://github.com/joepicks/dotfiles.git ~/dotfiles
./install.sh
```

## bashrc

Includes a custom `workon` command:

```bash
workon ~/sample_directory
```

This opens the terminal into the project directory and activates a Python virtual environment if `.venv/` exists.

---

## Hyprland

Minimal desktop environment configuration.

**Default apps:**
- Terminal: Alacritty
- File manager: Thunar
- Menu: Rofi
- Browser: Firefox

**Startup apps:**
- Waybar
- lxqt-policykit

---

## Neovim

**Features:**
- Uses `:Lazy` for plugin management
- Uses `:Mason` for LSP installation
- DAP and DAP-UI for debugging with python set up
- IRON REPL set up for python
- Oil file tree
- Bufferline for file tabs
- Several mini.nvim packages
- some colorschemes you can comment in and out to select
- Spacebar as `<leader>` key
- Line numbers enabled
- Toggle comments

