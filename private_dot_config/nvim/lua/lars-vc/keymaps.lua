--==Keymaps for none plugin stuff==--
-- leader key
vim.keymap.set('n', '<space>', '<nop>', { noremap = true })
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader><leader>', '<cmd>wa<cr>', { noremap = true })
-- moving in insert mode and cmdmode
vim.keymap.set({ 'i', 'c' }, '<A-h>', '<Left>', { noremap = true })
vim.keymap.set({ 'i', 'c' }, '<A-j>', '<Down>', { noremap = true })
vim.keymap.set({ 'i', 'c' }, '<A-k>', '<Up>', { noremap = true })
vim.keymap.set({ 'i', 'c' }, '<A-l>', '<Right>', { noremap = true })
-- moving around windows
vim.keymap.set('n', '<C-H>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-J>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-K>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-L>', '<C-w>l', { noremap = true })
-- creating and moving the splits
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { noremap = true })
vim.keymap.set('n', '<leader>ss', '<cmd>split<cr>', { noremap = true })
vim.keymap.set('n', '<leader>sx', '<C-w>x', { noremap = true })
-- searching centers the line
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })
-- closing stuff
vim.keymap.set('n', '<leader>xt', '<cmd>wa<cr><cmd>tabclose<cr>', { noremap = true })
vim.keymap.set('n', '<leader>xx', '<cmd>wa<cr><cmd>qa<cr>', { noremap = true })
vim.keymap.set('n', '<leader>xq', '<cmd>qa!<cr>', { noremap = true })
-- undo breakpoints
vim.keymap.set('i', '.', '.<C-g>u', { noremap = true })
vim.keymap.set('i', ',', ',<C-g>u', { noremap = true })
-- moving text
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>', { noremap = true })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>', { noremap = true })
vim.keymap.set('n', '<A-h>', '<<', { noremap = true })
vim.keymap.set('n', '<A-l>', '>>', { noremap = true })
vim.keymap.set('v', '<A-j>', '<cmd>m \'>+1<CR>gv', { noremap = true })
vim.keymap.set('v', '<A-k>', '<cmd>m \'<-2<CR>gv', { noremap = true })
vim.keymap.set('v', '<A-h>', '<cmd><<cr>gv', { noremap = true })
vim.keymap.set('v', '<A-l>', '<cmd>><cr>gv', { noremap = true })
-- creating files
vim.keymap.set('n', '<leader>ot', ':!touch <C-R>=getcwd()<CR>/', { noremap = true })
vim.keymap.set('n', '<leader>oe', ':edit <C-R>=getcwd()<CR>/', { noremap = true })
vim.keymap.set('n', '<leader>od', ':!mkdir -p <C-R>=getcwd()<CR>/', { noremap = true })
vim.keymap.set('n', '<leader>om', ':!mv <C-R>=getcwd()<CR>/ <C-R>=getcwd()<CR>/', { noremap = true })
vim.keymap.set('n', '<leader>or', ':!rm -r <C-R>=getcwd()<CR>/', { noremap = true })
-- easy spell correct
vim.keymap.set('i', '<C-z>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { noremap = true })
vim.keymap.set('n', '<BS>', '<C-^>', { noremap = true })
-- pasting
vim.keymap.set('v', 'gd', '"_d', { noremap = true })
vim.keymap.set('v', 'gp', '"_dP', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { noremap = true })
