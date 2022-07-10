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
* [Zshrc](https://github.com/lars-vc/dotfiles/blob/root/dot_zshrc), zsh >>>>> bash
    * [Powerlevel10k](https://github.com/lars-vc/dotfiles/blob/root/dot_p10k.zsh), the powerful zsh theme
* [Tmux](https://github.com/lars-vc/dotfiles/blob/root/dot_tmux.conf), A terminal multiplexer
* [i3](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/i3), the fastest windowmanager
* [Polybar](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/polybar), the prettiest statusbar
* [Picom](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/picom), the only maintained compositor
* [Rofi](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/rofi), the fanciest runlauncher
* [Dunst](https://github.com/lars-vc/dotfiles/tree/root/private_dot_config/dunst), the lightest notification daemon

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
