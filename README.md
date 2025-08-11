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

## tmux

Config:
- Changes default prefix to `Ctrl-Space`
- Adds basic usability enhancements

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

Configured as a minimalist IDE.

**Features:**
- Uses `:Lazy` for plugin management
- Uses `:Mason` for LSP installation
- Spacebar as `<leader>` key
- Line numbers enabled
- Toggle comments
- Bufferline for tabbed files
- File tree sidebar
- `:LspFormat` command for formatting
