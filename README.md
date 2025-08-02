# Minimalist Arch Linux Setup

####bashrc
<p>config includes command "workon"<br>
*bash:*<br>
    workon [~/sample_directory]<br>
This will open the terminal into the project directory and attempt to run a python venv in the directory if .venv exists</p>

####tmux
config changes default binding to C-Space, some other basic features

####hyprland
config for minimal desktop environment

Default apps:
- terminal: alacritty
- file manager: thunar
- menu: rofi
- browser: firefox

Startup apps:
- waybar
- lxqt-policykit

####neovim
<p>config for minimalist IDE<br>

Uses :Lazy and :Mason for plugin and LSP support, respectively<br>

Other features:
- space bar leader
- line numbers
- comment toggle
- bufferline for tabbed files open
- filetree
- :LspFormat command

