-- Plugin keymaps
-- Colorpicker --
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", { noremap = true })
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true })

-- Ranger --
vim.keymap.set("n", "<M-r>", "<cmd>RnvimrToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<M-r>", "<C-\\><C-n><cmd>RnvimrToggle<CR>", { noremap = true, silent = true })

-- Grammarous --
-- vim.keymap.set("n", "<leader>zg", "<cmd>GrammarousCheck<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>zr", "<cmd>GrammarousReset<CR>", { noremap = true })

-- Tabular --
vim.keymap.set("x", "<leader>t", ":Tabular /", { noremap = true })

-- Trouble --
vim.keymap.set("n", "<leader>ll", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ld", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>lr", "<cmd>TroubleRefresh<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>lx", "<cmd>TroubleClose<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>lc", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>lq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gt", "<cmd>TroubleToggle lsp_type_definitions<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gi", "<cmd>TroubleToggle lsp_implementations<cr>", { silent = true, noremap = true })

-- Telescope --
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { noremap = true })
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { noremap = true })
vim.keymap.set("n", "<leader>fG", function()
	require("telescope.builtin").grep_string()
end, { noremap = true })
vim.keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").resume()
end, { noremap = true })
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { noremap = true, desc = "buf fuzzyfind" })
vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { noremap = true })
-- vim.keymap.set(
--     "n",
--     "<leader>fn",
--     "<cmd>Telescope neoclip plus theme=dropdown initial_mode=normal previewer=false<cr><Esc>",
--     { noremap = true }
-- )
vim.keymap.set(
	"n",
	"<leader>fi",
	"<cmd>Telescope find_files cwd=~/.config/nvim prompt_title=VimRC<cr>",
	{ noremap = true }
)
vim.keymap.set("n", "<leader>fp", function()
	require("telescope.builtin").planets()
end, { noremap = true })
vim.keymap.set("n", "<leader>fd", function()
	require("telescope.builtin").diagnostics()
end, { noremap = true })
vim.keymap.set("n", "<leader>fl", function()
	require("telescope.builtin").lsp_document_symbols()
end, { noremap = true })
-- help related
vim.keymap.set("n", "<leader>fhh", function()
	require("telescope.builtin").help_tags()
end, { noremap = true })
vim.keymap.set("n", "<leader>fhc", function()
	require("telescope.builtin").command_history()
end, { noremap = true })
vim.keymap.set("n", "<leader>fhs", function()
	require("telescope.builtin").search_history()
end, { noremap = true })
vim.keymap.set("n", "<leader>fhm", function()
	require("telescope.builtin").man_pages()
end, { noremap = true })
vim.keymap.set("n", "<leader>fhk", function()
	require("telescope.builtin").keymaps()
end, { noremap = true })
vim.keymap.set("n", "<leader>fho", function()
	require("telescope.builtin").vim_options()
end, { noremap = true })
vim.keymap.set("n", "<leader>fhr", function()
	require("telescope.builtin").reloader()
end, { noremap = true })
vim.keymap.set("n", "<leader>fhb", function()
	require("telescope.builtin").builtin()
end, { noremap = true })
-- git related stuff
vim.keymap.set("n", "<leader>gcc", function()
	require("telescope.builtin").git_commits()
end, { noremap = true })
vim.keymap.set("n", "<leader>gcb", function()
	require("telescope.builtin").git_bcommits()
end, { noremap = true })
vim.keymap.set("n", "<leader>gb", function()
	require("telescope.builtin").git_branches()
end, { noremap = true })

-- Fugitive --
vim.keymap.set("n", "<leader>gg", ":Git ", { noremap = true })
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gP", "<cmd>Git push --set-upstream origin HEAD<CR>", { noremap = true })
vim.keymap.set("n", "<leader>go", "<cmd>Git pull<CR>", { noremap = true })
vim.keymap.set(
	"n",
	"<leader>ga",
	"<cmd>!git config --global --add safe.directory <C-R>=getcwd()<CR><CR>",
	{ noremap = true }
)
-- for merge conflicts (pick left or right), to start comparing go into status and press dv on a file
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { noremap = true })

