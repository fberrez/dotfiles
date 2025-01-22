alias curl="curl -w '\n'"

# docker aliases
alias dps="docker ps"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dl="docker logs -f"

# git aliases
alias ga="git add"
alias gt="git status"
alias gps="git push"
alias gpl="git pull"
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gf="git fetch"
alias gch="git checkout"
alias gl="git log"
alias gt="git tag"
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# print current directory as a tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules|containers|*.bson|*.metadata.json" $1'

# jumps to workspace
alias workspace="cd ~/workspace/src/github.com/fberrez/"
alias mambo="cd ~/workspace/src/github.com/Mambo-Corp/mambo-electron"

alias lsal="ls -al"

alias eslint="eslint --config .eslintrc.js"

alias code="code-insiders"

alias python=python3
alias pip=pip3

# cursor cli for linux
cursor() {        
    /home/fberrez/cursor "$@" > /dev/null 2>&1 &
}
