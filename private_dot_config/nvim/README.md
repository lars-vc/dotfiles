# NeoVim configfiles

* [Install](#install)
* [Dependencies](#dependencies)
  * [Font](#font)
  * [Wakatime](#wakatime)
  * [Node](#node)
  * [Python3](#python3)
  * [Tagbar](#tagbar)
  * [Git](#git)
  * [Neoclip](#neoclip)
  * [Other stuff](#other-stuff)
* [Known Problems](#known-problems)
  * [Vimplug not running commands](#vimplug-not-running-commands)
    * [Fzf extension for telescope](#fzf-extension-for-telescope)
    * [Markdown previewer](#markdown-previewer)
  * [Cause](#cause)
* [All plugins](#all-plugins)
* [Minor annoyances to fix](#minor-annoyances-to-fix)
* [Maybelookats](#maybelookats)

## Install
### Automatic install
!Beware, not tested yet!

Run:
```sh
mkdir -p ~/.config/nvim/
cd ~/.config/nvim/
git clone https://github.com/lars-vc/neovim-config .
chmod +x install.sh
./install.sh
```
Then open `nvim` and do:
```
:PlugInstall!
```

### Manual install
First install [NeoVim](https://github.com/neovim/neovim), this can be done like so:
```
sudo apt install neovim
```

Sometimes the ubuntu version might run behind, fix that by adding this [stable ppa](https://code.launchpad.net/~neovim-ppa/+archive/ubuntu/stable) or this [unstable ppa](https://code.launchpad.net/~neovim-ppa/+archive/ubuntu/unstable):
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade
```

Then add the config by cloning in `~/.config/nvim`:
```
mkdir -p ~/.config/nvim/
cd ~/.config/nvim/
git clone https://github.com/lars-vc/neovim-config .
```
Finally run nvim, you will get a lot of errors on startup but this is normal! Run:
```
:PlugInstall!
```
in NeoVim, then close and relaunch.

Now you are all setup inside of NeoVim. However some plugins might still not function properly due to them having some dependencies, see below to fix this.

## Dependencies

### Font
[DejaVuSansMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular/complete),
Any Nerd Font should probably work.

### Wakatime
Fill in your [API key](https://wakatime.com/settings/api-key) when the plugin asks for it.

### Node
```sh
sudo apt install npm
sudo npm install -g yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
```

### Python3
```sh
sudo apt install python3
sudo apt install python3-pip
```

### Tagbar
```sh
sudo apt install exuberant-ctags
```

### Git
```sh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```
also setup `gh auth`

### Neoclip
```sh
sudo apt install sqlite3 libsqlite3-dev
```

### Other stuff
```sh
pip install ropevim
sudo apt install ripgrep
sudo apt install wdutch
```

## Known Problems

### Vimplug not running commands
run the commands given as argument to vimplug (the ones after 'do' : ...).

#### Fzf extension for telescope
```sh
cd plugged/telescope-fzf-native.nvim
make
```

#### Markdown previewer
```sh
cd plugged/markdown-preview.nvim/app
yarn install
```

### Cause
If you get weird errors while typing cause just remove the `plugged/` directory and do
```viml
:PlugInstall
```
inside neovim.

## All plugins

* [Material theme](https://github.com/marko-cerovac/material.nvim/)
* [Telescope](https://github.com/nvim-telescope/telescope.nvim/)
    * [Plenary](https://github.com/nvim-lua/plenary.nvim/)
    * [fzf extension](https://github.com/nvim-telescope/telescope-fzf-native.nvim')
    * [Icons in Telescope](https://github.com/kyazdani42/nvim-web-devicons/)
* [Airline status bar](https://github.com/vim-airline/vim-airline/)
    * [Airline themes](https://github.com/vim-airline/vim-airline-themes/)
* [Fugitive git wrapper](https://github.com/tpope/vim-fugitive/)
* [Conquer of Completion](https://github.com/neoclide/coc.nvim)
* [NERDtree](https://github.com/preservim/nerdtree/)
    * [Colour in NERDtree](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/)
    * [Icons in NERDtree](https://github.com/ryanoasis/vim-devicons/)
    * [Close all NERDtree buffers at once](https://github/jistr/vim-nerdtree-tabs/)
* [Smooth scrolling](https://github.com/psliwka/vim-smoothie/)
* [Floating Terminal](https://github.com/voldikss/vim-floaterm/)
* [Bracket matching](https://github.com/jiangmiao/auto-pairs/)
* [Tree sitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [Easier commenting](https://github.com/tpope/vim-commentary/)
* [Git gutter](https://github.com/airblade/vim-gitgutter/)
* [Wakatime](https://github.com/wakatime/vim-wakatime/)
* [Debugging](https://github.com/puremourning/vimspector/)
* [Moving around files with light speed](https://github.com/ggandor/lightspeed.nvim/)
    * [Repeating actions](https://github.com/tpope/vim-repeat/)
* [Visual clipboard](https://github/AckslD/nvim-neoclip.lua/)
    * [Persisting clipboard](https://github/tami5/sqlite.lua/)
* [Vim practise](https://github/ThePrimeagen/vim-be-good/)
* [Tag bar](https://github/preservim/tagbar/)
* [Which key](https://github/folke/which-key.nvim/)
* [Tabular](https://github/godlygeek/tabular/)
* [Markdown additions](https://github/preservim/vim-markdown/)
    * [Markdown preview](https://github/iamcco/markdown-preview.nvim/)
* [Sniprun](https://github.com/michaelb/sniprun)
* [Harpoon](https://github.com/ThePrimeagen/harpoon)
* [Snippets](https://github.com/rafamadriz/friendly-snippets)

## Minor annoyances to fix
* Floaterm cutting off output

## Maybelookats
* [octo](https://github.com/pwntester/octo.nvim)
* [himalaya](https://github.com/soywod/himalaya)
* [agenda](https://github.com/dhruvasagar/vim-dotoo)
* [org-mode](https://github.com/vimoutliner/vimoutliner)
* [dashboard](https://github.com/glepnir/dashboard-nvim)
* [vim surround](https://github.com/tpope/vim-surround)
* vimrc without plugins for servers / or a plugin that allows this config to run on servers (https://serverfault.com/questions/33423/how-to-bring-vimrc-around-when-i-ssh) (https://github.com/jpalardy/vim-slime)

