# Dotfiles

## Init

Install chezmoi and setup all dotfiles:

```sh
curl https://raw.githubusercontent.com/lars-vc/dotfiles/root/first_install.sh | /bin/bash
```

## Contained Dotfiles

-   [NeoVim](private_dot_config/nvim), the magnum opus editor
-   [Ranger](private_dot_config/ranger), the best file manager
-   [Gitconfig](dot_gitconfig), git.exe
-   [Bashrc](dot_bashrc), whereis zsh
-   [Zshrc](dot_zshrc), zsh >>>>> bash
    -   [Powerlevel10k](dot_p10k.zsh), the powerful zsh theme
-   [Tmux](dot_tmux.conf), the wickedest terminal multiplexer
-   [i3](private_dot_config/i3), the fastest windowmanager
-   [Polybar](private_dot_config/polybar), the prettiest statusbar
-   [Picom](private_dot_config/picom), the only maintained compositor
-   [Rofi](private_dot_config/rofi), the fanciest runlauncher
-   [Dunst](private_dot_config/dunst), the lightest notification daemon
-   [Alacritty](private_dot_config/alacritty), the rustaceans terminal

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
