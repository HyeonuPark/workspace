
alias g='git'

alias gap='git add --patch'

alias gb='git branch'
alias gbd='git branch --delete'

alias gcl='git clone'
alias gcm='git commit'
alias gck='git checkout'
alias gckb='git checkout -b'

alias gdf='git diff'

alias gs='git stash'
alias gsp='git stash pop'

alias gm='git merge'
alias grb='git rebase'

alias grs='git reset'

alias gps="git push origin $(git-current-branch)"
alias gpl="git merge --ff-only origin $(git-current-branch)"

alias gfa="git fetch --all"

alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) \- %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gla='gl --all'

alias gsync='gck master && gfa && gpl'
