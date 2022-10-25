local navic = require("nvim-navic")

local function on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Jump to declaration
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- Jump to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Show hover info
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- Show diagnostics for current line
    vim.keymap.set('n', 'go', vim.diagnostic.open_float, bufopts)
    -- Jump between diagnostic messages
    vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, bufopts)

    vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts)
    -- Rename symbol under cursor
    vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
    -- Navic
    navic.attach(client, bufnr)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconf = require("lspconfig")
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }

lspconf['pyright'].setup { on_attach = on_attach, capabilities = capabilities }

lspconf['tsserver'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconf['rust_analyzer'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconf['sumneko_lua'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- comes with clang I think (sudo _ install clang)
lspconf['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}


-- custom stuff
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
