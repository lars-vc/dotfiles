require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "python",
        "rust",
        "c",
        "cpp",
        "json",
        "javascript",
        "java",
        "kotlin",
        "lua",
        "typescript",
        "vim",
        "yaml",
        "toml",
        "html",
        "bash",
        "tsx",
        "latex",
        "regex",
        "go",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = false,
    },
    autotag = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = { query = "@function.outer", desc = "around of a function" },
                ["if"] = { query = "@function.inner", desc = "inner of a function" },
                ["ac"] = { query = "@class.outer", desc = "around of a class" },
                ["ic"] = { query = "@class.inner", desc = "inner of a class" },
                ["al"] = { query = "@loop.outer", desc = "around of a loop" },
                ["il"] = { query = "@loop.inner", desc = "inner of a loop " },
                ["ai"] = { query = "@conditional.outer", desc = "around of a cond" },
                ["ii"] = { query = "@conditional.inner", desc = "inner of a cond" },
                ["ao"] = { query = "@comment.outer", desc = "outer of a comment" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            -- selection_modes = {
            --     ["@parameter.outer"] = "v", -- charwise
            --     ["@function.outer"] = "V", -- linewise
            --     ["@class.outer"] = "<c-v>", -- blockwise
            -- },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
        },
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["<leader>lh"] = "@function.outer",
                ["<leader>lH"] = "@class.outer",
            },
        },
    },
})
