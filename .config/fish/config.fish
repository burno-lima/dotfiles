set fish_greeting ""

# alias
command -qv nvim && alias vim nvim

# theme
oh-my-posh init fish --config ~/.config/oh-my-posh/themes/catppuccin_macchiato.omp.json | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
