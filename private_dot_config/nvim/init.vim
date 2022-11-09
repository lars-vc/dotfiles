" lars-vc's config file
"    ___  __  ________  ________   ___    ___    _   ________
"  ╱╱   ╲╱  ╲╱    __  ╲╱   ___  ╲ ╱   ╲  ╱   ╲  ╱_╱ ╱        ╲
" ╱╱        ╱    __╱  ╱      ╱  ╱ ╲    ╲╱    ╱___  ╱         ╱
"╱         ╱     ____╱   ___╱  ╱   ╲        ╱╱   ╱╱   ╱  ╱  ╱
"╲__╱╲____╱╲________╱╲________╱     ╲______╱╱___╱ ╲__╱__╱__╱

"===========================================================
"---------------------------Basic---------------------------
"===========================================================
" syntax on               " enables syntax highlighting
" set termguicolors       " better colors
" set tabstop=4           " number of spaces in a <Tab>
" set shiftwidth=4        "
" set softtabstop=4       "
" set expandtab           "
" set smartindent         " enable autoindents
" set number              " adds line numbers
" set relativenumber      " relative numbers in sidebar
" set numberwidth=4       " columns used for the line number
" set incsearch           " highlighting matched strings while searching
" set nohlsearch          " no remaining highlights on search
" set noea                " splitting windows
" set hidden              " navigate buffers without losing unsaved work
" set scrolloff=8         " start scrolling when 8 lines from top or bottom
" set undofile            " save undo history
" set mouse=a             " enable mouse support
" set ignorecase          " case insensitive search unless capital letters are used
" set smartcase           "
" set nrformats+=alpha    " increment letters
" set timeoutlen=555      " for whichkey to show up quicker
" set spelllang=en,nl     " spelling for certain files
" set fcs=eob:\           " hide tildes ~ at end of file
" set textwidth=0         " no autowrapping at end of line
" set cursorline          " line highlighting the current line
" set updatetime=100      " updatetime for statusbar
" set noshowmode          " dont show default statusbar
" set conceallevel=3      " conceallevel for markdown
" " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum" " color fix for tmux
" " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum" " color fix for tmux
" autocmd FileType * setlocal formatoptions-=o " disable autoinserting of comment when pressing o on a commented line (needs to be autocmd for some reason)
" set signcolumn=yes
"===========================================================
"--------------------------Keymaps--------------------------
"===========================================================
" " inoremap jk <Esc>
" nnoremap <SPACE> <Nop>
" let mapleader = " "
" nnoremap <leader><leader> :wa<CR>
" " moving in insert mode
" inoremap <A-h> <Left>
" inoremap <A-j> <Down>
" inoremap <A-k> <Up>
" inoremap <A-l> <Right>
" " moving around windows
" " nnoremap <A-H> <C-w>h
" " nnoremap <A-J> <C-w>j
" " nnoremap <A-K> <C-w>k
" " nnoremap <A-L> <C-w>l
" nnoremap <C-H> <C-w>h
" nnoremap <C-J> <C-w>j
" nnoremap <C-K> <C-w>k
" nnoremap <C-L> <C-w>l
" " creating and moving the splits
" nnoremap <leader>sv :vsplit<CR>
" nnoremap <leader>ss :split<CR>
" nnoremap <leader>sx <C-w>x
" " searching centers the line
" nnoremap n nzzzv
" nnoremap N Nzzzv
" " closing stuff
" nnoremap <leader>xt :wa<cr>:tabclose<cr>
" nnoremap <leader>xx :wa<cr>:qa<cr>
" nnoremap <leader>xq :qa!<cr>
" " cheatsheet (outdated)
" :command Cheat tabedit ~/.config/nvim/cheatsheet.vim
" " undo breakpoints
" inoremap . .<C-g>u
" inoremap , ,<C-g>u
" " moving text
" nnoremap <A-k> :m .-2<CR>
" nnoremap <A-j> :m .+1<CR>
" vnoremap <A-j> :m '>+1<CR>gv
" vnoremap <A-k> :m '<-2<CR>gv
" nnoremap <A-l> >>
" nnoremap <A-h> <<
" vnoremap <A-h> :<<CR>gv
" vnoremap <A-l> :><CR>gv
" " moving around in command mode
" cnoremap <A-h> <Left>
" cnoremap <A-j> <Down>
" cnoremap <A-k> <Up>
" cnoremap <A-l> <Right>
" " creating files
" nnoremap <leader>ot :!touch <C-R>=getcwd()<CR>/
" nnoremap <leader>oe :edit <C-R>=getcwd()<CR>/
" nnoremap <leader>od :!mkdir -p <C-R>=getcwd()<CR>/
" nnoremap <leader>om :!mv <C-R>=getcwd()<CR>/ <C-R>=getcwd()<CR>/
" nnoremap <leader>or :!rm -r <C-R>=getcwd()<CR>/
" " easy spell correct
" inoremap <C-z> <C-g>u<Esc>[s1z=`]a<C-g>u
" nnoremap <BS> <C-^>
" " nnoremap <leader>p "_dP
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>d "_d
"===========================================================
"--------------------------Plugins--------------------------
"===========================================================
" making sure vim-plug is installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall!
endif
" Vim-plug
call plug#begin('~/.config/nvim/plugged')
" --Optimisation--
Plug 'lewis6991/impatient.nvim'
" --Theme--
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" --Telescope--
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
" --Statusline--
Plug 'nvim-lualine/lualine.nvim'
" --Vim-Fugitive--
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" --LSP--
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'petertriho/cmp-git'
Plug 'onsails/lspkind-nvim'
Plug 'saadparwaiz1/cmp_luasnip'
" --Better scrolling--
Plug 'psliwka/vim-smoothie'
" --Auto pairs--
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'tpope/vim-surround'
" --Treeshitter--
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
" --Commenting (gcc)--
Plug 'numToStr/Comment.nvim'
" --Wakatime--
Plug 'wakatime/vim-wakatime'
" --Debugger--
" Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
" --Lightspeed--
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'
" --Neoclip--
Plug 'AckslD/nvim-neoclip.lua'
" Plug 'tami5/sqlite.lua'
" --WhichKey--
Plug 'folke/which-key.nvim'
" --Aligning text--
Plug 'godlygeek/tabular'
" --Markdown--
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'dhruvasagar/vim-table-mode'
" --Harpoon--
Plug 'ThePrimeagen/harpoon'
" --Snippets--
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
" --IndentGuides--
Plug 'lukas-reineke/indent-blankline.nvim'
" --Ranger--
Plug 'kevinhwang91/rnvimr'
" --colorize hexcodes--
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" --Personal wiki--
Plug 'vimwiki/vimwiki'
" --Notifications--
Plug 'rcarriga/nvim-notify'
" --Colorpicker--
Plug 'ziontee113/color-picker.nvim'
" --GrammerChecker (using languageTool)--
Plug 'rhysd/vim-grammarous'
" --Diagnostics list--
Plug 'folke/trouble.nvim'
" --Better todo comments--
Plug 'folke/todo-comments.nvim'
" --Latex notetaking--
Plug 'jbyuki/nabla.nvim'
" --Navic--
" Plug 'SmiteshP/nvim-navic'
" --Neotest--
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-python'
Plug 'nvim-neotest/neotest-go'
Plug 'haydenmeade/neotest-jest'
Plug 'rouge8/neotest-rust'
" --Hovering--
Plug 'lewis6991/hover.nvim'
" --Better codeaction--
Plug 'weilbith/nvim-code-action-menu'
call plug#end()

