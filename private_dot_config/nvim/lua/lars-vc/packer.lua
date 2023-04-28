---PACKER---
-- https://www.reddit.com/r/neovim/comments/opipij/guide_tips_and_tricks_to_reduce_startup_and/

-- ensure that packer is installed
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

local lspfiletypes = { "c", "cpp", "rust", "lua", "python", "typescript", "javascript", "tex" }
local nulllsfiletypes = { "c", "cpp", "rust", "lua", "python", "typescript", "javascript", "tex", "json", "sh", "bash" }

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
        -- after = { "nvim-neoclip.lua" },
        after = { "telescope-fzf-native.nvim" },
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
    -- use({
    -- 	"AckslD/nvim-neoclip.lua",
    -- 	-- event = { "TextYankPost" },
    -- 	requires = { "nvim-telescope/telescope.nvim" },
    -- 	after = { "telescope-fzf-native.nvim" },
    -- })

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

    --==Fidget==--
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({
                text = { spinner = "dots" },
                sources = {
                    ltex = { ignore = true }, -- ltex spammed updates on each character typed
                },
            })
        end,
        ft = nulllsfiletypes,
    })

    --==NULLls==--
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("lars-vc.plugins.nullls")
        end,
        ft = nulllsfiletypes,
        -- module = { "null-ls" },
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
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
    use({ "onsails/lspkind-nvim" })
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
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
    })
    use({
        "nvim-treesitter/playground",
    })

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
    use({
        "ggandor/leap.nvim",
        requires = "tpope/vim-repeat",
        config = function()
            local leap = require("leap")
            leap.opts.safe_labels = {}
            -- leap.add_default_mappings()
        end,
    }) -- use leap.nvim soon

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
        cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
        ft = { "markdown" },
        opt = true,
    })
    use({ "dhruvasagar/vim-table-mode", opt = true, ft = { "markdown" } })
    use({
        "AntonVanAssche/md-headers.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        opt = true,
        ft = { "markdown" },
    })

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
            local notify = require("notify")
            notify.setup({ stages = "fade", timeout = 3000 })
            vim.notify = notify
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
    -- use({ "rhysd/vim-grammarous", cmd = { "GrammarousCheck", "GrammarousReset" }, opt = true })
    -- use({ "dpelle/vim-LanguageTool", cmd = { "LanguageToolCheck" }, opt = true })

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

    --==Hover==--
    use({
        "Fildo7525/pretty_hover",
        opt = true,
        module = "pretty_hover",
        config = function()
            require("pretty_hover").setup()
            -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            --     border = "rounded",
            -- })
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

    --==Ipynb==--
    -- use({
    -- 	"meatballs/ipynb.nvim", --[[ ft= {"ipynb"} ]]
    -- })

    --==Copilot==--
    use({
        "zbirenbaum/copilot.lua",
        module = "copilot",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("lars-vc.plugins.copilot")
        end,
    })
    use({
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    })

    --==Flote==--
    use({
        "JellyApple102/flote.nvim",
        config = function()
            require("flote").setup({
                q_to_quit = true,
                window_style = "minimal",
                window_border = "solid",
                window_title = false, -- set to true when 0.9 is out
            })
        end,
        opt = true,
        cmd = "Flote",
    })

    --==Neogen==--
    use({
        "danymat/neogen",
        opt = true,
        config = function()
            require("neogen").setup({ snippet_engine = "luasnip" })
        end,
        module = "neogen",
        cmd = "Neogen",
        requires = { "nvim-treesitter/nvim-treesitter", "L3MON4D3/LuaSnip" },
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    })

    --==Better folds==--
    use({
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = function()
            vim.o.foldcolumn = "0" -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99 -- no folds closed at start
            vim.o.foldenable = true

            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = ("  %d "):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, "MoreMsg" })
                return newVirtText
            end

            require("ufo").setup({
                open_fold_hl_timeout = 0,
                fold_virt_text_handler = handler,
                preview = {
                    mappings = {
                        scrollU = "<C-u>",
                        scrollD = "<C-d>",
                        jumpTop = "gg",
                        jumpBot = "G",
                    },
                },
            })
        end,
    })

    --==Muren.nvim==--
    -- use({
    --     "AckslD/muren.nvim",
    --     config = function()
    --         require("muren").setup({ create_commands = false })
    --     end,
    --     opt = true,
    --     module = "muren",
    -- })

    --==Colorscheme==--
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("lars-vc.plugins.colorscheme")
        end,
    })

    --Bootstrap--
    if packer_bootstrap then
        require("packer").sync()
    end
end)
