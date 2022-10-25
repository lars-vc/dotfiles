local nabla = require("nabla")
vim.keymap.set('n', '<leader>nn', nabla.popup, { noremap = true })
vim.keymap.set('n', '<leader>no', nabla.enable_virt, { noremap = true })
vim.keymap.set('n', '<leader>nc', nabla.disable_virt, { noremap = true })
