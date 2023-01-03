#!/bin/python3

import os

os.system('sudo pacman -Syyu --noconfirm')
os.system('sudo pacman -S vim wget git curl micro python python-pip zsh ripgrep dnsutils net-tools tig fzf bat exa zoxide --noconfirm')
os.system('sudo pacman -S cowsay figlet lolcat --noconfirm')
os.system('pip install psutil')

HOME = os.path.expanduser('~')
with open(f'{HOME}/.bashrc', 'r') as file:
        content = file.read()
        if 'zsh' not in content:
            os.system('echo "zsh" >> ~/.bashrc')

os.system('sudo rm -r ~/.config/zsh/')
os.system('mkdir -p ~/.config/zsh/')
os.system('git clone --depth 1 https://github.com/NADEE-MJ/zsh.git ~/.config/zsh')

os.system('rm ~/.zshrc')
os.system('ln -s ~/.config/zsh/.zshrc ~/.zshrc')
os.system('rm ~/.p10k.zsh')
os.system('ln -s ~/.config/zsh/.p10k.zsh ~/.p10k.zsh')

os.system('exec zsh')
