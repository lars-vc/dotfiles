local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            path_display = {"truncate"},
            color_devicons=true,
        },
        live_grep = {
            path_display = {"shorten"},
        },
    },
    defaults = {
        -- layout_config = {
        --     horizontal = {
        --         height= 0.8,
        --         width= 0.8,
        --     },
        --     center = {
        --         height= 0.8,
        --         width= 0.8,
        --     }
        -- },
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
            n = {
                ["<C-c>"] = "close",
            }
        }
    },
}

telescope.load_extension('fzf')
telescope.load_extension('harpoon')

require('neoclip').setup {
    --enable_persistent_history = true
}

