#initial git configuration
alias gcg=git-config-initial

#tig - nicer git status logs
alias tis="tig status"
alias til="tig log"
alias tib="tig blame -C"

#commands
alias gco="git checkout"
alias gcb="git checkout -b"
alias gl="git pull --rebase"
alias gp="git push"
alias gst="git status"
alias gs="git stash -u"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gc="git commit"
alias gcm="git commit -m"
alias ga="git add ."
alias gm="git merge"
alias gr="git rebase"
alias gb="git branch"
alias gd="git diff"
alias grst="git restore"
alias gcp="git cherry-pick"
alias grph="git rev-parse HEAD"

#CI specific
alias gri="git rebase integration"
alias gmi="git merge integration"
alias gci="git checkout integration"