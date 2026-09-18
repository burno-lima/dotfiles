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
alias claude-yolo "claude --dangerously-skip-permissions"

# kubernetes — os clusters vivem em configStaging/configProduction,
# o ~/.kube/config default está vazio
set -gx KUBECONFIG $HOME/.kube/configStaging

alias kstg "env KUBECONFIG=$HOME/.kube/configStaging kubectl"
alias kprd "env KUBECONFIG=$HOME/.kube/configProduction kubectl"
# k9senv é o mesmo script que o zellij chama no pane mode + K
alias k9stg "k9senv stg"
alias k9prd "k9senv prd"

# opencode
fish_add_path /home/brunolima/.opencode/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$HOME/.local/bin:$PATH"

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
