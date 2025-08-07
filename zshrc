# ~/.zshrc

# Export variables
export EDITOR=nvim
export SUDO_EDITOR=nvim

# workon function (enter project dir and activate .venv)
workon() {
	local session="$1"
	local dir="$HOME/dev/$session"
	local venv="$dir/.venv/bin/activate"

	[ -z "$session" ] && echo "Usage: workon <project-name>" && return 1
	[ ! -d "$dir" ] && echo "Directory $dir not found." && return 1

	cd "$dir" || return 1

	if [ -f "$venv" ]; then
		source "$venv"
	else
		echo "Warning: venv not found at $venv"
	fi
}

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'

# Enable completion
autoload -Uz compinit && compinit

# Set prompt
PROMPT='%F{blue}%n@%m%f:%F{green}%~%f$ '
