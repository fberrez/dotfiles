alias curl="curl -w '\n'"

# docker
alias dps="docker ps"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dl="docker logs -f"

# git
alias ga="git add"
alias gs="git status"
alias gps="git push"
alias gpl="git pull"
alias gd="git diff"
alias gc="git commit"
alias gf="git fetch"
alias gch="git checkout"
alias gl="git log"
alias gt="git tag"
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# tree
alias tre='tree -R -aI "vendor|.git|.github|node_modules|containers|*.bson|*.metadata.json" $1'

# workspace
alias workspace="cd ~/workspace/src/github.com/fberrez/"

alias lsal="ls -al"
alias code="code-insiders"

alias python=python3
alias pip=pip3

alias claude="claude --allow-dangerously-skip-permissions"
alias korint="cd ~/workspace/src/github.com/korint-io"