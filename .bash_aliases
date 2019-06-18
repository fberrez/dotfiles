alias curl="curl -w '\n'"

# docker aliases
alias dps="docker ps"
alias drm="docker rm"
alias drmi="docker rmi"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# print current directory as a tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules" $1'
