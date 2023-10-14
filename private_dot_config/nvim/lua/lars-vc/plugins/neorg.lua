require("neorg").setup({
    load = {
        ["core.defaults"] = {}, -- import all default modules
        ["core.concealer"] = {}, -- import the concealer which turns things into nice nerdfont stuff
        -- ["core.completion"] = {}, -- import completion engine
        ["core.dirman"] = { -- import dirman for managing workspaces
            config = {
                workspaces = {
                    ugent = "~/neorg/ugent",
                    home = "~/neorg/home",
                },
            },
        },
    },
})
