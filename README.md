# dotfiles

My personal dotfiles. Nothing fancy — just the configs I actually use day to day.

There are plenty of other tools and plugins out there, but I'm happy with the defaults for most things. These configs reflect what works for me, not necessarily what's best for everyone.

## What's included

- **Ghostty** — terminal emulator
- **Zellij** — terminal multiplexer (replaced tmux)
- **Fish** — shell
- **Neovim** — editor (LazyVim)
- **mise** — runtime/tool version manager

## Zellij

Keybindings are the stock Zellij ones — `config.kdl` is what Zellij itself
dumps, so the usual modes apply: `Ctrl` + `p` pane, `Ctrl` + `t` tab,
`Ctrl` + `n` resize, `Ctrl` + `o` session, `Ctrl` + `s` scroll, `Ctrl` + `g`
lock. There's also a `Ctrl` + `b` tmux-compatibility mode that ships with
Zellij, if the old muscle memory kicks in.

The only additions are free keys in pane mode, each opening a floating pane:

| key | does |
| --- | --- |
| `Ctrl` + `p` then `g` | lazygit |
| `Ctrl` + `p` then `b` | btop |
| `Ctrl` + `p` then `K` | k9s (wrapper script lives outside this repo — it carries internal cluster and namespace names) |

Nothing here mirrors what `tmux.conf` used to carry for Claude Code
(`allow-passthrough`, `extended-keys`, `focus-events`, a short `escape-time`),
because Zellij needs none of it. The kitty keyboard protocol is on by default,
so Shift+Enter survives the multiplexer; and Zellij forwards the terminal bell
from unfocused panes since 0.44.0 and OSC 9 / 99 / 777 desktop notifications to
the host terminal since 0.44.1–0.45.0. These configs run 0.45.1.

Zellij's own plugins live in `~/.local/share/zellij`, not here, so there is no
plugin manager step — clone and go.

## Theme

[Solarized Osaka](https://github.com/craftzdog/solarized-osaka.nvim) applied
across all tools.

`.config/zellij/themes/solarized_osaka_dark.kdl` declares the palette and
`theme "solarized-osaka"` in `config.kdl` selects it. The tab bar's powerline
separators need a Nerd Font — Ghostty here runs JetBrainsMono Nerd Font.

## Usage

If you want to use any of this, feel free — but do it at your own risk. I won't be responsible if something breaks on your machine.
