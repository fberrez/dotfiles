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

# print current directory as a tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules|containers|*.bson|*.metadata.json" $1'

# jumps to workspace
alias workspace="cd ~/workspace/src/github.com/fberrez/"

alias lsal="ls -al"

alias eslint="eslint --config .eslintrc.js"
