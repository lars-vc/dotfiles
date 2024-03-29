-- local navic = require("nvim-navic")

local function on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- Jump to declaration
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- Jump to definition (replaced by trouble)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- Show hover info (replaced with hover.nvim)
	-- vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts) -- gr uses trouble
	-- Rename symbol under cursor
	vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, bufopts)
	-- Apply the first code action
	vim.keymap.set({ "n", "v" }, "ga", function()
		vim.lsp.buf.code_action({ apply = true, context = { only = { "quickfix", "refactor" } } })
	end, bufopts)
	-- list all code actions for document (cant use end key)
	-- vim.keymap.set('n', '<leader>la', function()
	--     vim.lsp.buf.code_action({ range = {start = {0,0}, d = {-1,-1}}})
	-- end, bufopts)
	-- Navic
	-- if client.server_capabilities.documentSymbolProvider then
	--     navic.attach(client, bufnr)
	-- end
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- add this for ufo
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
-- make ufo use the lsp if attached
-- require("ufo").setup()

local lspconf = require("lspconfig")

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
--     on_attach = on_attach
-- }

lspconf["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconf["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconf["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconf["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
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
})

-- comes with clang I think (sudo _ install clang)
lspconf["clangd"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16", -- otherwise it gives a warning
	},
})

lspconf["texlab"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconf["ltex"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconf["julials"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- custom stuff
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
