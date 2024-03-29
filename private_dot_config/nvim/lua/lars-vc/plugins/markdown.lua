-- config
local g = vim.g
-- need to be in the markdown buffer for these to work
vim.keymap.set("n", "<leader>mpo", "<cmd>MarkdownPreview<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mpc", "<cmd>MarkdownPreviewStop<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mpp", "<cmd>MarkdownPreviewToggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mh", "<cmd>HeaderDecrease<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ml", "<cmd>HeaderIncrease<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ml", "<cmd>HeaderIncrease<CR>", { noremap = true })
vim.keymap.set("x", "<leader>ml", "<cmd>HeaderIncrease<CR>", { noremap = true })
vim.keymap.set("x", "<leader>ml", "<cmd>HeaderIncrease<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mt", "<cmd>TableFormat<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mii", "<cmd>InsertToc<CR>", { noremap = true })
vim.keymap.set("n", "<leader>min", "<cmd>InsertNToc<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mic", ":InsertNToc ", { noremap = true })
vim.keymap.set("n", "<leader>mdd", "<cmd>MarkdownHeaders<CR>", { noremap = true })
vim.keymap.set("n", "<leader>mdc", "<cmd>MarkdownHeadersClosest<CR>", { noremap = true })
-- Table mode
g["table_mode_map_prefix"] = "<Leader>ma"

g["vim_markdown_conceal_code_blocks"] = 0
g["vim_markdown_new_list_item_indent"] = 0
g["vim_markdown_edit_url_in"] = "tab"
g["vim_markdown_folding_style_pythonic"] = 1
g["vim_markdown_folding_level"] = 9
-- g["vim_markdown_folding_disabled"] = 1
g["vim_markdown_follow_anchor"] = 1
g["vim_markdown_strikethrough"] = 1
-- Turn on spelling only for that buffer
vim.api.nvim_create_autocmd("FileType", {
	-- command = "nmap <buffer> <A-j> )",
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.spell = true
		-- vim.cmd([[setlocal dictionary+=/usr/share/dict/words]])
		-- vim.cmd([[dictionary+=/usr/share/dict/dutch]])
	end,
})
-- vim.cmd([[autocmd FileType markdown setlocal spell]])
-- vim.cmd([[autocmd FileType markdown setlocal dictionary+=/usr/share/dict/words]])
-- vim.cmd([[autocmd FileType markdown setlocal dictionary+=/usr/share/dict/dutch]])
