function workon --description "cd to ~/dev/<name>, tmux attach or create, activate venv, open nvim, optional PDF"
    if test (count $argv) -lt 1
        echo "usage: workon <name-or-path> [session-name]"; return 1
    end

    set -l arg $argv[1]
    set -l session (basename "$arg")
    if test (count $argv) -ge 2
        set session $argv[2]
    end

    # Debug print
    echo "arg: $arg"

    # Resolve directory
    if string match -qr '^~|/' -- "$arg"
        set dir (eval echo $arg)
    else
        set dir "$HOME/dev/$arg"
    end

    echo "dir: $dir"
    cd $dir

    if not test -d "$dir"
        echo "workon: directory not found: $dir"; return 1
    end

    # Reference PDF mapping
    switch $session
      case Ctest
        set refpdf "~/Documents/books/Coding/C/C Programming Language - 2nd Edition (OCR).pdf"
      case portfolio
        set refpdf "~/Documents/books/Coding/HTML/The Web Book.pdf"
      case edupy
        set refpdf "~/Documents/books/Coding/Python/Automate the Boring Stuff with Python.pdf"
      case proj-algo
        set refpdf "~/Documents/books/Coding/Python/Laurent Bernut - Algorithmic Short-Selling with Python_ Refine your algorithmic trading edge, consistently generate investment ideas, and build a robust long_short product-Packt Publishing (2021).pdf"
      case '*'
        set refpdf ""
      source $venv/bin/activate.fish
    end

    # Try to open pdf if configured
    echo "refpdf: $refpdf"
    if not test "$refpdf"
      echo "No reference material added"
    else
      echo "Opening PDF: $refpdf"
      nohup zathura "$refpdf" >/dev/null 2>&1 & disown
    end
    
    # Activate python venv if any available, or return 1 if not
    echo "venv: $venv"
    set venv "$dir/.venv"
    if not test -d "$venv"
        echo "workon: venv not found: $venv"; return 1
    else 
      echo "Activating venv..."  
      source $venv/bin/activate.fish; return 1
    end
    echo "test"
    # Ensure session exists (no startup command)
    # if tmux has-session -t "$session" # 2>/dev/null
    #     # session exists; continue below to send keys then attach
    # else
    #     tmux new-session -d -s "$session" -c "$dir"
    # end


    # hyprctl dipatch movefocus l
    # hyprctl dispatch swapwindow r
end
