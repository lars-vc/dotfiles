local opt = vim.opt
opt.termguicolors = true -- better colors
opt.tabstop = 4 -- number of spaces in a <Tab>
opt.shiftwidth = 4 --
opt.softtabstop = 4 --
opt.expandtab = true --
opt.smartindent = true -- enable autoindents
opt.number = true -- adds line numbers
opt.relativenumber = true -- relative numbers in sidebar
opt.numberwidth = 4 -- columns used for the line number
opt.incsearch = true -- highlighting matched strings while searching
vim.cmd [[set noea]]
vim.cmd [[set noshowmode]]
opt.hlsearch = false -- no remaining highlights on search
-- opt.noea = true -- splitting windows
opt.hidden = true -- navigate buffers without losing unsaved work
opt.scrolloff = 8 -- start scrolling when 8 lines from top or bottom
opt.undofile = true -- save undo history
opt.mouse = 'a' -- enable mouse support
opt.ignorecase = true -- case insensitive search unless capital letters are used
opt.smartcase = true --
opt.nrformats:append { 'alpha' } -- increment letters
opt.timeoutlen = 555 -- for whichkey to show up quicker
opt.spelllang = { 'en', 'nl' } -- spelling for certain files
opt.fcs = 'eob:\\' -- hide tildes ~ at end of file
opt.textwidth = 0 -- no autowrapping at end of line
opt.cursorline = true -- line highlighting the current line
opt.updatetime = 100 -- updatetime for statusbar
-- opt.noshowmode = true -- dont show default statusbar
opt.conceallevel = 3 -- conceallevel for markdown
vim.cmd [[autocmd FileType * setlocal formatoptions-=o]] -- disable autoinserting of comment when pressing o on a commented line (needs to be autocmd for some reason)
opt.signcolumn = 'yes'