#!/bin/bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install git-all
sudo apt install gh
gh auth login
cd /
sudo sh -c "$(curl -fsLS chezmoi.io/get)"
cd ~
chezmoi init --apply https://github.com/lars-vc/dotfiles