" load lua files
lua require('lars-vc')
"===========================================================
"--------------------------Colors---------------------------
"===========================================================
colorscheme catppuccin
" colorscheme material
" highlight CursorLine guibg=#2e3d45 " set color of cursorline
" highlight Cursor guifg=black guibg=white " set color of cursor

" Telescope styling
highlight TelescopePromptTitle guifg=#1b1f27 guibg=#e06c75
highlight TelescopePromptPrefix guifg=#e06c75
highlight TelescopePromptNormal guibg=#252931
highlight TelescopePromptBorder guifg=#252931 guibg=#252931

highlight TelescopeResultsNormal guibg=#1b1f27
highlight TelescopeResultsBorder guifg=#1b1f27 guibg=#1b1f27

highlight TelescopePreviewTitle guifg=#1b1f27 guibg=#98c379
highlight TelescopePreviewNormal guibg=#252931
highlight TelescopePreviewBorder guifg=#252931 guibg=#252931

highlight TelescopeSelection guifg=#B0BEC5 guibg=#252931

" Coc styling
" highlight CocFloating guibg=#1f292e
" highlight CocErrFloat guibg=#1f292e
" highlight CocFloating guibg=#252931
" highlight CocErrFloat guibg=#252931

" WhichKey styling
" highlight WhichKeyFloat guibg=#252931
" highlight WhichKey guifg=#009688 gui=bold
" highlight WhichKeyGroup guifg=#717CB4
" highlight WhichKeyDesc guifg=#B0BEC5 gui=italic
" highlight WhichKeySeparator guifg=#F07178
" highlight WhichkeyBorder guibg=#252931
" highlight FloatBorder guibg=#252931

