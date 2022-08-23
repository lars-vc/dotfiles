require('material').setup({

	contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},

	italics = {
		comments = false, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},

	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf" -- Darker qf list background
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},

	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	},

	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

	custom_highlights = {}, -- Overwrite highlights with your own

	plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
		trouble = false,
		nvim_cmp = false,
		neogit = false,
		gitsigns = false,
		git_gutter = true,
		telescope = false, -- Own setup, see init.vim
		nvim_tree = false,
		sidebar_nvim = false,
		lsp_saga = false,
		nvim_dap = false,
		nvim_navic = false,
		which_key = false, -- Own setup, see init.vim
		sneak = false,
		hop = false,
		indent_blankline = true,
		nvim_illuminate = false,
		mini = false,
	}
})
