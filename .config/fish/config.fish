set fish_greeting ""

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

fish_add_path ~/.local/bin
