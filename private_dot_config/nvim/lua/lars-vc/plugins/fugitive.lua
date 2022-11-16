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
