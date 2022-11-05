-- prolog is a bitch
vim.cmd [[au FileType perl set filetype=prolog]]
-- highlight yanked region
vim.cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=125}]]
-- hexokinase highlighters
vim.cmd [[ let g:Hexokinase_highlighters = ['virtual'] ]]
-- auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
