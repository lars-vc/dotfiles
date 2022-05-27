#!/bin/bash

# find package manager
if   [ -x "$(which apt)" ];     then pkgm="sudo apt install -y " ; pkgmupd="sudo apt update ; sudo apt upgrade -y"
elif [ -x "$(which dnf)" ];     then pkgm="sudo dnf install -y " ; pkgmupd="sudo dnf update -y"
elif [ -x "$(which pacman)" ];  then pkgm="sudo pacman -Sy "     ; pkgmupd="sudo pacman -Syu"
else echo "Package manager not found.">&2; exit 1; fi

# UPDATE
eval $pkgmupd

# General
# extracting stuff
$pkgm dtrx
# gcc and more
$pkgm build-essential
# snap
$pkgm snapd
# rust (not certain if this works)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
cargo install cargo-edit
# fd
$pkgm fd-find
# fzf
$pkgm fzf
# random stuff
$pkgm pkg-config htop tmux sysstat xclip exa bat

# Zsh
# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# auto complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# set zsh as default
chsh -s $(which zsh)

# NeoVim
if [ -x "$(which apt)" ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable -y
fi
# sudo apt install neovim -y
$pkgm neovim
# NeoVim dependencies
$pkgm npm python3 python3-pip exuberant-ctags ripgrep wdutch sqlite3 libsqlite3-dev python-is-python3
sudo npm install -g yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
pip3 install ropevim
pip3 install pynvim
pip3 install thefuck

# Ranger
$pkgm ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# ueberzug won't work on wsl due to there not being a GUI (so ignore the errors, maybe I can add a check here or something)
pip3 install ueberzug
# ueberzug dependencies
$pkgm libjpeg62-turbo-dev zlib1g-dev libxtst-dev ffmpegthumbnailer

# None-dev stuff
# sudo snap install discord

# UPDATE
eval $pkgmupd
