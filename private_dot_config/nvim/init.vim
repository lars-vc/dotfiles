" lars-vc's config file
"    ___  __  ________  ________   ___    ___    _   ________ 
"  ╱╱   ╲╱  ╲╱    __  ╲╱   ___  ╲ ╱   ╲  ╱   ╲  ╱_╱ ╱        ╲
" ╱╱        ╱    __╱  ╱      ╱  ╱ ╲    ╲╱    ╱___  ╱         ╱
"╱         ╱     ____╱   ___╱  ╱   ╲        ╱╱   ╱╱   ╱  ╱  ╱ 
"╲__╱╲____╱╲________╱╲________╱     ╲______╱╱___╱ ╲__╱__╱__╱  

"===========================================================
"---------------------------Basic---------------------------
"===========================================================
syntax on               " enables syntax highlighting
set termguicolors       " better colors
set tabstop=4           " number of spaces in a <Tab>
set shiftwidth=4        " 
set softtabstop=4       " 
set expandtab           " 
set smartindent         " enable autoindents
set number              " adds line numbers
set relativenumber      " relative numbers in sidebar
set numberwidth=4       " columns used for the line number
set incsearch           " highlighting matched strings while searching
set nohlsearch          " no remaining highlights on search
set noea                " splitting windows
set hidden              " navigate buffers without losing unsaved work
set scrolloff=8         " start scrolling when 8 lines from top or bottom
set undofile            " save undo history
set mouse=a             " enable mouse support
set ignorecase          " case insensitive search unless capital letters are used
set smartcase           " 
set nrformats+=alpha    " increment letters
set timeoutlen=555      " for whichkey to show up quicker
set spelllang=en,nl     " spelling for certain files
"===========================================================
"--------------------------Keymaps--------------------------
"===========================================================
inoremap jk <Esc>
nnoremap <SPACE> <Nop>
let mapleader = " "
" navigating plugins
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
" moving in insert mode
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
" moving around windows
nnoremap <A-H> <C-w>h
nnoremap <A-J> <C-w>j
nnoremap <A-K> <C-w>k
nnoremap <A-L> <C-w>l
" creating and moving the splits
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>ss :split<CR>
nnoremap <leader>sx <C-w>x
" searching centers the line
nnoremap n nzzzv
nnoremap N Nzzzv
" closing stuff
nnoremap <leader>xt :wa<cr>:tabclose<cr>
nnoremap <leader>xx :wa<cr>:qa<cr>
nnoremap <leader>xq :qa!<cr>
" cheatsheet (outdated)
:command Cheat tabedit ~/.config/nvim/cheatsheet.vim
" undo breakpoints
inoremap . .<C-g>u
inoremap , ,<C-g>u
" moving text
nnoremap <A-k> :m .-2<CR>
nnoremap <A-j> :m .+1<CR>
vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv
nnoremap <A-l> >>
nnoremap <A-h> <<
vnoremap <A-h> :<<CR>gv
vnoremap <A-l> :><CR>gv
" moving around in command mode
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>
"===========================================================
"--------------------------Plugins--------------------------
"===========================================================
" making sure vim-plug is installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" Vim-plug
call plug#begin('~/.config/nvim/plugged')
" --Theme--
Plug 'marko-cerovac/material.nvim'
" --Telescope--
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
" --Airline--
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" --Vim-Fugitive--
Plug 'tpope/vim-fugitive'
" --COC--
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" --Nerd tree--
Plug 'preservim/nerdtree'
" --Better scrolling--
Plug 'psliwka/vim-smoothie'
" --Terminal--
Plug 'voldikss/vim-floaterm'
" --Auto pairs--
Plug 'jiangmiao/auto-pairs'
" Plug 'LunarWatcher/auto-pairs'
Plug 'tpope/vim-surround'
" --Treeshitter--
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" --Commenting (gcc)--
Plug 'tpope/vim-commentary'
" --Git stuff--
" Plug 'airblade/vim-gitgutter'
" --Wakatime--
Plug 'wakatime/vim-wakatime'
" --Debugger--
Plug 'puremourning/vimspector'
" --Tree icons--
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" --Lightspeed--
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'
" --Neoclip--
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua'
" --Sessions--
Plug 'jistr/vim-nerdtree-tabs'
" --Practise--
Plug 'ThePrimeagen/vim-be-good'
" --TagBar--
Plug 'preservim/tagbar'
" --WhichKey--
Plug 'folke/which-key.nvim'
" --Aligning text--
Plug 'godlygeek/tabular'
" --Markdown
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
" --Sniprun--
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
" --Harpoon--
Plug 'ThePrimeagen/harpoon'
" --Snippets--
Plug 'rafamadriz/friendly-snippets'
" --IndentGuides--
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()
" load lua files
lua require('lars-vc')
"===========================================================
"--------------------------Colours--------------------------
"===========================================================
colorscheme material
let g:material_style = 'oceanic'
"===========================================================
"-----------------------Plugin Setups-----------------------
"===========================================================
"//////////////////////////Airline\\\\\\\\\\\\\\\\\\\\\\\\\\
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline_theme='deus'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set updatetime=100
set noshowmode
"\\\\\\\\\\\\\\\\\\\\\\\\\\______//////////////////////////