" Treesitter context styling
" highlight TreesitterContext guibg=#252931
" highlight TreesitterContextLineNumber guifg=#B0BEC5 guibg=#252931
"NORMAL: guifg=#B0BEC5 guibg=#263238
"===========================================================
"-----------------------Plugin Setups-----------------------
"===========================================================
"///////////////////////////COC\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" autocmd CursorHold * silent call CocActionAsync('highlight')
" " use tab to autocomplete and jump to snippets
" inoremap <silent><expr> <TAB>
"     \ coc#pum#visible() ? coc#_select_confirm() :
"     \ coc#expandableOrJumpable() ?
"     \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
"
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " use c-l and c-h to move to snippet placeholders
" imap <C-h> <nop>
" imap <C-l> <nop>
" let g:coc_snippet_prev = '<C-h>'
" let g:coc_snippet_next = '<C-l>'
"
" " Symbol renaming.
" nmap <leader>cn <Plug>(coc-rename)
" " Autoformatting with coc
" let g:python3_host_prog="/usr/bin/python3"
" au BufWrite * :silent! call CocAction('format')
" noremap <C-A-l> :silent! call CocAction('format')<CR>
" " GoTo code navigation.
" nmap <silent> <leader>cd <Plug>(coc-definition)
" nmap <silent> <leader>cy <Plug>(coc-type-definition)
" nmap <silent> <leader>ci <Plug>(coc-implementation)
" nmap <silent> <leader>cr <Plug>(coc-references)
" nnoremap <silent> <leader>ct :call <SID>show_documentation()<CR>
" " show documentation on hover and SPC ct
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <C-space> coc#refresh()
" " inoremap <silent><expr> <C-space> pumvisible() ? <Plug>(coc-float-hide) : coc#refresh()
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>ca  <Plug>(coc-codeaction-selected)
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ca  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>cf  <Plug>(coc-fix-current)
" " Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)
" " Extensions
" let g:coc_global_extensions = ["coc-clangd", "coc-html", "coc-java", "coc-json", "coc-kotlin", "coc-pyright", "coc-rls", "coc-tsserver", "coc-dictionary", "coc-snippets", "coc-marketplace", "coc-prettier"]
" " Disabling sources per filetype (just use lsp based completions)
" au FileType python     let b:coc_disabled_sources=["around", "buffer"]
" au FileType c          let b:coc_disabled_sources=["around", "buffer"]
" au FileType cpp        let b:coc_disabled_sources=["around", "buffer"]
" au FileType javascript let b:coc_disabled_sources=["around", "buffer"]
" au FileType typescript let b:coc_disabled_sources=["around", "buffer"]
" au FileType rust       let b:coc_disabled_sources=["around", "buffer"]
"\\\\\\\\\\\\\\\\\\\\\\\\\\\___/////////////////////////////

