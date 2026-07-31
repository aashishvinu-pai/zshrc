# ============================================================================
# HISTORY
# ============================================================================
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY

# Prefix search with ↑ ↓
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Word navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Delete words
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word


# ============================================================================
# PROMPT
# ============================================================================
PROMPT='%~: '


# ============================================================================
# PATHS
# ============================================================================
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export SPARK_HOME=/opt/spark
export IVY_HOME=/opt/ivy

export PATH="$HOME/.atuin/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="$IVY_HOME/bin:$PATH"
export PATH="$HOME/.duckdb/cli/latest:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"
export PATH="$HOME/sonar-scanner/bin:$PATH"


# ============================================================================
# COMPLETION
# ============================================================================
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select


# ============================================================================
# PLUGINS
# ============================================================================

# zsh-autosuggestions
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# zsh-syntax-highlighting
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || true


# ============================================================================
# ATUIN
# ============================================================================
if [ -x "$HOME/.atuin/bin/atuin" ]; then
    eval "$($HOME/.atuin/bin/atuin init zsh)"
fi


# ============================================================================
# ZOXIDE
# ============================================================================
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi


# ============================================================================
# TOOL ALIASES
# ============================================================================

# eza
alias ls='eza'
alias ll='eza -1'
alias tree='eza --tree'


# bat
if command -v batcat >/dev/null 2>&1; then
    alias cat='batcat'
elif command -v bat >/dev/null 2>&1; then
    alias cat='bat'
fi

# fd (Ubuntu)
if command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi

# kubecolor
if command -v kubecolor >/dev/null 2>&1; then
    alias kubectl='kubecolor'
    alias k='kubecolor'
else
    alias k='kubectl'
fi

# zoxide shortcut
alias j='z'

# lazygit
alias lg='lazygit'


# ============================================================================
# GENERAL ALIASES
# ============================================================================
alias ..='cd ..'
alias ...='cd ../..'

alias mkdir='mkdir -p'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

alias df='df -h'
alias du='du -sh'
alias ports='ss -tulnp'
alias myip='curl -s ifconfig.me'

alias path='echo $PATH | tr ":" "\n"'


# ============================================================================
# DOCKER
# ============================================================================
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f --tail=100'
alias dcprune='docker system prune -a --volumes -f'


# ============================================================================
# KUBERNETES
# ============================================================================
alias kg='kubectl get'
alias kga='kubectl get all'

alias kgp='kubectl get pods --watch'
alias kgpa='kubectl get pods --all-namespaces'
alias kgn='kubectl get nodes'
alias kgs='kubectl get sparkapp --watch'

alias kl='kubectl logs -f'

alias kx='kubectl exec -it'
alias kdp='kubectl describe pod'
alias kdelp='kubectl delete pod'

alias kexp='kubectl get pod -o wide'

alias kgx='kubectl config get-contexts'
alias kux='kubectl config use-context'

alias ks='kubectl get secrets -o yaml'


# ============================================================================
# PYTHON
# ============================================================================
alias jl='python3 -m jupyterlab'
alias pyact='source .venv/bin/activate'
alias pydeact='deactivate'


# ============================================================================
# GIT
# ============================================================================
alias gs='git status'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate'


# ============================================================================
# GLOBAL ALIASES
# ============================================================================
alias -g G='| rg -i'
alias -g L='| less'
alias -g DN='>/dev/null 2>&1'
alias -g b64='| base64 -d; echo'

alias e='explorer.exe'
