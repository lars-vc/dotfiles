#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/stable

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt upgrade

sudo apt install gh
sudo apt install npm
sudo npm install -g yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo apt install python3
sudo apt install python3-pip

sudo apt install exuberant-ctags
sudo apt install sqlite3 libsqlite3-dev
pip install ropevim
sudo apt install ripgrep
sudo apt install wdutch

sudo apt update
sudo apt upgrade
gh auth
