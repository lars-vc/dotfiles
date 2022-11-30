-------PACKER--------
-- ensure that packer is installed
-- lazy load --
-- treesitter context bufread?
-- https://www.reddit.com/r/neovim/comments/opipij/guide_tips_and_tricks_to_reduce_startup_and/

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])
local packer = require("packer")
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local lspfiletypes = { "c", "cpp", "rust", "lua", "python", "typescript", "javascript" }

return packer.startup(function(use)
    --==Impatient==--
    -- use { 'lewis6991/impatient.nvim', config = function()
    --     require('impatient').enable_profile()
    -- end }

    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")

    use({
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("lars-vc.plugins.web-devicons")
        end,
    }) -- icons in telescope and lualine

    --==Telescope==--
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        -- opt = true,
        -- module = { 'telescope' },
        -- cmd = { 'Telescope' },
        requires = { { "nvim-lua/plenary.nvim" }, { "nvim-tree/nvim-web-devicons" } },
        after = { "nvim-neoclip.lua" },
        config = function()
            require("lars-vc.plugins.telescope")
        end,
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        module = { "telescope" },
        cmd = { "Telescope" },
        opt = true,
    })
    use({
        "AckslD/nvim-neoclip.lua",
        requires = { "nvim-telescope/telescope.nvim" },
        after = { "telescope-fzf-native.nvim" },
    })

    --==Statusline==--
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lars-vc.plugins.lualine")
        end,
    })

    --==Git==--
    use({
        "tpope/vim-fugitive",
        config = function()
            require("lars-vc.plugins.fugitive")
        end,
        opt = true,
        cmd = { "Git" },
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("lars-vc.plugins.gitsigns")
        end,
        opt = true,
        cmd = { "Gitsigns" },
    })

    --==LSP==--
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("lars-vc.plugins.lspconfig")
        end,
        after = { "cmp-nvim-lsp" },
    })

    --==NULLls==--
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("lars-vc.plugins.nullls")
        end,
    })

    --==CMP==--
    use({
        "hrsh7th/nvim-cmp",
        after = "nvim-autopairs",
        config = function()
            require("lars-vc.plugins.cmp")
        end,
    })
    use({ "hrsh7th/cmp-nvim-lsp", ft = lspfiletypes })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
    use("onsails/lspkind-nvim")
    -- use { 'petertriho/cmp-git', opt = true, ft = { 'gitcommit' }, config = function() require('cmp_git').setup() end }

    --==Scrolling==--
    -- use { 'karb94/neoscroll.nvim', keys ={} config = function()
    --     require('neoscroll').setup()
    -- end }
    use("psliwka/vim-smoothie")

    --==Autopairs==--
    use({
        "windwp/nvim-autopairs",
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            require("lars-vc.plugins.autopairs")
        end,
    })
    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-autopairs",
        config = function()
            require("nvim-ts-autotag")
        end,
    })
    use("tpope/vim-surround")

    --==Treesitter==--
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("lars-vc.plugins.treesitter")
        end,
    })
    -- use { 'nvim-treesitter/nvim-treesitter-context',
    --     config = function() require('lars-vc.plugins.treesitter-context') end
    -- }

    --==Commenting==--
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("lars-vc.plugins.commenting")
        end,
    })

    --==Wakatime==--
    use("wakatime/vim-wakatime")

    --==Debugging==--
    use({
        "mfussenegger/nvim-dap",
        -- ft = lspfiletypes,
        module = { "dap" },
        opt = true,
        config = function()
            require("lars-vc.plugins.dap")
        end,
    })
    use({
        "rcarriga/nvim-dap-ui",
        -- ft = lspfiletypes,
        module = { "dapui" },
        opt = true,
        config = function()
            require("lars-vc.plugins.dapui")
        end,
        requires = { "mfussenegger/nvim-dap" },
    })
    use({
        "theHamsta/nvim-dap-virtual-text",
        -- ft = lspfiletypes,
        module = { "nvim-dap-virtual-text" },
        opt = true,
        config = function()
            require("lars-vc.plugins.dapvirt")
        end,
        requires = { "mfussenegger/nvim-dap" },
    })

    --==Lightspeed==--
    -- use { 'ggandor/lightspeed.nvim', requires = 'tpope/vim-repeat',
    --     config = function() require('lars-vc.plugins.lightspeed') end } -- use leap.nvim soon
    use("tpope/vim-repeat")

    --==Whichkey==--
    use({
        "folke/which-key.nvim",
        config = function()
            require("lars-vc.plugins.whichkey")
        end,
    })

    --==Aligning text==--
    use({ "godlygeek/tabular", opt = true, cmd = "Tabularize" })

    --==Markdown==--
    use({
        "preservim/vim-markdown",
        opt = true,
        ft = { "markdown" },
        config = function()
            require("lars-vc.plugins.markdown")
        end,
    })
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        opt = true,
        cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
    })
    use({ "dhruvasagar/vim-table-mode", opt = true, ft = { "markdown" } })

    --==Harpoon==--
    use({
        "ThePrimeagen/harpoon",
        requires = "nvim-lua/plenary.nvim",
        opt = true,
        config = function()
            require("lars-vc.plugins.harpoon")
        end,
        module = { "harpoon" },
    })

    --==Snippets==--
    use({
        "L3MON4D3/LuaSnip",
        after = "friendly-snippets",
        config = function()
            require("lars-vc.plugins.luasnip")
        end,
    })
    use({ "rafamadriz/friendly-snippets", after = "nvim-cmp" })

    --==IndentGuides==--
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("lars-vc.plugins.indentguides")
        end,
    })

    --==Ranger==--
    use({
        "kevinhwang91/rnvimr",
        cmd = { "RnvimrToggle" },
        config = function()
            require("lars-vc.plugins.rnvimr")
        end,
        opt = true,
    })

    --==Colorizing==--
    use({ "RRethy/vim-hexokinase", run = "make hexokinase" })

    --==VimWiki==--
    use({
        "vimwiki/vimwiki",
        cmd = { "VimwikiIndex" },
        ft = { "vimwiki" },
        opt = true,
        config = function()
            require("lars-vc.plugins.vimwiki")
        end,
    })

    --==Notification==--
    use({
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    })

    --==Colorpicker==--
    use({
        "ziontee113/color-picker.nvim",
        opt = true,
        cmd = { "PickColor", "PickColorInsert" },
        config = function()
            require("lars-vc.plugins.colorpicker")
        end,
    })

    --==GrammarChecker==--
    use({ "rhysd/vim-grammarous", cmd = { "GrammarousCheck", "GrammarousReset" }, opt = true })

    --==Trouble==--
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("lars-vc.plugins.trouble")
        end,
        cmd = { "TodoTrouble", "TroubleToggle" },
    })
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("lars-vc.plugins.todo_comments")
        end,
    })

    --==Nabla==--
    use({ "jbyuki/nabla.nvim", module = { "nabla" }, opt = true })

    --==Neotest==--
    use({ "nvim-neotest/neotest-python", module = { "neotest-python" }, opt = true })
    use({ "nvim-neotest/neotest-go", module = { "neotest-go" }, opt = true })
    use({ "haydenmeade/neotest-jest", module = { "neotest-jest" }, opt = true })
    use({ "rouge8/neotest-rust", module = { "neotest-rust" }, opt = true })
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("lars-vc.plugins.neotest")
        end,
        opt = true,
        module = { "neotest" },
    })

    --==Hover.nvim==--
    use({
        "lewis6991/hover.nvim",
        opt = true,
        keys = { "gh", "gH" },
        config = function()
            require("lars-vc.plugins.hover")
        end,
    })

    --==Better Codeaction==--
    use({ "weilbith/nvim-code-action-menu", opt = true, cmd = "CodeActionMenu" })

    -- use { 'cshuaimin/ssr.nvim',
    --     -- Calling setup is optional.
    --     config = function()
    --         require('ssr').setup {
    --             min_width = 50,
    --             min_height = 5,
    --             keymaps = {
    --                 close = 'q',
    --                 next_match = 'n',
    --                 prev_match = 'N',
    --                 replace_all = '<leader><cr>',
    --             },
    --         }
    --     end,
    --     opt = true,
    --     module = 'ssr',
    -- } -- has malloc bugs

    --==Latex==--
    use({
        "lervag/vimtex",
        ft = { "tex", "vimtex" },
        opt = true,
        config = function()
            require("lars-vc.plugins.vimtex")
        end,
    })

    --==Colorscheme==--
    use({ "catppuccin/nvim", as = "catppuccin" })

    --Bootstrap--
    if packer_bootstrap then
        require("packer").sync()
    end
end)