-- Neotest --
vim.keymap.set("n", "<leader>tt", function()
	require("neotest").run.run()
end, { noremap = true })
vim.keymap.set("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { noremap = true })
vim.keymap.set("n", "<leader>ta", function()
	require("neotest").run.run(".")
end, { noremap = true })
vim.keymap.set("n", "<leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { noremap = true })
vim.keymap.set("n", "<leader>tx", function()
	require("neotest").run.stop()
end, { noremap = true })
vim.keymap.set("n", "<leader>th", function()
	require("neotest").run.attach()
end, { noremap = true })

vim.keymap.set("n", "<leader>too", function()
	require("neotest").output.open({ enter = true })
end, { noremap = true })
vim.keymap.set("n", "<leader>tos", function()
	require("neotest").output.open({ enter = true, short = true })
end, { noremap = true })

vim.keymap.set("n", "<leader>tj", function()
	require("neotest").jump.next({ status = "failed" })
end, { noremap = true })
vim.keymap.set("n", "<leader>tk", function()
	require("neotest").jump.prev({ status = "failed" })
end, { noremap = true })

vim.keymap.set("n", "<leader>tss", function()
	require("neotest").summary.toggle()
end, { noremap = true })
vim.keymap.set("n", "<leader>tso", function()
	require("neotest").summary.open()
end, { noremap = true })
vim.keymap.set("n", "<leader>tsc", function()
	require("neotest").summary.close()
end, { noremap = true })
vim.keymap.set("n", "<leader>tst", function()
	require("neotest").summary.run_marked()
end, { noremap = true })

-- Harpoon --
vim.keymap.set("n", ",", "m", { noremap = true })
vim.keymap.set("n", "m", "<NOP>", { noremap = true })
vim.keymap.set("n", "mm", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true })
vim.keymap.set("n", "mq", function()
	require("harpoon"):list():append()
end, { noremap = true })
-- naving
vim.keymap.set("n", "mf", function()
	require("harpoon"):list():select(1)
end, { noremap = true })
vim.keymap.set("n", "md", function()
	require("harpoon"):list():select(2)
end, { noremap = true })
vim.keymap.set("n", "ms", function()
	require("harpoon"):list():select(3)
end, { noremap = true })
vim.keymap.set("n", "ma", function()
	require("harpoon"):list():select(4)
end, { noremap = true })
vim.keymap.set("n", "mj", function()
	require("harpoon"):list():select(5)
end, { noremap = true })
vim.keymap.set("n", "mk", function()
	require("harpoon"):list():select(6)
end, { noremap = true })
vim.keymap.set("n", "ml", function()
	require("harpoon"):list():select(7)
end, { noremap = true })

-- GitSigns --
vim.keymap.set("n", "<leader>gii", function()
	require("gitsigns").toggle_signs()
end, { noremap = true })
vim.keymap.set("n", "<leader>gin", function()
	require("gitsigns").toggle_numhl()
end, { noremap = true })
vim.keymap.set("n", "<leader>gil", function()
	require("gitsigns").toggle_linehl()
end, { noremap = true })
vim.keymap.set("n", "<leader>giw", function()
	require("gitsigns").toggle_word_diff()
end, { noremap = true })
vim.keymap.set("n", "<leader>gib", function()
	require("gitsigns").toggle_current_line_blame()
end, { noremap = true })
vim.keymap.set("n", "<leader>gid", function()
	require("gitsigns").toggle_deleted()
end, { noremap = true })

-- DAP --
vim.keymap.set("n", "<leader>dd", function()
	require("dap").continue()
end, { noremap = true })
vim.keymap.set("n", "<leader>dt", function()
	require("dap").toggle_breakpoint()
end, { noremap = true })
vim.keymap.set("n", "<leader>dbm", function()
	require("dap").set_breakpoint({ nil, nil, vim.fn.input("[Log msg] > ") })
end, { noremap = true })
vim.keymap.set("n", "<leader>dbc", function()
	require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
end, { noremap = true })
vim.keymap.set("n", "<leader>dbx", function()
	require("dap").clear_breakpoints()
end, { noremap = true })
vim.keymap.set("n", "<leader>dbl", function()
	require("dap").list_breakpoints()
end, { noremap = true })
vim.keymap.set("n", "<leader>dx", function()
	require("dap").terminate()
end, { noremap = true })
vim.keymap.set("n", "<leader>dr", function()
	require("dap").restart()
end, { noremap = true })
vim.keymap.set("n", "<leader>dn", function()
	require("dap").continue()
end, { noremap = true })
vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end, { noremap = true })
vim.keymap.set("n", "<leader>dc", function()
	require("dap").run_to_cursor()
end, { noremap = true })
vim.keymap.set("n", "<leader>dp", function()
	require("dap").pause()
end, { noremap = true })
vim.keymap.set("n", "<S-j>", function()
	require("dap").step_into()
end, { noremap = true })
vim.keymap.set("n", "<S-k>", function()
	require("dap").step_back()
end, { noremap = true })
vim.keymap.set("n", "<S-l>", function()
	require("dap").step_over()
end, { noremap = true })
vim.keymap.set("n", "<S-h>", function()
	require("dap").step_out()
end, { noremap = true })
vim.keymap.set("v", "<leader>e", function()
	require("dapui").eval()
end, { noremap = true })

