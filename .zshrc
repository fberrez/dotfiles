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
