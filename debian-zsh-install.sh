#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install vim wget git curl python3.10 python-is-python3 python3-pip zsh cargo ripgrep dnsutils net-tools tig fzf zoxide exa bat -y
pip install psutil

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
