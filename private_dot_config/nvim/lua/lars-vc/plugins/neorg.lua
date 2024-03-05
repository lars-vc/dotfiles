require("neorg").setup({
    load = {
        ["core.defaults"] = {}, -- import all default modules
        ["core.keybinds"] = {
            config = {
                neorg_leader = "<Leader>j",
            },
        },
        ["core.concealer"] = {}, -- import the concealer which turns things into nice nerdfont stuff
        -- ["core.completion"] = { -- import completion engine, due to lazy loading this gives issues
        -- 	config = {
        -- 		engine = "nvim-cmp",
        -- 	},
        -- },
        ["core.summary"] = {},
        ["core.dirman"] = { -- import dirman for managing workspaces
            config = {
                workspaces = {
                    ugent = "~/neorg/ugent",
                    home = "~/neorg/home",
                },
                default_workspace = "ugent",
            },
        },
        ["core.integrations.telescope"] = {},
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            },
        },
    },
})

-- Telescope integration
local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<Leader>jff", "core.integrations.telescope.find_norg_files" },
            { "<Leader>jfl", "core.integrations.telescope.find_linkable" },
            { "<Leader>jil", "core.integrations.telescope.insert_link" },
            { "<Leader>jif", "core.integrations.telescope.insert_file_link" },
        },

        i = { -- Bind in insert mode
            -- { "<C-i>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)

-- Format on save
vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    group = vim.api.nvim_create_augroup("format_norg", { clear = true }),
    callback = function(opts)
        vim.api.nvim_create_autocmd("BufWritePost", {
            buffer = opts.buf,
            callback = function()
                -- save current view
                -- turn off redraw because it will cause jitter
                -- then format
                -- reset view
                -- then turn redraw back on
                local key = vim.api.nvim_replace_termcodes(
                    ":let win=winsaveview()<cr>:set lazyredraw<cr>gg=G:call winrestview(win)<cr>:set nolazyredraw<cr>:wa<cr>"
                    ,
                    true,
                    false,
                    true
                )
                vim.api.nvim_feedkeys(key, "n", false)
            end,
            -- command = "normal gg=G",
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    group = vim.api.nvim_create_augroup("folds_norg", { clear = true }),
    callback = function(opts)
        require("ufo").detach()
    end,
})
-- neorg toc
-- which key labelling
-- fix indent
-- inject metadata
-- summaries
