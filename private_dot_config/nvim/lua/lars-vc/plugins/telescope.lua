local telescope = require('telescope')

telescope.setup {
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
            theme = "dropdown"
        },
        git_commits = {
            initial_mode = "normal",
        },
        git_bcommits = {
            initial_mode = "normal",
        }
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
            on_complete = { function() vim.cmd "stopinsert" end }, -- doesnt work
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

--==Keymaps==--
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { noremap = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope neoclip plus<cr><Esc>', { noremap = true })
vim.keymap.set('n', '<leader>fi', '<cmd>Telescope find_files cwd=~/.config/nvim prompt_title=VimRC<cr>',
    { noremap = true })
vim.keymap.set('n', '<leader>fp', builtin.planets, { noremap = true })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { noremap = true })
-- help related
vim.keymap.set('n', '<leader>fhh', builtin.help_tags, { noremap = true })
vim.keymap.set('n', '<leader>fhc', builtin.command_history, { noremap = true })
vim.keymap.set('n', '<leader>fhs', builtin.search_history, { noremap = true })
vim.keymap.set('n', '<leader>fhm', builtin.man_pages, { noremap = true })
vim.keymap.set('n', '<leader>fhk', builtin.keymaps, { noremap = true })
vim.keymap.set('n', '<leader>fho', builtin.vim_options, { noremap = true })
vim.keymap.set('n', '<leader>fhr', builtin.reloader, { noremap = true })
vim.keymap.set('n', '<leader>fhb', builtin.builtin, { noremap = true })
-- git related stuff
vim.keymap.set('n', '<leader>gfc', builtin.git_commits, { noremap = true })
vim.keymap.set('n', '<leader>gfb', builtin.git_bcommits, { noremap = true })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { noremap = true })
