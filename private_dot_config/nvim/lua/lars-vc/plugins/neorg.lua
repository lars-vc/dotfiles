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
    },
})

-- Telescope integration
local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<Leader>jfl", "core.integrations.telescope.find_linkable" },
            { "<Leader>jff", "core.integrations.telescope.find_norg_files" },
            { "<Leader>jfi", "core.integrations.telescope.insert_link" },
        },

        i = { -- Bind in insert mode
            { "<C-i>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
-- Neorg index
-- Neorg return
-- neorg toc
-- which key labelling
-- fix indent
-- inject metadata
-- summaries
