repos=(
    # paulmelnikow/zsh-startup-timer #uncomment to time startup

    #* theme
    romkatv/powerlevel10k

    #* allows different function declaration style
    mattmc3/zfunctions

    #* tools
    MichaelAquilina/zsh-you-should-use # cannot have both this and zsh-expand enabled, pick one
    zshzoo/cd-ls
    xvoland/Extract
    zsh-users/zsh-history-substring-search
    mattmc3/zsh-safe-rm

    #* everything after defer will be loaded after prompt is up
    romkatv/zsh-defer

    #* git
    felipec/git-completion

    #* completions
    #zsh-users/zsh-completions #? seems unneccesary
    zsh-users/zsh-autosuggestions
    joshskidmore/zsh-fzf-history-search
    # MenkeTechnologies/zsh-expand # cannot have both this and zsh-you-should-use enabled, pick one

    #* formatting
    zdharma-continuum/fast-syntax-highlighting # pick this or zsh-syntax-highlighting
    # hlissner/zsh-autopair
    # zsh-users/zsh-syntax-highlighting # pick this or fast-syntax-highlighting
)