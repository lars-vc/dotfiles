vim.g["rnvimr_enable_picker"] = 1 -- Make Ranger to be hidden after picking a file
vim.g["rnvimr_urc_path"] = '~/.config/ranger'
vim.keymap.set('n', '<leader>rr', '<cmd>RnvimrToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-r>', '<cmd>RnvimrToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<M-r>', '<C-\\><C-n><cmd>RnvimrToggle<CR>', { noremap = true, silent = true })
