vim.keymap.set('n', '<leader>gg', ':Git ', { noremap = true })
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gP', '<cmd>Git push --set-upstream origin HEAD<CR>', { noremap = true })
vim.keymap.set('n', '<leader>go', '<cmd>Git pull<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gc', ':Git commit -a -m ""<Left>', { noremap = true })
vim.keymap.set('n', '<leader>ga', '<cmd>!git config --global --add safe.directory <C-R>=getcwd()<CR><CR>',
    { noremap = true })
-- for merge conflicts (pick left or right), to start comparing go into status and press dv on a file
vim.keymap.set('n', '<leader>gh', '<cmd>diffget //2<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gl', '<cmd>diffget //3<CR>', { noremap = true })
-- autocmd User FugitiveIndex nmap <buffer> <A-j> )
-- autocmd User FugitiveIndex nmap <buffer> <A-k> (
-- autocmd User FugitiveIndex nmap <buffer> <Tab> =
-- temp fix for autocmds
vim.cmd [[autocmd User FugitiveIndex nmap <buffer> <Tab> =]]
vim.cmd [[autocmd User FugitiveIndex nmap <buffer> <A-k> (]]
vim.cmd [[autocmd User FugitiveIndex nmap <buffer> <A-j> )]]

-- local api = vim.api
-- api.nvim_create_autocmd("FugitiveIndex", {
--     callback = vim.keymap.set('n', '<A-j>', ')', { noremap = true, buffer = 0 }),
--     group = 'User'
-- })
-- local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
-- api.nvim_create_autocmd("TextYankPost", {
--     command = "silent! lua vim.highlight.on_yank()",
--     group = yankGrp,
-- })
