# plugin storage
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

ZSHDIR="$HOME/.config/zsh"

source "$ZSHDIR/bindings.zsh"
source "$ZSHDIR/plugins.zsh"
source "$ZSHDIR/settings.zsh"
source "$ZSHDIR/functions.zsh"
source "$ZSHDIR/paths.zsh"
source "$ZSHDIR/nvm.zsh"

ALIASES_DIR="$ZSHDIR/aliases"

for alias_file in "$ALIASES_DIR"/*.zsh; do
    if [[ -r "$alias_file" ]]; then
        source "$alias_file"
    fi
done

unset alias_file ALIASES_DIR

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

fpath=($ZSHDIR/plugins-custom $ZSHDIR/custom-completions $fpath)
autoload -Uz compinit && compinit

# so that cowsay and other games work
export PATH="$PATH:/usr/games/"

# initialize zoxide
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