"/////////////////////////NERDtree\\\\\\\\\\\\\\\\\\\\\\\\\\
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * if argc() == 1 | execute 'NERDTree' | wincmd p | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
nnoremap <leader>nt  :NERDTreeMirrorToggle<CR>
nnoremap <leader>nc  :NERDTreeClose<CR>
nnoremap <leader>no  :NERDTreeMirrorOpen<CR>
nnoremap <leader>nf  :NERDTreeFind<CR>
nnoremap <leader>nat :NERDTreeTabsToggle<CR>
nnoremap <leader>nac :NERDTreeTabsClose<CR>
nnoremap <leader>nao :NERDTreeTabsOpen<CR>
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"\\\\\\\\\\\\\\\\\\\\\\\\\_______//////////////////////////

"/////////////////////////Floaterm\\\\\\\\\\\\\\\\\\\\\\\\\\
" Save all tabs when opening terminal
nnoremap   <silent>   ²       :wa<CR>:FloatermToggle<CR>
tnoremap   <silent>   ²       <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_height=0.95
let g:floaterm_width=0.8
"\\\\\\\\\\\\\\\\\\\\\\\\\_______//////////////////////////

"///////////////////////////COC\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
set cmdheight=2
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>cn <Plug>(coc-rename)
" Autoformatting with coc
let g:python3_host_prog="/usr/bin/python3"
au BufWrite * :call CocAction('format')
noremap <C-A-l> :call CocAction('format')<CR>
" GoTo code navigation.
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nnoremap <silent> <leader>ct :call <SID>show_documentation()<CR>
" show documentation on hover and SPC ct
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Extensions
let g:coc_global_extensions = ["coc-clangd", "coc-html", "coc-java", "coc-json", "coc-kotlin", "coc-pyright", "coc-rls", "coc-tsserver", "coc-dictionary", "coc-snippets"]
"\\\\\\\\\\\\\\\\\\\\\\\\\\\___/////////////////////////////

"/////////////////////////Telescope\\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fn <cmd>Telescope neoclip plus<cr><Esc>
nnoremap <leader>fi <cmd>Telescope find_files cwd=~/.config/nvim<cr>
nnoremap <leader>fp <cmd>Telescope planets<cr><esc>
" help related
nnoremap <leader>fhh <cmd>Telescope help_tags<cr>
nnoremap <leader>fhc <cmd>Telescope command_history<cr>
nnoremap <leader>fhs <cmd>Telescope search_history<cr>
nnoremap <leader>fhm <cmd>Telescope man_pages<cr>
nnoremap <leader>fhk <cmd>Telescope keymaps<cr>
nnoremap <leader>fho <cmd>Telescope vim_options<cr>
nnoremap <leader>fhr <cmd>Telescope reloader<cr>
nnoremap <leader>fhb <cmd>Telescope builtin<cr>
" git related stuff
nnoremap <leader>gfc <cmd>Telescope git_commits<cr><esc>
nnoremap <leader>gfb <cmd>Telescope git_bcommits<cr><esc>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
"\\\\\\\\\\\\\\\\\\\\\\\\\_________/////////////////////////

