-- config
local g = vim.g
-- need to be in the markdown buffer for these to work
vim.keymap.set('n', '<leader>mpo', '<cmd>MarkdownPreview<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mpc', '<cmd>MarkdownPreviewStop<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mpp', '<cmd>MarkdownPreviewToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mh', '<cmd>HeaderDecrease<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ml', '<cmd>HeaderIncrease<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ml', '<cmd>HeaderIncrease<CR>', { noremap = true })
vim.keymap.set('x', '<leader>ml', '<cmd>HeaderIncrease<CR>', { noremap = true })
vim.keymap.set('x', '<leader>ml', '<cmd>HeaderIncrease<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mt', '<cmd>TableFormat<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mii', '<cmd>InsertToc<CR>', { noremap = true })
vim.keymap.set('n', '<leader>min', '<cmd>InsertNToc<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mic', ':InsertNToc ', { noremap = true })
-- Table mode
g['table_mode_map_prefix'] = '<Leader>ma'
-- Tabular
vim.keymap.set('x', '<leader>t', ':Tabular / ', { noremap = true })

g['vim_markdown_conceal_code_blocks'] = 0
g['vim_markdown_new_list_item_indent'] = 0
g['vim_markdown_edit_url_in'] = 'tab'
g['vim_markdown_folding_style_pythonic'] = 1
g['vim_markdown_follow_anchor'] = 1
g['vim_markdown_strikethrough'] = 1
-- Turn on spelling only for that buffer
vim.cmd [[autocmd FileType markdown setlocal spell ]]
vim.cmd [[autocmd FileType markdown setlocal dictionary+=/usr/share/dict/words ]]
vim.cmd [[autocmd FileType markdown setlocal dictionary+=/usr/share/dict/dutch ]]
