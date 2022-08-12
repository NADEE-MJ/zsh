#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install locales python3.10 python-is-python3 python3-pip vim wget git curl zsh cargo ripgrep dnsutils net-tools tig fzf bat -y
pip install psutil

sudo dpkg-reconfigure --frontend noninterative locales
sudo locale-gen --purge "en_US.UTF-8"
sudo update-locale "LANG=en_US.UTF-8"

#? exa and zoxide setup
cargo install exa
cargo install zoxide

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