"////////////////////////Vimspector\\\\\\\\\\\\\\\\\\\\\\\\\
let g:vimspector_code_minwidth = 90
let g:vimspector_terminal_maxwidth = 75
let g:vimspector_terminal_minwidth = 20
" Debug launch window setup (hacky but works)
nmap <leader>dd :call vimspector#Launch()<CR>:NERDTreeClose<CR>2<C-w>j:q<CR>
nmap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>dc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
nmap <leader>db <Plug>VimspectorBreakpoints
nmap <leader>dg <Plug>VimspectorGoToCurrentLine
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-node-debug2']
" for normal mode - the word under the cursor
nmap <leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <leader>di <Plug>VimspectorBalloonEval
"\\\\\\\\\\\\\\\\\\\\\\\\__________/////////////////////////

"///////////////////////Vim-fugitive\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>gg :Git 
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :Git commit -a -m ""<Left>
" for merge conflicts
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
"\\\\\\\\\\\\\\\\\\\\\\\____________////////////////////////

"/////////////////////////Markdown\\\\\\\\\\\\\\\\\\\\\\\\\\
" need to be in the markdown buffer for these to work
nnoremap <leader>mpo :MarkdownPreview<CR>
nnoremap <leader>mpc :MarkdownPreviewStop<CR>
nnoremap <leader>mpt :MarkdownPreviewToggle<CR>
" take first spellingfix
nnoremap <leader>z 1z=
nnoremap <leader>mh  :HeaderDecrease<CR>
nnoremap <leader>ml  :HeaderIncrease<CR>
xnoremap <leader>mh  :HeaderDecrease<CR>
xnoremap <leader>ml  :HeaderIncrease<CR>
nnoremap <leader>mt  :TableFormat<CR>
nnoremap <leader>mii :InsertToc<CR>
nnoremap <leader>min :InsertNToc<CR>
nnoremap <leader>mic :InsertToc
" Tabular
nnoremap <leader>t :Tabular /
xnoremap <leader>t :Tabular /
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_strikethrough = 1
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal dictionary+=/usr/share/dict/words
autocmd FileType markdown setlocal dictionary+=/usr/share/dict/dutch
"\\\\\\\\\\\\\\\\\\\\\\\\\________//////////////////////////

"//////////////////////////Sniprun\\\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>rr :SnipRun<CR>
nnoremap <leader>rx :SnipReset<CR>
nnoremap <leader>rc :SnipClose<CR>
xnoremap <leader>rr :SnipRun<CR>
"\\\\\\\\\\\\\\\\\\\\\\\\\________//////////////////////////

"//////////////////////////Harpoon\\\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader><leader> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>j :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>k :lua require("harpoon.ui").nav_prev()<CR>
nnoremap , <nop>
nnoremap ,, :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap ,a :lua require("harpoon.mark").add_file()<CR>
nnoremap ,f :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap ,d :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap ,s :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap ,q :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap ,j :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap ,k :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap ,l :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap ,m :lua require("harpoon.ui").nav_file(8)<CR>
"\\\\\\\\\\\\\\\\\\\\\\\\\________//////////////////////////

"//////////////////////////TagBar\\\\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>bt :TagbarToggle<CR>
nnoremap <leader>bo :TagbarOpen<CR>
nnoremap <leader>bc :TagbarClose<CR>
let g:tagbar_map_nexttag = '<C-j>'
let g:tagbar_map_prevtag = '<C-k>'
let g:tagbar_map_showproto = "m"
"\\\\\\\\\\\\\\\\\\\\\\\\\_______///////////////////////////

"//////////////////////////Other\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" Autopair
let g:AutoPairsCenterLine = 0
" Gitgutter
" :au VimEnter * :GitGutterSignsDisable
" Nerd tree icons
set conceallevel=3
" Prolog
au FileType perl set filetype=prolog
" highlight yanked region
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=125}
"\\\\\\\\\\\\\\\\\\\\\\\\\\_____////////////////////////////
