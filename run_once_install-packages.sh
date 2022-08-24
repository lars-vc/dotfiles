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
# rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# rustup update
# cargo install cargo-edit
# fd
$pkgm fd-find
# fzf
$pkgm fzf
# random stuff
$pkgm pkg-config htop sysstat xclip exa bat

if [ -x "$(which apt)" ]; then 
    # fix fd and bat
    ln -s $(which fdfind) ~/.local/bin/fd
    ln -s /usr/bin/batcat ~/.local/bin/bat
    # install latest tmux
    sudo apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
    rm -fr /tmp/tmux
    git clone https://github.com/tmux/tmux.git /tmp/tmux
    cd /tmp/tmux
    git checkout master
    sh autogen.sh
    ./configure && make
    sudo make install
    cd -
    rm -fr /tmp/tmux
else
    $pkgm tmux
fi

# Zsh dependencies
$pkgm libnotify-bin

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
pip3 install ranger-fm
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# ueberzug won't work on wsl due to there not being a GUI (so ignore the errors, maybe I can add a check here or something)
pip3 install ueberzug
# ueberzug dependencies
$pkgm libjpeg62-turbo-dev zlib1g-dev libxtst-dev ffmpegthumbnailer

# None-dev stuff
# sudo snap install discord

# UPDATE
eval $pkgmupd
