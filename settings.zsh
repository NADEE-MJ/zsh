export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

#history settings
setopt INC_APPEND_HISTORY_TIME # append command to history file immediately after execution
setopt HIST_IGNORE_ALL_DUPS    # do not put duplicated command into history list
setopt HIST_REDUCE_BLANKS      # remove unnecessary blanks
setopt HIST_SAVE_NO_DUPS       # do not save duplicated command

#other options: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt autocd menucomplete nomatch

unsetopt BEEP

zle_highlight=('paste:none') #remove paste highlighting

export YSU_HARDCORE=0 # to force usage of aliases set to 1
export YSU_IGNORED_ALIASES=("gl") # ignore in YSU

# 38;5;x replace x with number from https://www.ditig.com/256-colors-cheat-sheet
export LS_COLORS="*.zsh=38;5;14:*.jsx=38;5;9:*.js=38;5;9:*.php=38;5;82" # add filetype colors for exa

# set path to only partially delete on ctrl+backspace
export WORDCHARS='*?.[]~=&;!#$%^(){}<>'

#set to true to update all plugins on zsh startup
export UPDATE_PLUGINS=false
