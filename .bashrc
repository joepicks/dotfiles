#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim

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
