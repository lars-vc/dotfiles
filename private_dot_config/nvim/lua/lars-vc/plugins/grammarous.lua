-- Grammarous --
vim.keymap.set('n', '<leader>zg', '<cmd>GrammarousCheck<CR>', { noremap = true })
vim.keymap.set('n', '<leader>zr', '<cmd>GrammarousReset<CR>', { noremap = true })
-- take first spellingfix
vim.keymap.set('n', '<leader>zz', '1z=', { noremap = true })
