set fish_greeting ""

# eza
if type -q eza
    alias ls "eza --icons"
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# alias
command -qv nvim && alias vim nvim

# asdf
source ~/.asdf/asdf.fish

# hypr
function hypr
    vim ~/.config/hypr/hyprland.conf
end

set -x set_sysname (hostnamectl --static)

if status is-interactive
    # Commands to run in interactive sessions can go here
end
