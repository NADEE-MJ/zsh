# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# plugin storage
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi

source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

ZSHDIR="$HOME/.config/zsh"

source "$ZSHDIR/bindings.zsh"
source "$ZSHDIR/plugins.zsh"
source "$ZSHDIR/aliases.zsh"
source "$ZSHDIR/settings.zsh"
source "$ZSHDIR/functions.zsh"

if [[ -f $ZSHDIR/overrides.zsh ]]; then
    source "$ZSHDIR/overrides.zsh"
fi

if [[ ! -d "~/.local/share/Trash/files" ]]; then
  mkdir ~/.local/share/Trash/files
fi

plugin-load $repos

# initialize git completions
if [[ ! -d $ZSHDIR/plugins-custom ]]; then
  git-update-completion
fi

zstyle ':completion:*:*:git:*' menu select script ~/.config/zsh/plugins-custom/git-completion.bash

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # allows for case insensitive completion
fpath=($ZSHDIR/plugins-custom $fpath)
autoload -Uz compinit && compinit

# initialize powerlevel10k
THEMEFILE="$ZSHDIR/p10kthemes/main.zsh"
THEMEFILE_DESTINATION="$ZSHDIR/.p10k.zsh"
if [[ ! -f $THEMEFILE_DESTINATION ]] then
    cat "$THEMEFILE" >> $THEMEFILE_DESTINATION
fi
source ~/.p10k.zsh

# so that cowsay and other games work
export PATH="$PATH:/usr/games/"

# initialize zoxide
eval "$(zoxide init zsh)"

printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c'