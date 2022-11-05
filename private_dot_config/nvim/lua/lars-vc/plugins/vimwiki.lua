-- Dont convert every markdown file to a vimwiki format
vim.g["vimwiki_global_ext"] = 0
-- Turn on spelling only for that buffer
vim.cmd [[autocmd FileType vimwiki setlocal spell]]
