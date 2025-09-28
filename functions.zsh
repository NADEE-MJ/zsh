change-theme() {
    NEW_THEME=$1

    THEMEFILE="$ZSHDIR/p10kthemes/$NEW_THEME.zsh"

    if [[ ! -f $THEMEFILE ]] then
        echo "that theme does not exist"
    else
        P10K_FILE="$ZSHDIR/.p10k.zsh"
        if [[ -f $P10K_FILE ]] then
            rm -f $P10K_FILE
        fi
        cat "$THEMEFILE" >> $ZSHDIR/.p10k.zsh
    fi
}

down-line-or-beginning-search() {
    # Like down-line-or-search, but uses the whole line prefix up to the
    # cursor position for searching forwards.

    emulate -L zsh

    typeset -g __searching __savecursor

    if [[ ${+NUMERIC} -eq 0 &&
        ( $LASTWIDGET = $__searching || $RBUFFER != *$'\n'* ) ]]
    then
    [[ $LASTWIDGET = $__searching ]] && CURSOR=$__savecursor
    __searching=$WIDGET
    __savecursor=$CURSOR
    if zle .history-beginning-search-forward; then
        [[ $RBUFFER = *$'\n'* ]] ||
        zstyle -T ':zle:down-line-or-beginning-search' leave-cursor &&
        zle .end-of-line
        return
    fi
    [[ $RBUFFER = *$'\n'* ]] || return
    fi
    __searching=''
    zle .down-line-or-history
}

up-line-or-beginning-search() {
    # Like up-line-or-search, but uses the whole line prefix up to the
    # cursor position for searching backwards.

    emulate -L zsh

    typeset -g __searching __savecursor

    if [[ $LBUFFER == *$'\n'* ]]; then
    zle .up-line-or-history
    __searching=''
    elif [[ -n $PREBUFFER ]] &&
        zstyle -t ':zle:up-line-or-beginning-search' edit-buffer
    then
    zle .push-line-or-edit
    else
    [[ $LASTWIDGET = $__searching ]] && CURSOR=$__savecursor
    __savecursor=$CURSOR
    __searching=$WIDGET
    zle .history-beginning-search-backward
    zstyle -T ':zle:up-line-or-beginning-search' leave-cursor &&
        zle .end-of-line
    fi
}

git-config-initial() {
    git config --global user.name $1
    git config --global user.email $2
    git config --list
}

git-update-completion() {
    # Check if git completion files already exist
    if [[ -f $ZSHDIR/plugins-custom/_git ]] && [[ -f $ZSHDIR/plugins-custom/git-completion.bash ]]; then
        echo "git completion files already exist, skipping update"
        return
    fi

    /bin/rm -f $ZSHDIR/plugins-custom/_git
    /bin/rm -f $ZSHDIR/plugins-custom/git-completion.bash

    mkdir -p $ZSHDIR/plugins-custom

    cp $ZSHDIR/plugins/git-completion/git-completion.bash $ZSHDIR/plugins-custom/git-completion.bash
    cp $ZSHDIR/plugins/git-completion/git-completion.zsh $ZSHDIR/plugins-custom/_git

    zstyle ':completion:*:*:git:*' menu select script ~/.config/zsh/plugins-custom/git-completion.bash

    echo "git completion updated"
}

zsh-pull() {
    echo "pulling from NADEE-MJ/zsh"
    ZSHDIR=$HOME/.config/zsh/
    command git -C $ZSHDIR pull --ff --recurse-submodules --depth 1 --rebase --autostash
}

zsh-update-plugins() {
    ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
    for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
    done
}

zsh-update() {
    zsh-pull
    zsh-update-plugins
    git-update-completion
}
