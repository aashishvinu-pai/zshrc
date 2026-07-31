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


# ============================================================================
#  PROMPT & APPEARANCE
# ============================================================================
autoload -Uz colors && colors
PROMPT='%~: '
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
alias e='explorer.exe'
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
alias kgs='kubectl get sparkapp --watch'
alias kgn='kubectl get nodes'
alias kdelp='kubectl delete pod'
alias kgpa='kubectl get pods --all-namespaces'
alias kdp='kubectl describe pod'
alias klp='kubectl logs -f'
alias kexp='kubectl get pod -o wide'
alias kexec='kubectl exec -it'


# ============================================================================
#  ALIASES – PYTHON / JUPYTER
# ============================================================================
alias jl='python3 -m jupyterlab'
alias pyact='source .venv/bin/activate'
alias pydeact='deactivate'


# ============================================================================
#  GLOBAL ALIASES (can be used anywhere in the command line)
# ============================================================================
alias -g G='| rg -i'
alias -g L='| less'
alias -g DN='>/dev/null 2>&1'
alias -g b64='| base64 -d; echo'
