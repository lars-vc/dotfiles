-- autostart smtg
local g = vim.g
g.coq_settings = { auto_start = "shut-up" }

vim.api.nvim_set_keymap("i", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {
    expr = true
})

vim.api.nvim_set_keymap("i", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {
    expr = true
})
require("coq")
