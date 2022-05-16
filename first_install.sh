#!/bin/bash
# find package manager
if   [ -x "$(which apt)" ];     then pkgm="sudo apt install -y " ; pkgmupd="sudo apt update ; sudo apt upgrade -y"
elif [ -x "$(which dnf)" ];     then pkgm="sudo dnf install -y " ; pkgmupd="sudo dnf update -y"
elif [ -x "$(which pacman)" ];  then pkgm="sudo pacman -Sy "     ; pkgmupd="sudo pacman -Syu"
else echo "Package manager not found.">&2; exit 1; fi

if [ -x "$(which apt)" ]; then
    # add gh to apt repo
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
fi
# sudo apt update
# sudo apt install git-all -y
# sudo apt install gh -y
# sudo apt upgrade -y
eval $pkgmupd
$pkgm git-all
$pkgm gh
gh auth login
cd /
sudo sh -c "$(curl -fsLS chezmoi.io/get)"
cd ~
chezmoi init --apply https://github.com/lars-vc/dotfiles
