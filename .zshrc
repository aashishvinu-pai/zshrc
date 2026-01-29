# ============================================================================
#  ZSH HISTORY CONFIGURATION
# ============================================================================
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt SHARE_HISTORY           # Share history between all sessions
setopt INC_APPEND_HISTORY      # Append commands immediately (not only on exit)
setopt APPEND_HISTORY          # Always append, never overwrite
setopt HIST_IGNORE_DUPS        # Don't record consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate when new one is added
setopt HIST_FIND_NO_DUPS       # Don't show duplicates in history search
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY        # Save command timestamps and duration

# Better ↑/↓ navigation: type prefix → arrow keys search matching history
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward


# ============================================================================
#  PROMPT & APPEARANCE
# ============================================================================
autoload -Uz colors && colors

PROMPT='%~: '                           # Simple current-directory prompt

export LS_COLORS="di=34:fi=0:ln=36:ex=32"
alias ls='ls --color=auto'


# ============================================================================
#  ZSH OPTIONS & COMPLETION
# ============================================================================
setopt CORRECT                     # Try to correct mistyped commands
setopt AUTO_CD                     # cd by typing directory name only
setopt EXTENDED_GLOB               # Extended globbing patterns

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# ============================================================================
#  PLUGINS
# ============================================================================
# Autosuggestions
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || true

# Make suggestions more pleasant
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'   # dim gray
bindkey '^ ' autosuggest-accept           # Ctrl+Space to accept suggestion

# Syntax highlighting (should be loaded last among plugins)
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || true


# ============================================================================
#  AUTOJUMP (smart directory jumping)
# ============================================================================
[[ -s /usr/share/autojump/autojump.zsh ]] && . /usr/share/autojump/autojump.zsh


# ============================================================================
#  ENVIRONMENT VARIABLES & PATH
# ============================================================================
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"

export SPARK_HOME=/opt/spark
export PATH="$SPARK_HOME/bin:$PATH"

export PATH="$HOME/.duckdb/cli/latest:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"

export IVY_HOME="/opt/ivy"
export PATH="$IVY_HOME/bin:$PATH"


# ============================================================================
#  ALIASES – BASIC NAVIGATION
# ============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'


# ============================================================================
#  ALIASES – DOCKER / DOCKER COMPOSE
# ============================================================================
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dc-logs='docker compose logs -f --tail=100'
alias dcprune='docker system prune -a --volumes -f'


# ============================================================================
#  ALIASES – KUBERNETES
# ============================================================================
alias k='kubectl'
alias kgp='kubectl get pods --watch'
alias kgn='kubectl get nodes'
alias kdelp='kubectl delete pod'


# ============================================================================
#  ALIASES – PYTHON / JUPYTER
# ============================================================================
alias jl='python3 -m jupyterlab'
alias pyact='source .venv/bin/activate'
alias pydeact='deactivate'


# ============================================================================
#  GLOBAL ALIASES (can be used anywhere in the command line)
# ============================================================================
alias -g G='| grep -i'
alias -g L='| less'
alias -g DN='>/dev/null 2>&1'
