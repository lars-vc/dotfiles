-- prolog is a bitch
vim.cmd [[au FileType perl set filetype=prolog]]
-- highlight yanked region
vim.cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=125}]]
-- hexokinase highlighters
vim.cmd [[ let g:Hexokinase_highlighters = ['virtual'] ]]
-- auto format on save
vim.cmd [[autocmd BufWritePre * silent! lua vim.lsp.buf.format()]]
-- disable some useless builtin plugins
local disabled_built_ins = {
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'logipat',
    'rrhelper',
    'fzf',
    'tutor',
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g['loaded_' .. plugin] = 1
end
