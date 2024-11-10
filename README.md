![image](https://github.com/user-attachments/assets/1e88054a-3095-45a6-8de9-74c5f305b724)


# Bruno dotfiles
Warning: Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Contents

- vim (LazyVim) config
- tmux config
- fish config

## Neovim setup

### Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and *undercurl*:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & Macos)_**
  - [wezterm](https://github.com/wez/wezterm) **_(Linux, Macos & Windows)_**
  - [alacritty](https://github.com/alacritty/alacritty) **_(Linux, Macos & Windows)_**
  - [iterm2](https://iterm2.com/) **_(Macos)_**

- ### Shell setup Linux(WSL2)

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack. - 'CaskaydiaMono Nerd Font Mono'.
- [Tide](https://github.com/IlanCosman/tide) - Shell theme.
- [Catppuccin](https://github.com/catppuccin/catppuccin.git) - Theme.
- [Eza](https://github.com/eza-community/eza) - `ls` replacement

