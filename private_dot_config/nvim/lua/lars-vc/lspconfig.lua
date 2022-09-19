local function on_attach(client, bufnr)
    local opts = {
        silent = true,
        noremap = true,
    }
    local function buf_nmap(mapping, cmd) vim.api.nvim_buf_set_keymap(bufnr, "n", mapping, cmd, opts) end

    -- Jump to definition
    buf_nmap("gd", "<Cmd>vim.lsp.buf.definition<CR>")
    -- Show hover info
    buf_nmap("gh", "<Cmd>vim.lsp.buf.hover<CR>")
    -- Format current buffer on write
    -- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
    -- Show diagnostics for current line
    buf_nmap("<leader>cc", "<Cmd>vim.diagnostic.open_float<CR>")
    -- Jump between diagnostic messages
    buf_nmap("<leader>cj", "<Cmd>vim.diagnostic.goto_next<CR>")
    buf_nmap("<leader>ck", "<Cmd>vim.diagnostic.goto_prev<CR>")
    
    buf_nmap("<leader>ct", "<Cmd>vim.diagnostic.type_definition<CR>")
    buf_nmap("<leader>ci", "<Cmd>vim.diagnostic.implementation<CR>")
    buf_nmap("<leader>cr", "<Cmd>vim.diagnostic.references<CR>")
    -- Rename symbol under cursor
    buf_nmap("<leader>cn", "<Cmd>vim.lsp.buf.rename<CR>")
    buf_nmap("<leader>ca", "<Cmd>vim.lsp.buf.code_actions<CR>")
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }
require('lspconfig').pyright.setup{ on_attach = on_attach, capabilities = capabilities }
