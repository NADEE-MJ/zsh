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

mkdir ~/.local/share/Trash/files

plugin-load $repos

#set to true to update all plugins on zsh startup
UPDATE_PLUGINS=false
if ($UPDATE_PLUGINS) then
    zsh-unplugged-update
fi

# update git completions
/bin/rm -f $ZSHDIR/plugins-custom/git-completion.bash
/bin/rm -f $ZSHDIR/plugins-custom/_git

mkdir $ZSHDIR/plugins-custom
cp $ZSHDIR/plugins/git-completion/git-completion.bash $ZSHDIR/plugins-custom/git-completion.bash
cp $ZSHDIR/plugins/git-completion/git-completion.zsh $ZSHDIR/plugins-custom/_git

zstyle ':completion:*:*:git:*' menu select script ~/.config/zsh/plugins-custom/git-completion.bash
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # allows for case insensitive completion
fpath=($ZSHDIR/plugins-custom $fpath)
autoload -Uz compinit && compinit

# initialize powerlevel10k theme
set-theme
source ~/.p10k.zsh

# so that exa works
if [[ ! $PATH == "$HOME/.cargo/bin" ]]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# so that cowsay works
export PATH="$PATH:/usr/games/"

# initialize zoxide
eval "$(zoxide init zsh)"
