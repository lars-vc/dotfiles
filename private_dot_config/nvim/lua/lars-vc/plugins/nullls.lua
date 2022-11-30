local null_ls = require("null-ls")
local format = null_ls.builtins.formatting
local diagno = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        -- Formatting --
        format.prettier.with({ extra_args = { "--no-semi", "--tab-width", "4" } }),
        format.stylua,
        format.black,
        format.latexindent,
        format.beautysh,
        -- format.markdownlint,

        -- Diagnostics --
        diagno.eslint,
        diagno.flake8,
        -- diagno.luacheck,

        -- Completion --
        -- null_ls.builtins.completion.spell,
    },
})
