--==Own components==--
-- total wordcount
local function getWords()
    return 'W:' .. tostring(vim.fn.wordcount().words)
end

-- linenumbering of cursor
local function getPos()
    local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return ':' .. tostring(row) .. '/' .. tostring(vim.api.nvim_buf_line_count(0)) .. ' :' .. tostring(col)
end

-- setup
-- local navic = require("nvim-navic")
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = { 'Trouble', 'fugitive', 'neotest-summary', 'gitcommit', 'help', 'dapui_console', 'dapui_stacks', },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'diff', 'encoding', 'fileformat', 'filetype' },
        lualine_y = { { getWords } },
        lualine_z = { { getPos } }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    -- winbar = {
    --     lualine_a = {},
    --     lualine_b = { { function()
    --         return "larsvc"
    --     end } },
    --     lualine_c = {
    --         { navic.get_location, cond = navic.is_available }
    --     },
    --     lualine_x = {},
    --     lualine_y = { 'branch', 'filesize' },
    --     lualine_z = {}
    -- },
    -- inactive_winbar = {
    --     lualine_a = {},
    --     lualine_b = { { function()
    --         return "Navic"
    --     end } },
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
    extensions = {}
}
