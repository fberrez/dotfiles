export BASH_SILENCE_DEPRECATION_WARNING=1

# Shared environment (PATH, tools, aliases, functions)
if [ -f "$HOME/.shared_env" ]; then
    . "$HOME/.shared_env"
fi

# History
export HISTFILE="$HOME/.bash_history"

# Prompt — git branch display
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

default="\033[39m"
first="\033[36m"
second="\033[32m"
third="\033[33m"

export PS1="\[$first\]\u\[\033[m\]@\[$second\]\h:\[$default\]\W\[$third\]\$(parse_git_branch) $default\$ "

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
