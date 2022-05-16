#!/bin/bash

# find package manager
if   [ -x "$(which apt)" ];     then pkgm="sudo apt install -y " ; pkgmupd="sudo apt update ; sudo apt upgrade -y"
elif [ -x "$(which dnf)" ];     then pkgm="sudo dnf install -y " ; pkgmupd="sudo dnf update -y"
elif [ -x "$(which pacman)" ];  then pkgm="sudo pacman -Sy "     ; pkgmupd="sudo pacman -Syu"
else echo "Package manager not found.">&2; exit 1; fi

# UPDATE
# sudo apt update
# sudo apt upgrade -y
$pkgmupd

# General
# extracting stuff
# sudo apt install dtrx -y
$pkgm dtrx
# gcc and more
# sudo apt install build-essential -y
$pkgm build-essential
# snap
# sudo apt install snapd -y
$pkgm snapd
# rust (not certain if this works)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
cargo install cargo-edit
# fd
# sudo apt install fd-find -y
$pkgm fd-find
# fzf
# sudo apt install fzf -y
$pkgm fzf
# random stuff
# sudo apt install pkg-config htop tmux sysstat tree xclip -y
$pkgm pkg-config htop tmux sysstat tree xclip

# NeoVim
if [ -x "$(which apt)" ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable -y
fi
# sudo apt install neovim -y
$pkgm neovim
# NeoVim dependencies
# sudo apt install npm python3 python3-pip exuberant-ctags ripgrep wdutch sqlite3 libsqlite3-dev python-is-python3 -y
$pkgm npm python3 python3-pip exuberant-ctags ripgrep wdutch sqlite3 libsqlite3-dev python-is-python3
sudo npm install -g yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
pip3 install ropevim
pip3 install pynvim

# Ranger
# sudo apt install ranger -y
$pkgm ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# ueberzug won't work on wsl due to there not being a GUI (so ignore the errors, maybe I can add a check here or something)
pip3 install ueberzug
# sudo apt install libjpeg62-turbo-dev zlib1g-dev libxtst-dev ffmpegthumbnailer -y
$pkgm libjpeg62-turbo-dev zlib1g-dev libxtst-dev ffmpegthumbnailer

# None-dev stuff
# sudo snap install discord

# UPDATE
# sudo apt update
# sudo apt upgrade -y
$pkgmupd
