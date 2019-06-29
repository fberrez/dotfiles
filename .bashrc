# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load functions
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# Exports environment variables
export GOPATH=$HOME/workspace
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export EDITOR='vim'
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN

# History management
export HISTFILE=$HOME/.bash_history
# HISTSIZE is the number of lines or commands that are stored while the bash session is ongoing.
export HISTSIZE=1000
# HISTFILESIZE is the number of lines or commands that are allowed in the history file at startup.
export HISTFILESIZE=1000
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

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
