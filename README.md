# ZSH Config

## Plugins Included

|                                     Plugin | Purpose                                           | Enabled By Default |   Commands to Know About    |
| -----------------------------------------: | :------------------------------------------------ | :----------------: | :-------------------------: |
|             paulmelnikow/zsh-startup-timer | Times how long it takes for the prompt to startup |         no         |                             |
|                      romkatv/powerlevel10k | this is the prompt                                |        yes         |                             |
|                         mattmc3/zfunctions | allows for different function setup               |        yes         |                             |
|         MichaelAquilina/zsh-you-should-use | reminds you of aliases                            |        yes         |                             |
|                               zshzoo/cd-ls | auto ls/exa on cd                                 |        yes         |                             |
|                            xvoland/Extract | better extract tool                               |        yes         |              x              |
|     zsh-users/zsh-history-substring-search | allows to search substrings in history            |        yes         |   SHIFT+UP or SHIFT+DOWN    |
|                        mattmc3/zsh-safe-rm | stops you from making wrong moves with rm         |        yes         |             rm              |
|                          romkatv/zsh-defer | defer plugin startup                              |        yes         |                             |
|                     felipec/git-completion | better git completion                             |        yes         |          git etc..          |
|                                wfxr/forgit | nicer git interface                               |        yes         | ga, glo, gi, gd, gcb, etc.. |
|                  zsh-users/zsh-completions | more zsh completions                              |         no         |                             |
|              zsh-users/zsh-autosuggestions | suggests previously run commands for rerunning    |        yes         |                             |
|        joshskidmore/zsh-fzf-history-search | nicer history search                              |        yes         |           CTRL+r            |
|               MenkeTechnologies/zsh-expand | expands aliases                                   |         no         |                             |
|                     jessarcher/zsh-artisan | better completion for php artisan                 |        yes         |                             |
| zdharma-continuum/fast-syntax-highlighting | nice syntax highlighting in shell                 |        yes         |                             |
|                      hlissner/zsh-autopair | auto adds closing parens, quotes, etc..           |        yes         |                             |
|          zsh-users/zsh-syntax-highlighting | nice syntax highlighting                          |         no         |                             |
|                         ajeetdsouza/zoxide | better cd                                         |        yes         |              z              |
|                             Bhupesh-V/ugit | undo git commands                                 |        yes         |            ugit             |
|                                  ogham/exa | better ls                                         |        yes         |      ls, la, ll, etc.       |
|                                sharkdp/bat | better cat                                        |        yes         |             bat             |
|                         BurntSushi/ripgrep | better grep                                       |        yes         |             rg              |
|                      mattmc3/zsh_unplugged | very light zsh plugin manager                     |        yes         |                             |

## Useful Aliases

<details>
    <summary>Python</summary>

    py ==> ```python3```
</details>

<details>
    <summary>git</summary>

    initial git configuration
    gcg ==> ```git-config-initial```

    tig - nicer git status logs
    tis ==> ```tig status```
    til ==> ```tig log```
    tib ==> ```tig blame -C```

    commands
    gc ==> ```git checkout```
</details>

<details>
    <summary>Shortcuts</summary>

    open specific files in vs code
    bashrc ==> ```code ~/.bashrc```
    zshrc ==> ```code ~/.zshrc```
    aliases ==> ```code ~/.config/zsh/aliases.zsh```

    vi ==> ```vim```
    md ==> ```mkdir -p```
    rd ==> ```rmdir```
    please ==> ```sudo```

    special cds
    .. ==> ```cd ..```
    back ==> ```cd -```
    home ==> ```cd ```~
    trash ==> ```cd ~/.local/share/Trash/files```

    open specific folder workspaces
    zshcode ==> ```code ~/.config/zsh```

    reload zsh config
    ez ==> ```exec zsh```
    reload ==> ```exec zsh```

    zsh-update-plugins ==> ```zsh-unplugged-update```
</details>

<details>
    <summary>Tools</summary>

    can extract from any archive type
    x ==> ```extract```

    installed ==> ```apt list --installed | fzf```

    network
    ip ==> ```dig +short myip.opendns.com @resolver1.opendns.com```
    iplocal ==> ```ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'```
    speedtest ==> ```wget -O /dev/null http://speed.transip.nl/10mb.bin```

    fix typos
    quit ==> ```exit```

    echo paths
    print-fpath ==> ```for fp in $fpath; do echo $fp; done; unset fp```
    print-path ==> ```echo $PATH | tr : \n```
    print-functions ==> ```print -l ${(k)functions[(I)[^_]*]} | sort```

    mask built-ins with better defaults
    mkdir ==> ```mkdir -p```
    cp ==> ```cp -i```
    mv ==> ```mv -i```

    clean up trashcan
    clean-trash ==> ```unsafe-rm -r -f ~/.local/share/Trash/files```

    better ls - uses exa
    ls ==> ```exa -Fgh --group-directories-first --git --icons --color always```
    l ==> ```exa -lbF --group-directories-first --git --icons```
    ll ==> ```exa -lbGF --group-directories-first --git --icons```
    llm ==> ```exa -lbGF --group-directories-first --git --icons --sort | modified```
    la ==> ```exa -lbhHigUmuSa --group-directories-first --git --icons --time-style | long-iso --color-scale```
    lx ==> ```exa -lbhHigUmuSa@ --group-directories-first --git--icons --time-style | long-iso --color-scale```
    lS ==> ```exa -1 --group-directories-first --git --icons```
    lt ==> ```exa --tree --level | 2 --group-directories-first --git --icons```
</details>

<details>
    <summary>VS Code</summary>

    vsc ==> ```code .```
    vsca ==> ```code --add```
    vscd ==> ```code --diff```
    vscg ==> ```code --goto```
    vscn ==> ```code --new-window```
    vscr ==> ```code --reuse-window```
    vscw ==> ```code --wait```
    vscu ==> ```code --user-data-dir```
    vsced ==> ```code --extensions-dir```
    vscie ==> ```code --install-extension```
    vscue ==> ```code --uninstall-extension```
    vscv ==> ```code --verbose```
    vscl ==> ```code --log```
    vscde ==> ```code --disable-extensions```
</details>

<details>
    <summary>fax-app</summary>

    f-server ==> ```dart pub global run dhttpd```
    p-server ==> ```./scripts/start_dev_server.sh```
</details>

<details>
    <summary>CI Solutions</summary>

    restart important services on docker container
    services ==> ```run-services```

    easy access to formatting tools
    js-f ==> ```js_format```
    php-f ==> ```php_format```

    laravel commands
    worker ==> ```sudo php artisan queue:work --tries | 3 --timeout | 3600  --rest | 0.5 --sleep | 5 --queue | high,default,low```
    pamf ==> ```sudo php artisan migrate:fresh --seed```
    pat ==> ```php artisan test```
    patf ==> ```php artisan test --filter```

    js commands
    nrp ==> ```npm run prod```
    nrd ==> ```npm run dev```
    nrw ==> ```npm run watch```
</details>
