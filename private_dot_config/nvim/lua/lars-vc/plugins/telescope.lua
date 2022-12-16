local telescope = require("telescope")

telescope.setup({
	pickers = {
		find_files = {
			path_display = { "truncate" },
			color_devicons = true,
		},
		live_grep = {
			path_display = { "shorten" },
		},
		current_buffer_fuzzy_find = {
			previewer = false,
			theme = "dropdown",
		},
		git_commits = {
			initial_mode = "normal",
		},
		git_bcommits = {
			initial_mode = "normal",
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-h>"] = "which_key",
			},
			n = {
				["<C-c>"] = "close",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-h>"] = "which_key",
			},
		},
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		layout_config = {
			bottom_pane = {
				height = 25,
				preview_cutoff = 120,
				prompt_position = "top",
			},
			center = {
				height = 0.4,
				preview_cutoff = 40,
				prompt_position = "top",
				width = 0.5,
			},
			cursor = {
				height = 0.9,
				preview_cutoff = 40,
				width = 0.8,
			},
			horizontal = {
				preview_cutoff = 120,
				prompt_position = "top",
				width = 0.75,
				height = 0.80,
				preview_width = 0.45,
			},
			vertical = {
				height = 0.9,
				preview_cutoff = 40,
				prompt_position = "bottom",
				width = 0.8,
			},
		},
		prompt_prefix = " ",
		selection_caret = "  ",
		dynamic_preview_title = true,
		results_title = false,
	},
	-- extensions = {
	-- 	neoclip = {
	-- 		-- on_complete = { function() vim.cmd "stopinsert" end }, -- doesnt work
	-- 		-- initial_mode = "normal", -- doesnt work
	-- 		previewer = false,
	-- 	},
	-- },
})

telescope.load_extension("fzf")

-- Neoclip setup
-- local function is_whitespace(line)
-- 	return vim.fn.match(line, [[^\s*$]]) ~= -1
-- end
--
-- local function all(tbl, check)
-- 	for _, entry in ipairs(tbl) do
-- 		if not check(entry) then
-- 			return false
-- 		end
-- 	end
-- 	return true
-- end
--
-- require("neoclip").setup({
-- 	--enable_persistent_history = true
-- 	filter = function(data)
-- 		return not all(data.event.regcontents, is_whitespace)
-- 	end,
-- })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#1b1f27", bg = "#e06c75" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#e06c75" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#252931" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#252931", bg = "#252931" })

vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#1b1f27" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#1b1f27", bg = "#1b1f27" })

vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#1b1f27", bg = "#98c379" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#252931" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#252931", bg = "#252931" })

vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#cdd6f4", bg = "#252931" })
