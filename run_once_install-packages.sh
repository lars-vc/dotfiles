#!/bin/bash
sudo apt update
# NeoVim
sudo add-apt-repository ppa:neovim-ppa/stable -y
# gh github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# UPDATE
sudo apt update
sudo apt upgrade

# General
# Snap
sudo apt install snapd -y
# extracting stuff
sudo apt install dtrx -y
# python is python3
sudo apt install python-is-python3 -y
# gcc and more
sudo apt install build-essential -y

# NeoVim dependencies
sudo apt install npm python3 python3-pip exuberant-ctags ripgrep wdutch sqlite3 libsqlite3-dev -y
sudo npm install -g yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo pip install ropevim

# Ranger
sudo apt install ranger -y
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
sudo pip install ueberzug
sudo apt install libjpeg8-dev zlib1g-dev libxtst-dev ffmpegthumbnailer -y

# None-dev stuff
# sudo snap install discord

# UPDATE
sudo apt update
sudo apt upgrade
