# AGENTS.md

Instructions for AI coding agents (Claude Code, Codex, OpenCode, Antigravity, …)
working in this repository.

The usual request is **"set up this machine with these dotfiles"**. Follow
[Setting up a machine](#setting-up-a-machine). For anything else, see
[Maintaining the repo](#maintaining-the-repo).

## What this repo is

Personal dotfiles for a Linux desktop. The repo mirrors `$HOME`:
everything under `.config/` here belongs at `~/.config/` on the machine.

| Path | Tool |
| --- | --- |
| `.config/fish/` | Fish shell config and Solarized Osaka colors |
| `.config/ghostty/` | Ghostty terminal config and theme |
| `.config/zellij/` | Zellij config and theme |
| `.config/nvim/lua/plugins/` | LazyVim plugin overrides (theme, snacks) |
| `.config/mise/config.toml` | Tools installed by mise (nvim, zellij, lazygit, btop, tree-sitter, go, node, rust) |

Files are linked into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/),
so editing a file on the machine edits the repo.

## Rules

- **Never overwrite an existing file without a backup.** Move it to
  `<file>.bak` first (`*.bak` is gitignored).
- **Say before you run `sudo`**, and what it is for. If `sudo` needs a
  password you cannot type, give the user the exact command to run.
- **Ask before changing the login shell** (`chsh`).
- **Every step is idempotent.** Check whether it is already done and skip it
  if so. Running the setup twice must not break anything.
- **Install only what is missing.** A desktop install already ships much of
  this (git, curl, fontconfig, …). Check with `command -v` before installing,
  and only pass missing packages to the package manager.
- **Verify each step** with its check before moving on. If a step fails,
  stop and report it — do not work around it silently.
- Prefer the official install method of each tool. If a command here looks
  outdated, check the tool's official docs and say what you changed.

## Setting up a machine

Run from the repo root. `DOTFILES` below is the repo's absolute path.

Use the system's own package manager (detect it from `/etc/os-release`).
Package names differ between distros: look them up rather than guessing. If
a tool is not in the distro's repositories, install it through mise instead,
in the machine-only file `~/.config/mise/conf.d/local.toml` (never in the
stowed `config.toml`).

### 1. System packages

Needed commands: `git`, `curl`, a C compiler and `make`, `stow`, `eza`, `fzf`,
`rg` (ripgrep), `fd` (on some distros the binary is `fdfind`), `unzip` and
`fc-cache` (fontconfig). Install only the ones `command -v` does not find.

Check: every command above resolves with `command -v`.

### 2. Fish 4.x

Skip if `fish --version` already reports 4.x.

Otherwise install fish from the distro. If the distro only offers an older
version, use the official package repository for that distro listed on
<https://fishshell.com>.

Check: `fish --version` reports 4.x.

### 3. Fish as the login shell

Do this **before** installing anything else: installers such as mise's
detect the user's shell and write their setup line into the right config
file only when fish is already the login shell.

Ask the user first. If they agree:

```sh
chsh -s "$(command -v fish)"
```

`$SHELL` only changes in new login sessions, so for the rest of the setup
run installers with `SHELL="$(command -v fish)"` in their environment.

### 4. Link the dotfiles (stow)

If `~/.config/nvim/init.lua` does not exist yet, install the LazyVim starter
first — the repo only holds plugin overrides, not a full Neovim config:

```sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

Then a dry run, to find files that already exist on the machine:

```sh
stow --dir="$DOTFILES" --target="$HOME" --no-folding \
     --ignore='^\.git$' --ignore='^\.gitignore$' \
     --ignore='^README\.md$' --ignore='^AGENTS\.md$' --ignore='^CLAUDE\.md$' \
     --no --verbose .
```

For every conflict it reports, move the existing file to `<file>.bak`. Then
run the same command without `--no`.

Never use `--adopt`: it overwrites the repo with the machine's files.
Always keep `--no-folding`: without it Stow links whole directories, and
files that fisher, LazyVim or fish write at runtime (`functions/`,
`lazy-lock.json`, `fish_variables`) would land inside the repo.

Check: `readlink ~/.config/fish/config.fish` points into `$DOTFILES`.

### 5. mise

Install it with mise's fish installer, which also appends the activation
line to `~/.config/fish/config.fish`:

```sh
curl https://mise.run/fish | sh
```

Then move that appended line out of `config.fish` (see
[Lines added by installers](#lines-added-by-installers)).

Check: `mise --version`, and `fish -c 'type -q mise'`.

### 6. Tools from mise

```sh
mise install
```

This reads `~/.config/mise/config.toml` (now linked from the repo).

Your own shell is probably not fish, so mise is not activated in it: from
here on, run mise tools as `mise exec -- <tool>` (e.g. `mise exec -- nvim`).

Check: `mise ls --current` lists every tool from that file as installed, and
`mise which <tool>` prints a path for each of nvim, zellij, lazygit, btop
and tree-sitter.

### 7. Fisher and Tide

Run it inside fish:

```sh
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher ilancosman/tide@v6'
```

Tide's configuration is interactive (`tide configure`). Do not run it
yourself: tell the user to run it once in a real terminal.

Check: `fish -c 'type -q tide'`.

### 8. Nerd Font

Ghostty and the Zellij tab bar use **JetBrainsMono Nerd Font**. Install it
for the user from the latest release of
<https://github.com/ryanoasis/nerd-fonts> into
`~/.local/share/fonts/JetBrainsMono/`, then run `fc-cache -f`.

Check: `fc-list | grep -i 'JetBrainsMono Nerd Font'`.

### 9. Ghostty

Follow
<https://ghostty.org/docs/install/binary> for the recommended method on
this distro, and tell the user which one you used.

Check: `ghostty --version`.

### 10. Neovim (LazyVim)

The starter was installed in step 4. Let LazyVim install its plugins:

```sh
mise exec -- nvim --headless "+Lazy! sync" +qa
```

Check: `mise exec -- nvim --headless "+checkhealth lazyvim" "+w! /tmp/health.txt" +qa`
and confirm there are no `ERROR` lines in `/tmp/health.txt`.

### 11. AI coding CLIs

Install each one with its official installer, checking the linked docs first
in case the method changed. Run them with `SHELL="$(command -v fish)"` (see
step 3), then clean up `config.fish` as described in
[Lines added by installers](#lines-added-by-installers).

| Tool | Official docs | Installer | Installs to |
| --- | --- | --- | --- |
| Claude Code | <https://code.claude.com/docs/en/setup> | `curl -fsSL https://claude.ai/install.sh \| bash` | `~/.local/bin/claude` |
| OpenCode | <https://opencode.ai/docs/> | `curl -fsSL https://opencode.ai/install \| bash` | `~/.opencode/bin/opencode` (adds itself to `config.fish`) |
| Antigravity CLI | <https://antigravity.google> | `curl -fsSL https://antigravity.google/cli/install.sh \| bash` | `~/.local/bin/agy` |

`~/.local/bin` is already on the `PATH` through `config.fish`.

Do not log in to any of them: logging in opens a browser and needs the
user's accounts. Leave it for the final report.

Check: `claude --version`, `opencode --version` and `agy --version` each
print a version (in a new fish shell).

### 12. Final report

Tell the user, step by step, what was installed, what was skipped because it
was already there, and what was backed up to `.bak`. Then list what is left
for them to do by hand:

- run `tide configure` in a real terminal;
- log in to Claude Code (`claude`), OpenCode and Antigravity CLI (`agy`);
- log out and back in so the new login shell takes effect;
- set Ghostty as the default terminal, if they want;
- on a work machine, copy the kubeconfigs and `k9senv` (see below).

### Lines added by installers

Some installers append a line to `~/.config/fish/config.fish` — mise
(`… activate fish | source`), opencode (`fish_add_path …/.opencode/bin`),
and others. That file is stowed, so the line would land in this public repo.

After any installer runs, check `git -C "$DOTFILES" diff`. Move every line it
added to the machine-only `~/.config/fish/conf.d/local.fish` (fish loads it
automatically) and restore `config.fish` with
`git -C "$DOTFILES" checkout .config/fish/config.fish`.

### Work-only tools (kubectl, k9s)

kubectl and k9s are only used on the work machine. **Do not set them up by
default.** Ask the user whether this is a work machine; if not, skip this
section entirely.

If it is a work machine and the user wants them, everything goes into
machine-only files that are **not** in this repo:

- **Tools:** install `kubectl` and `k9s` through mise in
  `~/.config/mise/conf.d/work.toml` — not with `mise use -g`, which would
  write to the stowed `config.toml` and leak into every machine:

  ```sh
  mkdir -p ~/.config/mise/conf.d
  printf '[tools]\nkubectl = "latest"\nk9s = "latest"\n' > ~/.config/mise/conf.d/work.toml
  mise install
  ```

- **Shell:** kubeconfig variables and aliases go in
  `~/.config/fish/conf.d/work.fish` (fish loads it automatically). Ask the
  user for the kubeconfig file names and the aliases they want — they are
  not written down here on purpose.
- **Credentials:** the kubeconfigs under `~/.kube/` never belong in this
  repo — the user copies them over.
- **k9s wrapper:** the `Ctrl+p` then `K` shortcut in Zellij runs
  `~/.local/bin/k9senv`, a script that is intentionally not in this repo. The
  user puts it back by hand.

## Maintaining the repo

- Because files are stowed, changes made on the machine already show up in
  `git status` here. Review the diff before committing.
- **This repo is public.** Never commit secrets, tokens, kubeconfigs, hostnames
  or internal names. Machine-specific lines (installer-added `PATH` entries,
  absolute paths under `/home/<user>`) stay out; use `~` or `$HOME`.
- To add a new tool's config, put it under the same path it has in `$HOME`
  and re-run the stow command from step 4.
- Tools installed through mise go in `.config/mise/config.toml`.
- Commits follow Conventional Commits (`feat(fish): …`, `fix: …`,
  `docs: …`), in English.
- Keep `README.md` short. Setup details live in this file.
