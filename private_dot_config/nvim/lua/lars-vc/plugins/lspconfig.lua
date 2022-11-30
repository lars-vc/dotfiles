-- local navic = require("nvim-navic")

local function on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Jump to declaration
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- Jump to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Show hover info (replaced with hover.nvim)
    -- vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- Show diagnostics for current line
    vim.keymap.set('n', 'go', vim.diagnostic.open_float, bufopts)
    -- Jump between diagnostic messages
    vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, bufopts)

    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts) -- gr uses trouble
    -- Rename symbol under cursor
    vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
    -- Apply the first code action
    vim.keymap.set('n', 'ga', function()
        vim.lsp.buf.code_action({ apply = true, context = { only = { 'quickfix', 'refactor' } } })
    end, bufopts)
    -- list all code actions for line
    vim.keymap.set('n', 'gA', '<cmd>CodeActionMenu<cr>', bufopts)
    -- list all code actions for document (cant use end key)
    -- vim.keymap.set('n', '<leader>la', function()
    --     vim.lsp.buf.code_action({ range = {start = {0,0}, d = {-1,-1}}})
    -- end, bufopts)
    -- Navic
    -- if client.server_capabilities.documentSymbolProvider then
    --     navic.attach(client, bufnr)
    -- end
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconf = require("lspconfig")

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
--     on_attach = on_attach
-- }

lspconf['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

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
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- comes with clang I think (sudo _ install clang)
lspconf['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconf['texlab'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}


-- custom stuff
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