-- Nabla --
vim.keymap.set("n", "<leader>nn", function()
	require("nabla").popup()
end, { noremap = true })
vim.keymap.set("n", "<leader>no", function()
	require("nabla").enable_virt()
end, { noremap = true })
vim.keymap.set("n", "<leader>nc", function()
	require("nabla").disable_virt()
end, { noremap = true })

-- SSR --
-- vim.keymap.set({ 'n', 'x' }, '<leader>os', function() require('ssr').open() end)

-- Leap --
vim.keymap.set("n", "s", function()
	require("leap").leap({ target_windows = { vim.fn.win_getid() } })
end, { noremap = true })

-- Hover --
vim.keymap.set("n", "gh", function()
	local check, ufo = pcall(require, "ufo")
	if check then
		local winid = ufo.peekFoldedLinesUnderCursor()
		if winid then
			local bufnr = vim.api.nvim_win_get_buf(winid)
			local keys = { "a", "i", "o", "A", "I", "O", "gd", "gr", "gi" }
			for _, k in ipairs(keys) do
				-- Add a prefix key to fire `trace` action,
				vim.keymap.set("n", k, "<CR>" .. k, { noremap = false, buffer = bufnr })
			end
			return
		end
	end
	require("pretty_hover").hover()
	-- vim.lsp.buf.hover()
end, { desc = "hover info" })

-- CodeActionMenu --
-- list all code actions for line
vim.keymap.set({ "n", "v" }, "gA", "<cmd>CodeActionMenu<cr>", { noremap = true })

-- Flote --
vim.keymap.set("n", "<leader>wf", function()
	vim.cmd([[Flote]])
	vim.diagnostic.disable(0)
end, { noremap = true, desc = "Flote" })
vim.keymap.set("n", "<leader>wm", "<cmd>Flote manage<cr>", { noremap = true, desc = "Flote manage" })
vim.keymap.set("n", "<leader>wg", function()
	vim.cmd([[Flote global]])
	vim.diagnostic.disable(0)
end, { noremap = true, desc = "Flote global" })

-- Neogen --
vim.keymap.set("n", "<leader>e", function()
	require("neogen").generate({})
end, { noremap = true })

-- Muren --
vim.keymap.set("n", "<leader>rr", function()
	require("muren.api").toggle_ui()
end, { noremap = true })
vim.keymap.set("n", "<leader>ro", function()
	require("muren.api").open_ui()
end, { noremap = true })
vim.keymap.set("n", "<leader>rc", function()
	require("muren.api").close_ui()
end, { noremap = true })
vim.keymap.set("n", "<leader>rf", function()
	require("muren.api").open_fresh_ui()
end, { noremap = true })
vim.keymap.set("n", "<leader>ru", function()
	require("muren.api").open_unique_ui()
end, { noremap = true })

-- Telekasten --
-- vim.keymap.set("n", "<leader>kk", function()
--     require("telekasten").panel()
-- end, { noremap = true })
-- vim.keymap.set("n", "<leader>kn", function()
--     require("telekasten").new_note()
-- end, { noremap = true })
--
-- vim.api.nvim_create_autocmd("FileType", {
--     callback = function()
--         vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>", { noremap = true })
--     end,
--     pattern = { "telekasten" },
-- })

-- UltraZenMode --
vim.api.nvim_create_user_command("UltraZen", "ZenMode | Twilight", { desc = "ZenMode + Twilight" })

-- Neorg --

vim.keymap.set("n", "<leader>jj", "<cmd>Neorg index<CR>", { noremap = true })
vim.keymap.set("n", "<leader>jr", "<cmd>Neorg return<CR>", { noremap = true })
