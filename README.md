# Minimalist Arch Linux Setup

## Features
**bashrc** 
config includes command "workon"

    *bash:*
        *workon [~/sample_directory]*

    This will open the terminal into the project directory and attempt to run a python venv in the directory if .venv exists

**tmux** 
config changes default binding to C-Space, some other basic features

**hyprland** 
config for minimal desktop environment
    *terminal: alacritty
    file manager: thunar
    menu: rofi
    browser: firefox*

    Startup apps
    *waybar
    lxqt-policykit*

**neovim** 
config for minimalist IDE

Uses :Lazy and :Mason for plugin and LSP support, respectively

space bar leader
line numbers
comment toggle
bufferline for tabbed files open
filetree
:LspFormat command

