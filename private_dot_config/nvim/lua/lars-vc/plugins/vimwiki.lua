-- Dont convert every markdown file to a vimwiki format
vim.g["vimwiki_global_ext"] = 0
-- Turn on spelling only for that buffer
vim.cmd [[autocmd FileType vimwiki setlocal spell]]
vim.cmd [[autocmd FileType vimwiki nmap <C-b> ysiw*]]
-- vim.cmd [[autocmd FileType vimwiki nmap <C-S-b> dsiw*]]
vim.cmd [[autocmd FileType vimwiki nmap <C-i> ysiw_]]
-- vim.cmd [[autocmd FileType vimwiki nmap <C-S-i> dsiw_]]
