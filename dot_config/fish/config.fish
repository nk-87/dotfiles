if status is-interactive
    fish_config theme choose catppuccin-macchiato

    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert

    # Aliases / Abbreviations
    abbr -a k kubectl
    abbr -a vi nvim
    abbr -a vim nvim
    abbr -a c pbcopy
    abbr -a v pbpaste
    abbr -a l eza
    abbr -a ls eza
    abbr -a tns tmux new -s ""
    abbr -a nerdctl lima nerdctl
    abbr -a py python

    alias python=python3
    alias grep="grep --color=auto"

    set -x EDITOR /opt/homebrew/bin/nvim
    set -e SSH_ASKPASS
    set -gx GPG_TTY (tty)

    set -x GOPATH "$HOME/go"
    fish_add_path \
        "$HOME/.local/bin" \
        "$HOME/bin" \
        "$GOPATH/bin" \
        /opt/homebrew/bin \
        /opt/homebrew/opt/coreutils/libexec/gnubin \
        /opt/homebrew/opt/gnu-tar/libexec/gnubin \
        /opt/homebrew/opt/grep/libexec/gnubin \
        /opt/homebrew/opt/gnu-sed/libexec/gnubin \
        /opt/homebrew/opt/gawk/libexec/gnubin \
        /opt/homebrew/opt/make/libexec/gnubin \
        /opt/homebrew/opt/findutils/libexec/gnubin

    starship init fish | source
end
