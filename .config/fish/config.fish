set fish_greeting ""

mise activate fish | source

fish_add_path $HOME/go/bin

# eza
if type -q eza
    alias ls "eza --icons"
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# alias
command -qv nvim && alias vim nvim

# opencode
fish_add_path /home/brunolima/.opencode/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$HOME/.local/bin:$PATH"
