# Dotfiles

## Init
Install chezmoi and setup all dotfiles:
```sh
curl https://raw.githubusercontent.com/lars-vc/dotfiles/root/first_install.sh | /bin/bash
```

## Contained Dotfiles
* [NeoVim](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/nvim), the magnum opus editor
* [Ranger](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/ranger), the best file manager
* [Gitconfig](https://github.com/lars-vc/dotfiles/blob/root/dot_gitconfig), git.exe
* [Bashrc](https://github.com/lars-vc/dotfiles/blob/root/dot_bashrc), I wanna use zsh
* [Tmux](https://github.com/lars-vc/dotfiles/blob/root/dot_tmux.conf), A terminal multiplexer

## Application specific configuration

### NeoVim

#### Font
[DejaVuSansMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular/complete), Any Nerd Font should probably work.

## Changing Dotfiles

To change dotfiles and keep chezmoi up-to-date use either:
```sh
chezmoi edit .whatever_dotfile
chezmoi apply -v
```
or
```sh
nvim .whatever_dotfile
chezmoi add .whatever_dotfile
```

## Syncing Dotfiles

To sync dotfiles with the remote run:
```sh
chezmoi update
```
