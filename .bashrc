export BASH_SILENCE_DEPRECATION_WARNING=1

# Load aliases
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# Load functions
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# Exports environment variables
export EDITOR='vim'

# Upates PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/Users/fberrez/Library/Python/2.7/bin
export PATH=$PATH:/Users/fberrez/Library/Python/3.7/bin

# History management
export HISTFILE=$HOME/.bash_history

# Customizes /bin/bash appearance
# Colors
default="\033[39m"
first="\033[36m"
second="\033[32m"
third="\033[33m"

# Adds git branch display to bash 
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[$first\]\u\[\033[m\]@\[$second\]\h:\[$default\]\W\[$third\]\$(parse_git_branch) $default\$ "

# Adds colors to CLI and `ls`
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

if [[ -f ~/.parkkirc ]]; then
    source ~/.parkkirc
fi

if [[ -f ~/.parkki_aliases ]]; then
    source ~/.parkki_aliases
fi

source /Users/fberrez/.docker/init-bash.sh || true # Added by Docker Desktop
. "$HOME/.cargo/env"
. "/Users/fberrez/.deno/env"