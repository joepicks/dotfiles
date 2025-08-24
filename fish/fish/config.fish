if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add to ~/.config/fish/config.fish for make/run command
alias rc 'gcc $argv[1] -o a.out && ./a.out'

function fish_prompt
    set -l last_status $status
    set -l normal (set_color normal)
    set -l green (set_color green)
    set -l red (set_color red)
    set -l cyan (set_color cyan)
    set -l magenta (set_color magenta)
    set -l cwd_color (set_color $fish_color_cwd)

    # User@host (only show on SSH)
    set -l userhost ""
    if set -q SSH_TTY
        set userhost "$cyan"(whoami)"@"(hostname|cut -d . -f 1)"$normal "
    end

    # Current directory
    set -l cwd "$cwd_color"(prompt_pwd)"$normal"

    # Git branch (if any)
    set -l git (fish_vcs_prompt)

    # Prompt symbol
    set -l symbol $green'❯'$normal
    if test $last_status -ne 0
        set symbol $red'❯'$normal
    end

    echo -n "$userhost$cwd $magenta$git $symbol "
end
