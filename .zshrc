# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/Users/fberrez/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

# Deno completions
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
    export FPATH="$HOME/.zsh/completions:$FPATH"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting colored-man-pages colorize z)
source $ZSH/oh-my-zsh.sh

# Shared environment (PATH, tools, aliases, functions)
if [ -f "$HOME/.shared_env" ]; then
    . "$HOME/.shared_env"
fi

# Bun completions (lazy-loaded, zsh-specific)
bun() {
    unset -f bun
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
    command bun "$@"
}

# Docker Desktop (macOS)
[ -f "$HOME/.docker/init-zsh.sh" ] && source "$HOME/.docker/init-zsh.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
export RTK_TELEMETRY_DISABLED=1
