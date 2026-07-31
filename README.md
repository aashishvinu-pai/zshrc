# .zshrc

Personal Zsh config for daily shell work — history, completion, plugins, and aliases for Docker, Kubernetes, Git, and Python.

Also uses [tsnip](https://github.com/aashishvinu/tsnip) as a snippet manager for saving and running shell snippets (`Ctrl+G`).

Most optional tools fail soft: if something isn't installed, the related aliases/init simply skip.

---

## Table of contents

- [Features](#features)
- [Keybindings](#keybindings)
- [Dependencies](#dependencies)
- [Aliases](#aliases)
- [Installation](#installation)

---

## Features

| Area | What it does |
|------|----------------|
| **History** | 100k entries, shared across sessions, no duplicates, timestamps (`EXTENDED_HISTORY`) |
| **Prompt** | Minimal `~/path: ` |
| **Completion** | Case-insensitive matching with menu select |
| **Plugins** | [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) |
| **Atuin** | Better shell history search (if installed) |
| **Zoxide** | Smarter directory jumping via `j` / `z` (if installed) |
| **tsnip** | [Snippet manager](https://github.com/aashishvinu/tsnip) for browsing and running saved shell snippets (`Ctrl+G`) |

---

## Keybindings

| Keys | Action |
|------|--------|
| `↑` / `↓` | Prefix search through history |
| `Ctrl` + `→` / `←` | Forward / backward word |
| `Ctrl` + `Backspace` | Delete word backward |
| `Ctrl` + `Delete` | Delete word forward |

---

## Dependencies

### Plugins (recommended)

Expects `$ZSH_CUSTOM/plugins/…` (Oh My Zsh layout). Sourced with `2>/dev/null || true`.

```sh
# Example if using Oh My Zsh:
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### CLI tools

| Tool | Purpose | Used for |
|------|---------|----------|
| [eza](https://github.com/eza-community/eza) | Modern `ls` | `ls`, `ll`, `tree` |
| [bat](https://github.com/sharkdp/bat) | Syntax-highlighted `cat` | `cat` (also `batcat` on Ubuntu) |
| [fd](https://github.com/sharkdp/fd) | Fast `find` | `fd` → `fdfind` on Ubuntu |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast search | global alias `G` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` | `j` / `z` |
| [atuin](https://github.com/atuinsh/atuin) | History search | interactive history |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI | `lg` |
| [kubecolor](https://github.com/kubecolor/kubecolor) | Colored kubectl | `k` / `kubectl` |
| [tsnip](https://github.com/aashishvinu/tsnip) | Snippet manager | `Ctrl+G` command palette for code/shell snippets |
| Docker | Containers | `dc*` aliases |
| kubectl | Clusters | `k*` aliases |

---

## Aliases

### Navigation & files

| Alias | Expands to |
|-------|------------|
| `j` | `z` (zoxide) |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `ls` | `eza` |
| `ll` | `eza -1` |
| `tree` | `eza --tree` |
| `cat` | `bat` or `batcat` |
| `fd` | `fdfind` (Ubuntu) |
| `mkdir` | `mkdir -p` |
| `cp` / `mv` / `rm` | interactive (`-iv`) |
| `df` | `df -h` |
| `du` | `du -sh` |
| `ports` | `ss -tulnp` |
| `myip` | `curl -s ifconfig.me` |
| `path` | print `PATH` one entry per line |
| `e` | `explorer.exe` (WSL / Windows) |

### Git

| Alias | Expands to |
|-------|------------|
| `gs` | `git status` |
| `gb` | `git branch` |
| `gl` | `git log --oneline --graph --decorate` |
| `lg` | `lazygit` |

### Docker

| Alias | Expands to |
|-------|------------|
| `dc` | `docker compose` |
| `dcu` | `docker compose up -d` |
| `dcd` | `docker compose down` |
| `dcl` | `docker compose logs -f --tail=100` |
| `dcprune` | `docker system prune -a --volumes -f` |

### Kubernetes

`k` / `kubectl` use **kubecolor** when available.

| Alias | Expands to |
|-------|------------|
| `k` | `kubectl` / `kubecolor` |
| `kg` | `kubectl get` |
| `kga` | `kubectl get all` |
| `kgp` | `kubectl get pods --watch` |
| `kgpa` | `kubectl get pods --all-namespaces` |
| `kgn` | `kubectl get nodes` |
| `kgs` | `kubectl get sparkapp --watch` |
| `kl` | `kubectl logs -f` |
| `kx` | `kubectl exec -it` |
| `kdp` | `kubectl describe pod` |
| `kdelp` | `kubectl delete pod` |
| `kexp` | `kubectl get pod -o wide` |
| `kgx` | `kubectl config get-contexts` |
| `kux` | `kubectl config use-context` |
| `ks` | `kubectl get secrets -o yaml` |

### Python

| Alias | Expands to |
|-------|------------|
| `jl` | `python3 -m jupyterlab` |
| `pyact` | `source .venv/bin/activate` |
| `pydeact` | `deactivate` |

### Global (pipe) aliases

Use at the end of a command (zsh `alias -g`):

| Alias | Expands to | Example |
|-------|------------|---------|
| `G` | `\| rg -i` | `ps aux G nginx` |
| `L` | `\| less` | `dmesg L` |
| `DN` | `>/dev/null 2>&1` | `noisy-cmd DN` |
| `b64` | `\| base64 -d; echo` | `echo YWJj b64` |

---

## Installation

1. **Back up** your current config (optional but recommended):

```sh
cp ~/.zshrc ~/.zshrc.bak
```

2. **Install** this config:

```sh
cp .zshrc ~/.zshrc
```

3. **Install plugins** (see [Dependencies](#plugins-recommended)) and set `ZSH_CUSTOM` if you aren't using Oh My Zsh defaults.

4. **Install optional CLI tools** you care about (`eza`, `bat`, `zoxide`, `atuin`, etc.).

5. **Reload**:

```sh
source ~/.zshrc
```
