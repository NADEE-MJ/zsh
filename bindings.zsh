# VS Code
bindkey "^[[1;5C" forward-word # CTRL+RIGHT
bindkey "^[[1;5D" backward-word # CTRL+LEFT
bindkey "^[[3~" delete-char # DELETE
bindkey "^[[3;5~" kill-word # DELETE
bindkey "^H" backward-kill-word # BACKSPACE

# substring search, type in what to search for and substring will only display commands with that in it
zle -N history-substring-search-up
zle -N history-substring-search-down

bindkey "^[[1;2A" history-substring-search-up # SHIFT+UP
bindkey "^[[1;2B" history-substring-search-down # SHIFT+DOWN

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# beginning search
bindkey "^[OA" up-line-or-beginning-search # UP
bindkey "^[[A" up-line-or-beginning-search # UP
bindkey "^[OB" down-line-or-beginning-search # DOWN
bindkey "^[[B" down-line-or-beginning-search # DOWN

#fzf search
bindkey "^R" fzf-history-widget