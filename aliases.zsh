#?###############################################
#?python
#?###############################################
alias py="python"
alias py3="python3"

#?###############################################
#?git
#?###############################################
#initial git configuration
alias gcg=git-config-initial

#tig - nicer git status logs
alias tis="tig status"
alias til="tig log"
alias tib="tig blame -C"

#commands
alias gco="git checkout"
alias gcb="git checkout -b"
alias gl="git pull"
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

#CI specific
alias gri="git rebase integration"
alias gmi="git merge integration"
alias gci="git checkout integration"

#?###############################################
#?shortcuts
#?###############################################
#open specific files in vs code
alias bashrc="code ~/.bashrc"
alias zshrc="code ~/.zshrc"
alias aliases="code ~/.config/zsh/aliases.zsh"

alias rd="rm -r"
alias please="sudo"

#special cd commands
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias back="cd -"
alias home="cd ~"
alias trash="cd ~/.local/share/Trash/files"

#open specific folder workspaces
alias zshcode="code ~/.config/zsh/zsh.code-workspace"

#reload zsh config
alias ez="exec zsh"
alias reload="exec zsh"

#update and reload zsh
alias ezpz="zsh-pull && exec zsh"

#?###############################################
#?tools
#?###############################################
#can extract from any archive type
alias x=extract

# network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# fix typos
alias quit="exit"

# echo paths
alias print-fpath='for fp in $fpath; do echo $fp; done; unset fp'
alias print-path='echo $PATH | tr ":" "\n"'
alias print-function='print -l ${(k)functions[(I)[^_]*]} | sort'

# search
alias find-alias='alias -r | fzf'
alias find-function='print-function | fzf'
alias find-path='print-path | fzf'

# mask built-ins with better defaults
alias mkdir="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"

# clean up trashcan
alias clean-trash="unsafe-rm -r -f ~/.local/share/Trash/files"

# better ls
alias ls='exa -Fgh --group-directories-first  --icons --color always'
alias lsm='ls --sort=modified'
alias la='ls -la'
alias lam='la --soft=modified'
# displays way more info than ls
alias lx='exa -lbhHigUmuSa@ --group-directories-first --icons --time-style=long-iso --color-scale'
# ls in a tree view
alias lt='exa --tree --level=2 --group-directories-first  --icons'

# better rg defaults
alias rg="rg -i --no-ignore --hidden --no-ignore-dot"

#?###############################################
#?vs code
#?###############################################
#code commands
alias vsc="code ."
alias vsca="code --add"
alias vscd="code --diff"
alias vscg="code --goto"
alias vscn="code --new-window"
alias vscr="code --reuse-window"
alias vscw="code --wait"
alias vscu="code --user-data-dir"
alias vsced="code --extensions-dir"
alias vscie="code --install-extension"
alias vscue="code --uninstall-extension"
alias vscv="code --verbose"
alias vscl="code --log"
alias vscde="code --disable-extensions"

#?###############################################
#?CI Solutions
#?###############################################
#package managers
alias ci="composer install"
alias ni="npm install"

#easy access to formatting tools
alias js-f=js-format
alias php-f=php-format

#laravel commands
alias pa='php artisan'
alias paa='pa about'
alias worker="pa queue:work --tries=3 --timeout=3600 --queue=input_records,input_images,output_records,output_images,notifications,default,pusher,output_records_and_images,high,low"
alias pah="pa horizon"
alias pahs="pa horizon:status"
alias pahc="pa horizon:clear --queues"
alias pamfs="pa migrate:fresh --seed"
alias pamf="pa migrate:fresh"
alias pam="pa migrate"
alias pao="pa optimize"
alias paoc="pa optimize:clear"
alias pacc="pa config:cache"
alias paccl="pa config:clear"
alias pat="pa test"
alias patf="pa test --filter"
alias padbs="pa db:seed --class="
alias pasr="pa schedule:run"

#js commands
alias nr="npm run"
alias nrp="nr prod"
alias nerd="nr dev"
alias nrw="nr watch"
alias nrda="nr docker-attach"
alias nci="npm ci --legacy-peer-deps"
alias prep="nr prep"

#Fun
alias prepl="prep | lolcat"
alias narwhal="nr watch | lolcat"
alias flood='php artisan migrate:fresh --seed'

#?###############################################
#?Other
#?###############################################
#cowsay/lolcat/figlet
alias lol=lolcat
alias gnusay="cowsay -f gnu"
alias dragonsay="cowsay -f dragon"
alias cocksay="cowsay -f cock"

#alternate names
alias gg='dragonsay "ggez get rekt" | lol'
alias f='figlet f | lol'

#?###############################################
#?Challenger / Peppermint
#?###############################################
alias pr='poetry run'
alias prc='pr container'
alias prcs='pr container start'
alias prcss='pr container stop'
alias prca='pr container attach'
alias prl='pr lint'
alias prlf='pr lint filter'
alias prla='pr lint all'
alias prm='pr migrate'
alias prmc='pr migrate create'
alias prmf='pr migrate fresh'
alias prmfs='pr migrate fresh --seed'
alias prmu='pr migrate up'
alias prmd='pr migrate down'
alias prs='pr server'
alias prss='pr server start'
alias prsss='pr server stop'
alias prsf='pr server fast'
alias prsk='pr server kit'
alias prt='pr test'
alias prta='pr test all'
alias prtf='pr test filter'