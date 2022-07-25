#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install python3.10 python-is-python3 python3-pip zsh cargo ripgrep dnsutils net-tools tig fzf -y
pip install psutil

#? exa and zoxide setup
cargo install exa
cargo install zoxide --locked

#? bat install
mkdir ~/packages/
curl -L https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-musl_0.21.0_amd64.deb > ~/packages/bat.deb
sudo dpkg -i ~/packages/bat.deb

#? personal zsh files install
if ! (rg "zsh" ~/.bashrc) then
    echo "zsh" >> ~/.bashrc
fi

sudo rm -r ~/.config/zsh/
mkdir -p ~/.config/zsh/
git clone --depth 1 https://github.com/NADEE-MJ/zsh.git ~/.config/zsh

rm ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc
rm ~/.p10k.zsh
ln -s ~/.config/zsh/.p10k.zsh ~/.p10k.zsh

exec zsh

#install vs code extensions
extensions=('aaron-bond.better-comments' 'streetsidesoftware.code-spell-checker' 'tombonnike.vscode-status-bar-format-toggle' 'oderwat.indent-rainbow' 'KevinRose.vsc-python-indent' 'usernamehw.errorlens' 'PKief.material-icon-theme' 'sdras.night-owl' 'johnpapa.vscode-peacock' 'alefragnani.project-manager' 'patbenatar.advanced-new-file' 'naumovs.color-highlight' 'ms-azuretools.vscode-docker' 'docsmsft.docs-markdown' 'RedVanWorkshop.explorer-exclude-vscode-extension' 'sleistner.vscode-fileutils' 'GitHub.vscode-pull-request-github' 'eamodio.gitlens' 'yzhang.markdown-all-in-one' 'telesoho.vscode-markdown-paste-image' 'DavidAnson.vscode-markdownlint' 'peakchen90.open-html-in-browser' 'christian-kohler.path-intellisense' 'bmewburn.vscode-intelephense-client' 'pnp.polacode' 'ms-python.vscode-pylance' 'ms-python.python' 'KevinRose.vsc-python-indent' 'njqdev.vscode-python-typehint' 'TabNine.tabnine-vscode' 'WakaTime.vscode-wakatime')

for i in $extensions; do
    code --install-extension $i;
done
