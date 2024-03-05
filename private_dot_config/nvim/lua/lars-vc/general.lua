---OPTIONS---
local opt = vim.opt
opt.termguicolors = true -- better colors
opt.tabstop = 4 -- number of spaces in a <Tab> (CHANGE THIS VARIABLE TO CHANGE TAB/SPACES WIDTH)
opt.shiftwidth = 0 -- will use tabstop if 0
opt.softtabstop = -1 -- will use shiftwidth if negative
opt.expandtab = true -- use spaces instead of tabs
opt.smarttab = true --
opt.smartindent = true -- enable autoindents
opt.number = true -- adds line numbers
opt.relativenumber = true -- relative numbers in sidebar
opt.numberwidth = 4 -- columns used for the line number
opt.incsearch = true -- highlighting matched strings while searching
opt.hlsearch = false -- no remaining highlights on search
opt.ea = false -- splitting windows
opt.hidden = true -- navigate buffers without losing unsaved work
opt.scrolloff = 8 -- start scrolling when 8 lines from top or bottom
opt.undofile = true -- save undo history
opt.mouse = "a" -- enable mouse support
opt.ignorecase = true -- case insensitive search unless capital letters are used
opt.smartcase = true --
opt.nrformats:append({ "alpha" }) -- increment letters
opt.timeoutlen = 555 -- for whichkey to show up quicker
opt.spelllang = { "en", "nl" } -- spelling for certain files
opt.fcs = "eob:\\" -- hide tildes ~ at end of file
opt.textwidth = 0 -- no autowrapping at end of line
opt.cursorline = true -- line highlighting the current line
opt.updatetime = 100 -- updatetime for statusbar
opt.showmode = false -- dont show default statusbar
opt.conceallevel = 3 -- conceallevel for markdown
-- disable autoinserting of comment when pressing o on a commented line (needs to be autocmd for some reason)
--vim.cmd [[autocmd FileType * setlocal formatoptions-=o]]
vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal formatoptions-=cro ",
    pattern = { "*" },
})
opt.signcolumn = "yes" -- extra column showing sign for e.g. LSP related stuff
opt.breakindent = true -- wordwrap respects indent
opt.foldcolumn = "0" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99 -- no folds closed at start
opt.foldenable = true
