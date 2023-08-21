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
alias worker="php artisan queue:work --tries=3 --timeout=3600 --queue=input_records,input_photos,output_records,output_photos,notifications,default,pusher,output_records_and_images,high,low"
alias pah="php artisan horizon"
alias pahs="php artisan horizon:status"
alias pahc="php artisan horizon:clear --queues"
alias pamfs="php artisan migrate:fresh --seed"
alias pamf="php artisan migrate:fresh"
alias pam="php artisan migrate"
alias pao="php artisan optimize"
alias paoc="php artisan optimize:clear"
alias pacc="php artisan config:cache"
alias paccl="php artisan config:clear"
alias pat="php artisan test"
alias patf="php artisan test --filter"
alias padbs="php artisan db:seed --class="
alias pasr="php artisan schedule:run"

#js commands
alias nrp="npm run prod"
alias nerd="npm run dev"
alias nrw="npm run watch"
alias nrda="npm run docker-attach"
alias nci="npm ci --legacy-peer-deps"
alias prep="npm run prep"

#Fun
alias prepl="prep | lolcat"
alias narwhal="npm run watch | lolcat"
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
alias prc='poetry run container'
alias prcs='poetry run container start'
alias prcss='poetry run container stop'
alias prca='poetry run container attach'
alias prl='poetry run lint'
alias prlf='poetry run lint filter'
alias prla='poetry run lint all'
alias prm='poetry run migrate'
alias prmc='poetry run migrate create'
alias prmf='poetry run migrate fresh'
alias prmfs='poetry run migrate fresh --seed'
alias prmu='poetry run migrate up'
alias prmd='poetry run migrate down'
alias prs='poetry run server'
alias prss='poetry run server start'
alias prsss='poetry run server stop'
alias prsf='poetry run server fast'
alias prsk='poetry run server kit'
alias prt='poetry run test'
alias prta='poetry run test all'
alias prtf='poetry run test filter'