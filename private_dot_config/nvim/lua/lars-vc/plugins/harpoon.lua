-- keymaps --
local harpui = require('harpoon.ui')
local harpmark = require('harpoon.mark')
vim.keymap.set('n', ',', 'm', { noremap = true })
vim.keymap.set('n', 'm', '<NOP>', { noremap = true })
vim.keymap.set('n', 'mm', harpui.toggle_quick_menu, { noremap = true })
vim.keymap.set('n', 'mq', harpmark.add_file, { noremap = true })
-- naving
vim.keymap.set('n', 'mf', function()
    harpui.nav_file(1)
end, { noremap = true })
vim.keymap.set('n', 'md', function()
    harpui.nav_file(2)
end, { noremap = true })
vim.keymap.set('n', 'ms', function()
    harpui.nav_file(3)
end, { noremap = true })
vim.keymap.set('n', 'ma', function()
    harpui.nav_file(4)
end, { noremap = true })
vim.keymap.set('n', 'mj', function()
    harpui.nav_file(5)
end, { noremap = true })
vim.keymap.set('n', 'mk', function()
    harpui.nav_file(6)
end, { noremap = true })
vim.keymap.set('n', 'ml', function()
    harpui.nav_file(7)
end, { noremap = true })