export HISTFILE=~/.zsh_history
export HISTSIZE=10000
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

export YSU_HARDCORE=1 # force usage of aliases, to use baby mode set to 0
export YSU_IGNORED_ALIASES=("g" "ll") # ignore in YSU

# 38;5;x replace x with number from https://www.ditig.com/256-colors-cheat-sheet
export LS_COLORS="*.zsh=38;5;14:*.jsx=38;5;9:*.js=38;5;9:*.php=38;5;82" # add filetype colors for exa

#change p10k theme here, put the file in the p10kthemes folder
export CURRENT_P10K_THEME='main'

# set path to only partially delete on ctrl+backspace
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
