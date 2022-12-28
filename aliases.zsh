#?###############################################
#?python
#?###############################################
alias py="python3"

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
alias gcd="git checkout develop"
alias gl="git pull"
alias gp="git push"
alias gs="git stash -u"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gc="git commit -m"
alias ga="git add ."
alias gm="git merge"
alias gmd="git merge develop"
alias gr="git rebase"
alias grd="git rebase develop"
alias gb="git branch"
alias gd="git diff"
alias grst="git restore"

#?###############################################
#?shortcuts
#?###############################################
#open specific files in vs code
alias bashrc="code ~/.bashrc"
alias zshrc="code ~/.zshrc"
alias aliases="code ~/.config/zsh/aliases.zsh"
alias tldr='python3 -m tldr'

alias vi="vim"
alias md="mkdir -p"
alias rd="rm -r"
alias please="sudo apt"
alias bat=batcat

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

alias installed="apt list --installed | fzf"

# network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias speedtest="wget -O /dev/null http://speed.transip.nl/10mb.bin"

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

# better ls - uses exa
alias ls='exa -Fgh --group-directories-first  --icons --color always'                               # ls
alias l='exa -lbF --group-directories-first  --icons'                                               # list, size, type, git
alias ll='exa -lbGF --group-directories-first  --icons'                                             # long list
alias llm='exa -lbGF --group-directories-first  --icons --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --group-directories-first  --icons --time-style=long-iso --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --group-directories-first --icons --time-style=long-iso --color-scale'  # all + extended list
alias lS='exa -1 --group-directories-first  --icons'			                                     # one column, just names SPECIALTY VIEW
alias lt='exa --tree --level=2 --group-directories-first  --icons'                                  # tree SPECIALTY VIEW

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
#tail logs
alias t=tail-log

#restart important services on docker container
alias services=restart-services

#composer
alias ci="composer install"

#easy access to formatting tools
alias js-f=js-format
alias php-f=php-format

#laravel commands
alias worker="sudo php artisan queue:work --tries=3 --timeout=3600  --rest=0.5 --sleep=5 --queue=high,default,low,notifications"
alias pa='php artisan'
alias pamfs="php artisan migrate:fresh --seed"
alias pamf="php artisan migrate:fresh"
alias pam="php artisan migrate"
alias pat="php artisan test"
alias patf="php artisan test --filter"
alias padbs="php artisan db:seed --class="
alias padbsw="php artisan db:switch"

#js commands
alias nrp="npm run prod"
alias nerd="npm run dev"
alias nrw="npm run watch"
alias nci="npm ci --legacy-peer-deps"
alias prep="npm run prep"

#cowsay/lolcat/figlet
alias add-crap="please install lolcat cowsay figlet -y"
alias lol=lolcat
alias prepl="prep | lolcat"
alias gnusay="cowsay -f gnu"
alias gnusay="cowsay -f gnu"
alias dragonsay="cowsay -f dragon"
alias cocksay="cowsay -f cock"

#alternate names
alias flood='php artisan migrate:fresh --seed'
alias gg='dragonsay "ggez get rekt" | lol'
alias f='figlet f | lol'