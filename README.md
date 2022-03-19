# Dotfiles

## Init
Install chezmoi and setup all dotfiles:
```sh
sh -c "$(curl -fsLS chezmoi.io/get)"
chezmoi init --apply --verbose https://github.com/lars-vc/dotfiles.git
```

## Contained Dotfiles
* [NeoVim]()
* [Ranger]()
* [Gitconfig]()
* [Bashrc]() I want to swap to zsh though

## Dependencies

Auto-install all dependencies by running:
```sh
chezmoi cd
sudo chmod +x install.sh
./install.sh
exit
```

## Application specific configuration

### NeoVim

run `nvim` and do:
```sh
:PlugInstall!
```
