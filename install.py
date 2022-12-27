#!/bin/python3

import os

def getOutput(osCommand):
    return [item.strip() for item in osCommand]

DISTRO = getOutput(os.popen("awk -F= '/^NAME/{print $2}' /etc/os-release"))[0].replace('"', '')
print(f'current distro: {DISTRO}')

os.system('sudo apt-get update -y && sudo apt-get upgrade -y')
os.system('sudo apt-get install vim wget git curl python3.10 python-is-python3 python3-pip zsh cargo ripgrep dnsutils net-tools tig fzf bat -y')
os.system('pip install psutil')

if DISTRO == 'Ubunutu':
    os.system('sudo apt-get install locales unzip -y')

    os.system('sudo dpkg-reconfigure --frontend noninterative locales')
    os.system('sudo locale-gen --purge "en_US.UTF-8"')
    os.system('sudo update-locale "LANG=en_US.UTF-8"')

    #? exa and zoxide setup
    os.system('curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash')

    os.system('curl -L https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-musl-v0.10.1.zip > ~/packages/exa.zip')
    os.system('unzip ~/packages/exa.zip -d ~/packages/exa')
    os.system('sudo cp ~/packages/exa/bin/exa /usr/bin/exa')

    #? bat install
    os.system('mkdir ~/packages/')
    os.system('curl -L https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-musl_0.21.0_amd64.deb > ~/packages/bat.deb')
    os.system('sudo dpkg -i ~/packages/bat.deb')
elif DISTRO == 'Debian GNU/Linux':
    os.system('sudo apt install exa zoxide -y')
else:
    print('not running custom install options')

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