"/////////////////////////Telescope\\\\\\\\\\\\\\\\\\\\\\\\\
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fn <cmd>Telescope neoclip plus<cr><Esc>
" nnoremap <leader>fi <cmd>Telescope find_files cwd=~/.config/nvim prompt_title=VimRC<cr>
" nnoremap <leader>fp <cmd>Telescope planets<cr>
" nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
" " help related
" nnoremap <leader>fhh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fhc <cmd>Telescope command_history<cr>
" nnoremap <leader>fhs <cmd>Telescope search_history<cr>
" nnoremap <leader>fhm <cmd>Telescope man_pages<cr>
" nnoremap <leader>fhk <cmd>Telescope keymaps<cr>
" nnoremap <leader>fho <cmd>Telescope vim_options<cr>
" nnoremap <leader>fhr <cmd>Telescope reloader<cr>
" nnoremap <leader>fhb <cmd>Telescope builtin<cr>
" " git related stuff
" nnoremap <leader>gfc <cmd>Telescope git_commits<cr><esc>
" nnoremap <leader>gfb <cmd>Telescope git_bcommits<cr><esc>
" nnoremap <leader>gb <cmd>Telescope git_branches<cr>
"\\\\\\\\\\\\\\\\\\\\\\\\\_________/////////////////////////

"////////////////////////Vimspector\\\\\\\\\\\\\\\\\\\\\\\\\
" let g:vimspector_code_minwidth = 90
" let g:vimspector_terminal_maxwidth = 75
" let g:vimspector_terminal_minwidth = 20
" " Debug launch window setup (hacky but works)
" nmap <leader>dd :call vimspector#Launch()<CR>2<C-w>j:q<CR>
" nmap <leader>dD :call vimspector#Launch()<CR>
" nmap <leader>dx :call vimspector#Reset()<CR>
" nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
" nnoremap <S-k> :call vimspector#StepOut()<CR>
" nnoremap <S-l> :call vimspector#StepInto()<CR>
" nnoremap <S-j> :call vimspector#StepOver()<CR>
" nnoremap <leader>dr :call vimspector#Restart()<CR>
" nnoremap <leader>dn :call vimspector#Continue()<CR>
" nnoremap <leader>dc :call vimspector#RunToCursor()<CR>
" nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
" nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
" nmap <leader>db <Plug>VimspectorBreakpoints
" nmap <leader>dg <Plug>VimspectorGoToCurrentLine
" let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-node-debug2']
" " for normal mode - the word under the cursor
" nmap <leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <leader>di <Plug>VimspectorBalloonEval
"\\\\\\\\\\\\\\\\\\\\\\\\__________/////////////////////////

"///////////////////////Vim-fugitive\\\\\\\\\\\\\\\\\\\\\\\\
" nnoremap <leader>gg :Git 
" nnoremap <leader>gs :Git<CR>
" nnoremap <leader>gp :Git push<CR>
" nnoremap <leader>go :Git pull<CR>
" nnoremap <leader>gP :Git push --set-upstream origin HEAD<CR>
" nnoremap <leader>gc :Git commit -a -m ""<Left>
" nnoremap <leader>ga :!git config --global --add safe.directory <C-R>=getcwd()<CR><CR>
" autocmd User FugitiveIndex nmap <buffer> <A-j> )
" autocmd User FugitiveIndex nmap <buffer> <A-k> (
" autocmd User FugitiveIndex nmap <buffer> <Tab> =
" " for merge conflicts (pick left or right), to start comparing go into status and press dv on a file
" nnoremap <leader>gh :diffget //2<CR>
" nnoremap <leader>gl :diffget //3<CR>
"\\\\\\\\\\\\\\\\\\\\\\\____________////////////////////////

