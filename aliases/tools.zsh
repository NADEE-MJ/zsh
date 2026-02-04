#can extract from any archive type
alias x=extract

# network
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
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
alias ls='exa -F -gh --group-directories-first  --icons --color always'
alias lsm='ls --sort=modified'
alias la='ls -la'
alias lam='la --soft=modified'
# displays way more info than ls
alias lx='exa -lbhHigUmuSa@ --group-directories-first --icons --time-style=long-iso --color-scale'
# ls in a tree view
alias lt='exa --tree --level=2 --group-directories-first  --icons'

# better rg defaults
alias rg="rg -i --no-ignore --hidden --no-ignore-dot"

alias cat='bat'
