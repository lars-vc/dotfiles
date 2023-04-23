-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

require("color-picker").setup({ -- for changing icons & mappings
    -- ["icons"] = { "ﱢ", "" },
    -- ["icons"] = { "ﮊ", "" },
    -- ["icons"] = { "", "ﰕ" },
    -- ["icons"] = { "", "" },
    -- ["icons"] = { "", "" },
    ["icons"] = { "ﱢ", "" },
    ["border"] = "double", -- none | single | double | rounded | solid | shadow
    ["keymap"] = { -- mapping example:
        ["U"] = "<Plug>ColorPickerSlider5Decrease",
        ["O"] = "<Plug>ColorPickerSlider5Increase",
    },
    -- ["background_highlight_group"] = "CocFloating",
    -- ["border_highlight_group"] = "CocFloating",
    --    ["text_highlight_group"] = "CocFloating"
})
-- dont think this works?
-- vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
