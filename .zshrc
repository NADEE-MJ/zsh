# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# plugin storage
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.plugin.zsh

ZSHDIR="$HOME/.config/zsh"

source "$ZSHDIR/bindings.zsh"
source "$ZSHDIR/plugins.zsh"
source "$ZSHDIR/aliases.zsh"
source "$ZSHDIR/settings.zsh"

plugin-load $repos

#set to true to update all plugins on zsh startup
UPDATE_PLUGINS=false
if ($UPDATE_PLUGINS) then
    zsh-unplugged-update
fi

# update git completions
rm -f $ZSHDIR/plugins-custom/git-completion.bash
rm -f $ZSHDIR/plugins-custom/_git

cp $ZSHDIR/plugins/git-completion/git-completion.bash $ZSHDIR/plugins-custom/git-completion.bash
cp $ZSHDIR/plugins/git-completion/git-completion.zsh $ZSHDIR/plugins-custom/_git

zstyle ':completion:*:*:git:*' menu select script ~/.config/zsh/plugins-custom/git-completion.bash
fpath=($ZSHDIR/plugins-custom $fpath)
autoload -Uz compinit && compinit

# initialize powerlevel10k theme
set-theme
source ~/.p10k.zsh

# so that exa works
echo $PATH | grep -q "$HOME/scripts"

if [ $? -eq 0 ]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# initialize zoxide
eval "$(zoxide init zsh)"
