#!/bin/bash
# UPDATE
sudo apt update
sudo apt upgrade -y

# General
# extracting stuff
sudo apt install dtrx -y
# python is python3
sudo apt install python-is-python3 -y
# gcc and more
sudo apt install build-essential -y
# fd
sudo apt install fd-find -y

# NeoVim
sudo add-apt-repository ppa:neovim-ppa/stable -y
# NeoVim dependencies
sudo apt install npm python3 python3-pip exuberant-ctags ripgrep wdutch sqlite3 libsqlite3-dev -y
sudo npm install -g yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo pip3 install ropevim
sudo pip3 install pynvim

# Ranger
sudo apt install ranger -y
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# ueberzug won't work on wsl due to there not being a GUI (so ignore the errors, maybe I can add a check here or something)
sudo pip3 install ueberzug
sudo apt install libjpeg62-turbo-dev zlib1g-dev libxtst-dev ffmpegthumbnailer -y

# None-dev stuff
# sudo snap install discord

# UPDATE
sudo apt update
sudo apt upgrade -y
