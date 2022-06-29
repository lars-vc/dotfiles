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
    sudo apt install software-properties-common -y
fi

eval $pkgmupd
$pkgm git
$pkgm gh
gh auth login
cd /
sudo sh -c "$(curl -fsLS chezmoi.io/get)"
cd ~

# install zsh
$pkgm zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
# auto complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh theme powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# notify zsh plugin
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/auto-notify
# set zsh as default
# sudo chsh -s $(which zsh)

# chezmoi setup
chezmoi init --apply https://github.com/lars-vc/dotfiles
