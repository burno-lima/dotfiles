set fish_greeting ""

mise activate fish | source

fish_add_path $HOME/go/bin

# eza
if type -q eza
    alias ls "eza --icons=auto --group-directories-first"
    alias ll "eza -l -g --icons=auto --group-directories-first --git --time-style=long-iso"
    alias lla "ll -a"
    alias lt "eza --tree --level=2 --icons=auto --git-ignore"
end

# alias
command -qv nvim && alias vim nvim
alias claude-yolo "claude --dangerously-skip-permissions"

# opencode
fish_add_path ~/.opencode/bin

fish_add_path ~/.local/bin
