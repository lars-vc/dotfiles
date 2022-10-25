require('nvim-treesitter.configs').setup {
    ensure_installed = { "python", "rust", "c", "cpp", "json", "javascript", "java", "kotlin", "lua", "typescript", "vim",
        "yaml", "toml", "html", "bash", "tsx", "latex", "regex", "go" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = false
    },
    autotag = {
        enable = true
    }
}
