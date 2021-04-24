alias curl="curl -w '\n'"

# docker aliases
alias dps="docker ps"
alias drm="docker rm $(docker ps -aq -f status=exited)"
alias drmi='docker rmi $(docker images --filter "dangling=true" -q)'
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# git aliases
alias ga="git add"
alias gt="git status"


# print current directory as a tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules|containers" $1'

# git aliases
alias gits="git status"
alias gitd="git diff"
alias gitc="git commit"
alias gitps="git push"
alias gitpl="git pull"
alias gitf="git fetch"

alias workspace="cd ~/workspace/src/github.com/fberrez/"
