require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")

vim.keymap.set({"i","s"}, "<c-l>", function()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end)

vim.keymap.set({"i","s"}, "<c-h>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)