"/////////////////////////Markdown\\\\\\\\\\\\\\\\\\\\\\\\\\
" " need to be in the markdown buffer for these to work
" nnoremap <leader>mpo :MarkdownPreview<CR>
" nnoremap <leader>mpc :MarkdownPreviewStop<CR>
" nnoremap <leader>mpp :MarkdownPreviewToggle<CR>
" nnoremap <leader>mh  :HeaderDecrease<CR>
" nnoremap <leader>ml  :HeaderIncrease<CR>
" xnoremap <leader>mh  :HeaderDecrease<CR>
" xnoremap <leader>ml  :HeaderIncrease<CR>
" nnoremap <leader>mt  :TableFormat<CR>
" nnoremap <leader>mii :InsertToc<CR>
" nnoremap <leader>min :InsertNToc<CR>
" nnoremap <leader>mic :InsertToc
" " Table mode
" let g:table_mode_map_prefix = '<Leader>ma'
" " Tabular
" xnoremap <leader>t :Tabular /
" let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_edit_url_in = 'tab'
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_follow_anchor = 1
" let g:vim_markdown_strikethrough = 1
" " Turn on spelling only for that buffer
" autocmd FileType markdown setlocal spell
" autocmd FileType markdown setlocal dictionary+=/usr/share/dict/words
" autocmd FileType markdown setlocal dictionary+=/usr/share/dict/dutch
"\\\\\\\\\\\\\\\\\\\\\\\\\________//////////////////////////

"//////////////////////////Harpoon\\\\\\\\\\\\\\\\\\\\\\\\\\
" nnoremap , m
" nnoremap m <NOP>
" nnoremap mm :lua require("harpoon.ui").toggle_quick_menu()<CR>
" nnoremap mq :lua require("harpoon.mark").add_file()<CR>
" nnoremap mf :lua require("harpoon.ui").nav_file(1)<CR>
" nnoremap md :lua require("harpoon.ui").nav_file(2)<CR>
" nnoremap ms :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap ma :lua require("harpoon.ui").nav_file(4)<CR>
" nnoremap mj :lua require("harpoon.ui").nav_file(5)<CR>
" nnoremap mk :lua require("harpoon.ui").nav_file(6)<CR>
" nnoremap ml :lua require("harpoon.ui").nav_file(7)<CR>
"\\\\\\\\\\\\\\\\\\\\\\\\\________//////////////////////////

"//////////////////////////VimWiki\\\\\\\\\\\\\\\\\\\\\\\\\\\
" " Dont convert every markdown file to a vimwiki format
" let g:vimwiki_global_ext = 0
" " Turn on spelling only for that buffer
" autocmd FileType vimwiki setlocal spell
"\\\\\\\\\\\\\\\\\\\\\\\\\\_______///////////////////////////
"
"//////////////////////////Grammar\\\\\\\\\\\\\\\\\\\\\\\\\\\
" nnoremap <leader>zg :GrammarousCheck<CR>
" nnoremap <leader>zr :GrammarousReset<CR>
" " take first spellingfix
" nnoremap <leader>zz 1z=
"\\\\\\\\\\\\\\\\\\\\\\\\\\_______///////////////////////////

"///////////////////////////Ranger\\\\\\\\\\\\\\\\\\\\\\\\\\\
" let g:rnvimr_enable_picker = 1 " Make Ranger to be hidden after picking a file
" let g:rnvimr_urc_path = '~/.config/ranger'
" nnoremap <leader>rr :RnvimrToggle<CR>
" nnoremap <silent> <M-r> :RnvimrToggle<CR>
" tnoremap <silent> <M-r> <C-\><C-n>:RnvimrToggle<CR>
"\\\\\\\\\\\\\\\\\\\\\\\\\\\______///////////////////////////

"//////////////////////////Other\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" " Gitgutter
" " :au VimEnter * :GitGutterSignsDisable
" " Nerd tree icons
" " set conceallevel=3
" " Prolog
" au FileType perl set filetype=prolog
" " highlight yanked region
" autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=125}
" let g:Hexokinase_highlighters = ['virtual']
" " auto format on save
" autocmd BufWritePre * lua vim.lsp.buf.format()
"\\\\\\\\\\\\\\\\\\\\\\\\\\_____////////////////////////////
