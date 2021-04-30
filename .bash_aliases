alias curl="curl -w '\n'"

# docker aliases
alias dps="docker ps"
alias drm="docker rm $(docker ps -a -f status=exited -q)"
alias drmi='docker rmi $(docker images --filter "dangling=true" -q)'
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

# print current directory as a tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules|containers" $1'

alias workspace="cd ~/workspace/src/github.com/fberrez/"
