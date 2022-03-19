# Dotfiles

## Init
Install chezmoi and setup all dotfiles:
```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply --verbose https://github.com/lars-vc/dotfiles.git
```

## Contained Dotfiles
* [NeoVim](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/nvim)
* [Ranger]()
* [Gitconfig](https://github.com/lars-vc/dotfiles/blob/root/dot_gitconfig)
* [Bashrc](https://github.com/lars-vc/dotfiles/blob/root/dot_bashrc) I want to swap to zsh though

## Application specific configuration

### NeoVim

#### Plugins
run `nvim` and do:
```sh
:PlugInstall!
```
#### Font
[DejaVuSansMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular/complete), Any Nerd Font should probably work.

## Syncing Dotfiles

To sync dotfiles with the remote run:
```sh
chezmoi update
```
