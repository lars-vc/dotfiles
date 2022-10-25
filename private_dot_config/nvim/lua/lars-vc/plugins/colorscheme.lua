-- Theme setup

--==Catppuccin==--
require("catppuccin").setup {
    flavour = "mocha", -- mocha, macchiato, frappe, latte
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        -- harpoon = true,
        notify = true,
        markdown = true,
        cmp = true,
        treesitter = true,
        lsp_trouble = true,
        which_key = true,
        vimwiki = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        navic = {
            enabled = true,
            custom_bg = "NONE",
        },
    }
}

--==Material==--
-- vim.g['material_style'] = "oceanic"
-- require('material').setup({
--     contrast = {
--         terminal = false, -- Enable contrast for the built-in terminal
--         sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--         floating_windows = false, -- Enable contrast for floating windows
--         cursor_line = false, -- Enable darker background for the cursor line
--         non_current_windows = false, -- Enable darker background for non-current windows
--         filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
--     },
--
--     styles = { -- Give comments style such as bold, italic, underline etc.
--         comments = { --[[ italic = true ]] },
--         strings = { --[[ bold = true ]] },
--         keywords = { --[[ underline = true ]] },
--         functions = { --[[ bold = true, undercurl = true ]] },
--         variables = {},
--         operators = {},
--         types = {},
--     },
--
--     plugins = { -- Uncomment the plugins that you use to highlight them
--         -- Available plugins:
--         -- "dap",
--         -- "dashboard",
--         -- "gitsigns",
--         -- "hop",
--         "indent-blankline",
--         -- "lspsaga",
--         -- "mini",
--         -- "neogit",
--         "nvim-cmp",
--         -- "nvim-navic",
--         -- "nvim-tree",
--         -- "sneak",
--         -- "telescope",
--         "trouble",
--         -- "which-key",
--     },
--
--     disable = {
--         colored_cursor = false, -- Disable the colored cursor
--         borders = false, -- Disable borders between verticaly split windows
--         background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--         term_colors = false, -- Prevent the theme from setting terminal colors
--         eob_lines = false -- Hide the end-of-buffer lines
--     },
--
--     high_visibility = {
--         lighter = false, -- Enable higher contrast text for lighter style
--         darker = false -- Enable higher contrast text for darker style
--     },
--
--     lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
--
--     async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--
--     custom_colors = nil, -- If you want to everride the default colors, set this to a function
--
--     custom_highlights = {}, -- Overwrite highlights with your own
-- })
