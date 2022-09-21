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
    vim.keymap.set('n', '<leader>cj', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>ck', vim.diagnostic.goto_prev, bufopts)

    vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- Rename symbol under cursor
    vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }
local lspconf = require("lspconfig")

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

-- custom stuff
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
