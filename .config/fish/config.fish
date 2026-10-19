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

# kubernetes — os clusters vivem em configStaging/configProduction,
# o ~/.kube/config default está vazio
set -gx KUBECONFIG $HOME/.kube/configStaging

alias kstg "env KUBECONFIG=$HOME/.kube/configStaging kubectl"
alias kprd "env KUBECONFIG=$HOME/.kube/configProduction kubectl"
# k9senv é o mesmo script que o zellij chama no pane mode + K
alias k9stg "k9senv stg"
alias k9prd "k9senv prd"

# opencode
fish_add_path ~/.opencode/bin

fish_add_path ~/.local/bin
