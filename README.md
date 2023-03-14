# ZSH Config

## Installation

### Arch

curl -L https://raw.github.com/NADEE-MJ/zsh/main/install.py --output install.py && python -m install.py arch && rm -f install.py

### Debian12

curl -L https://raw.github.com/NADEE-MJ/zsh/main/install.py --output install.py && python3 -m install.py debian12 && rm -f install.py

### Ubuntu 20.04

curl -L https://raw.github.com/NADEE-MJ/zsh/main/install.py --output install.py && python3 -m install.py ubuntu20.04 && rm -f install.py

## Plugins Included

|                                     Plugin | Purpose                                           | Commands to Know About |
| -----------------------------------------: | :------------------------------------------------ | :--------------------: |
|             paulmelnikow/zsh-startup-timer | Times how long it takes for the prompt to startup |                        |
|                      romkatv/powerlevel10k | this is the prompt                                |                        |
|                         mattmc3/zfunctions | allows for different function setup               |                        |
|         MichaelAquilina/zsh-you-should-use | reminds you of aliases                            |                        |
|                               zshzoo/cd-ls | auto ls/exa on cd                                 |                        |
|                            xvoland/Extract | better extract tool                               |           x            |
|     zsh-users/zsh-history-substring-search | allows to search substrings in history            | SHIFT+UP or SHIFT+DOWN |
|                        mattmc3/zsh-safe-rm | stops you from making wrong moves with rm         |           rm           |
|                          romkatv/zsh-defer | defer plugin startup                              |                        |
|                     felipec/git-completion | better git completion                             |       git etc..        |
|                  zsh-users/zsh-completions | more zsh completions                              |                        |
|              zsh-users/zsh-autosuggestions | suggests previously run commands for rerunning    |                        |
|        joshskidmore/zsh-fzf-history-search | nicer history search                              |         CTRL+r         |
| zdharma-continuum/fast-syntax-highlighting | nice syntax highlighting in shell                 |                        |
|                      mattmc3/zsh_unplugged | very light zsh plugin manager                     |                        |