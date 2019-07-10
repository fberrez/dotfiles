alias curl="curl -w '\n'"

# docker aliases
alias dps="docker ps"
alias drm="docker rm"
alias drmi="docker rmi"
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# aws aliases (for local env only)
alias awsd="aws dynamodb --endpoint-url http://localhost:8000"

# print current directory as a tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules" $1'

# git aliases
alias gits="git status"
alias gitc="git commit"
alias gitps="git push"
alias gitpl="git pull"
alias gitf="git fetch"
