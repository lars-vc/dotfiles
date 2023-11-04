---KEYMAPS for none plugin stuff---
-- leader key
vim.keymap.set("n", "<space>", "<nop>", { noremap = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader><leader>", "<cmd>wa<cr>", { noremap = true })
vim.keymap.set("n", "<leader>lf", function()
	-- check if null-ls exists
	local check, nullls = pcall(require, "null-ls")
	-- check if a formatting source of null-ls is registered
	if check and nullls.is_registered({ method = nullls.methods.FORMATTING }) then
		vim.lsp.buf.format()
	else
		vim.cmd([[normal gg=G<C-o>]])
	end
end, { noremap = true })
-- moving in insert mode and cmdmode
vim.keymap.set({ "i", "c" }, "<A-h>", "<Left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-j>", "<Down>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-k>", "<Up>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-l>", "<Right>", { noremap = true })
-- moving around windows
vim.keymap.set("n", "<C-H>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-J>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-K>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-w>l", { noremap = true })

vim.keymap.set("t", "<C-H>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.keymap.set("t", "<C-J>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.keymap.set("t", "<C-K>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.keymap.set("t", "<C-L>", "<C-\\><C-n><C-w>l", { noremap = true })
-- creating and moving the splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ss", "<cmd>split<cr>", { noremap = true })
vim.keymap.set("n", "<leader>sx", "<C-w>x", { noremap = true })
-- searching centers the line
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
-- closing stuff
vim.keymap.set("n", "<leader>xt", "<cmd>wa<cr><cmd>tabclose<cr>", { noremap = true })
vim.keymap.set("n", "<leader>xx", "<cmd>wa<cr><cmd>qa<cr>", { noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>qa!<cr>", { noremap = true })
-- undo breakpoints
vim.keymap.set("i", ".", ".<C-g>u", { noremap = true })
vim.keymap.set("i", ",", ",<C-g>u", { noremap = true })
-- moving text
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>", { noremap = true })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>", { noremap = true })
vim.keymap.set("n", "<A-h>", "<<")
vim.keymap.set("n", "<A-l>", ">>")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv", { noremap = true })
vim.keymap.set("v", "<A-h>", ":<<cr>gv")
vim.keymap.set("v", "<A-l>", ":><cr>gv")
-- creating files
vim.keymap.set("n", "<leader>ot", ":!touch <C-R>=getcwd()<CR>/", { noremap = true })
vim.keymap.set("n", "<leader>oe", ":edit <C-R>=getcwd()<CR>/", { noremap = true })
vim.keymap.set("n", "<leader>od", ":!mkdir -p <C-R>=getcwd()<CR>/", { noremap = true })
vim.keymap.set("n", "<leader>om", ":!mv <C-R>=getcwd()<CR>/ <C-R>=getcwd()<CR>/", { noremap = true })
vim.keymap.set("n", "<leader>or", ":!rm -r <C-R>=getcwd()<CR>/", { noremap = true })
-- easy spell correct
vim.keymap.set("i", "<C-z>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { noremap = true })
-- take first spellingfix
vim.keymap.set("n", "<leader>zz", "1z=", { noremap = true })
-- alternate file
vim.keymap.set("n", "<BS>", "<C-^>", { noremap = true })
-- yanking and pasting
vim.keymap.set("n", "<leader>y", '<cmd>let @+=@" | echo "ClipYanked"<cr>', { noremap = true }) -- move clipboard content to sys clipboard
vim.keymap.set("v", "<leader>d", '"_d', { noremap = true })
-- vim.keymap.set('v', 'gp', '"_dP', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = true })
-- For snippets
vim.keymap.set({ "s" }, "<backspace>", "<backspace>i")
-- Show diagnostics for current line
vim.keymap.set("n", "go", vim.diagnostic.open_float, { noremap = true })
-- Jump between diagnostic messages
vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, { noremap = true })
-- For navigating wordwrapped text
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
