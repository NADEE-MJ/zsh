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
alias rd=rmdir
alias please=sudo
alias bat=batcat

#special cd commands
alias ..="cd .."
alias back="cd -"
alias home="cd ~"
alias trash="cd ~/.local/share/Trash/files"

#open specific folder workspaces
alias zshcode="code ~/.config/zsh/zsh.code-workspace"

#reload zsh config
alias ez="exec zsh"
alias reload="exec zsh"

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
alias print-functions='print -l ${(k)functions[(I)[^_]*]} | sort'

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
#?fax_app
#?###############################################
alias f-server="dart pub global run dhttpd"
alias p-server="./scripts/start_dev_server.sh"

#?###############################################
#?CI Solutions
#?###############################################
#restart important services on docker container
alias services=run-services

#composer
alias ci="composer install"

#easy access to formatting tools
alias js-f=js-format
alias php-f=php-format

#laravel commands
alias worker="sudo php artisan queue:work --tries=3 --timeout=3600  --rest=0.5 --sleep=5 --queue=high,default,low"
alias pa='php artisan'
alias pamfs="php artisan migrate:fresh --seed"
alias pamf="php artisan migrate:fresh --seed"
alias pam="php artisan migrate"
alias pat="php artisan test"
alias patf="php artisan test --filter"
alias padbs="php artisan db:seed --class="

#js commands
alias prep="npm run prep"
alias nrp="npm run prod"
alias nrd="npm run dev"
alias nrw="npm run watch"
alias nil="npm install --legacy-peer-deps"

#install dependencies
alias prep="composer install && npm install --legacy-peer-deps && npx husky install && npm run dev"