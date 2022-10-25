local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            path_display = {"truncate"},
            color_devicons = true,
        },
        live_grep = {
            path_display = {"shorten"},
        },
        current_buffer_fuzzy_find = {
            previewer = false,
            theme = "dropdown"
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous"
            },
            n = {
                ["<C-c>"] = "close",
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous"
            }
        },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
            bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "top"
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.5
            },
            cursor = {
                height = 0.9,
                preview_cutoff = 40,
                width = 0.8
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
                width = 0.8
            } 
        },
        prompt_prefix = " ",
        selection_caret = "  ",
        dynamic_preview_title = true,
        results_title = false,
    },
    extensions = {
        neoclip = {
            on_complete = { function() vim.cmd"stopinsert" end }, -- doesnt work
            initial_mode = "normal", -- doesnt work
            previewer = false,
        },
    }
}

telescope.load_extension('fzf')
telescope.load_extension('harpoon')

-- Neoclip setup
local function is_whitespace(line)
    return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
    for _, entry in ipairs(tbl) do
        if not check(entry) then
            return false
        end
    end
    return true
end
require('neoclip').setup {
    --enable_persistent_history = true
    filter = function(data)
        return not all(data.event.regcontents, is_whitespace)
    end,
}
