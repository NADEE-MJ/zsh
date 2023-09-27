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

if [[ -f $ZSHDIR/overrides.zsh ]]; then
    source "$ZSHDIR/overrides.zsh"
fi

if [[ ! -d "~/.local/share/Trash/files" ]]; then
  mkdir ~/.local/share/Trash/files
fi

#update zsh plugins and load
if ($UPDATE_PLUGINS) then
    zsh-unplugged-update
fi

plugin-load $repos

# update git completions
/bin/rm -f $ZSHDIR/plugins-custom/git-completion.bash
/bin/rm -f $ZSHDIR/plugins-custom/_git

if [[ ! -d $ZSHDIR/plugins-custom ]]; then
  mkdir $ZSHDIR/plugins-custom
fi

cp $ZSHDIR/plugins/git-completion/git-completion.bash $ZSHDIR/plugins-custom/git-completion.bash
cp $ZSHDIR/plugins/git-completion/git-completion.zsh $ZSHDIR/plugins-custom/_git

zstyle ':completion:*:*:git:*' menu select script ~/.config/zsh/plugins-custom/git-completion.bash

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # allows for case insensitive completion
fpath=($ZSHDIR/plugins-custom $fpath)
autoload -Uz compinit && compinit

# initialize powerlevel10k theme
THEMEFILE="$ZSHDIR/p10kthemes/$CURRENT_P10K_THEME.zsh"

if [[ ! -f $THEMEFILE ]] then
    echo "that theme does not exist"
else
    P10K_FILE="$ZSHDIR/.p10k.zsh"
    if [[ -f $P10K_FILE ]] then
        rm -f $P10K_FILE
    fi
    cat "$THEMEFILE" >> $ZSHDIR/.p10k.zsh
fi

source ~/.p10k.zsh

# so that cowsay and other games work
export PATH="$PATH:/usr/games/"

# initialize zoxide
eval "$(zoxide init zsh)"

# initialize fuck
eval $(thefuck --alias)
