--documenting which key
local whichkey = require('which-key')
whichkey.setup {
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = false,
        }
    },
    key_labels = {
        ["<space>"] = "SPC",
        ["<leader>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
    },
    window = {
        --border = "double"
    }

}
whichkey.register({
    ["<leader>"] = {
        ["<leader>"] = "save all",
        f = {
            name = "+telescope",
            f = "find a file",
            b = "find an open buffer",
            c = "search in current buffer",
            g = "search in all files",
            n = "neoclip",
            i = "find in config",
            p = "view the planets",
            h = {
                name = "+help",
                h = "help tags",
                c = "command history",
                s = "search history",
                m = "man pages",
                k = "keymaps",
                o = "vim options",
                r = "lua module reloader",
                b = "builtin pickers",
            }
        },
        l = {
            name = "+lsp",
            t = "goto type-definition",
            j = "goto next diagnostic",
            k = "goto prev diagnostic",
            a = "code actions",
            n = "rename",
            l = "workspace diagnostic",
            d = "document diagnostic",
            x = "close trouble",
            r = "refresh trouble results",
            q = "trouble quickfix",
            c = "trouble loclist",
            i = "trouble todo-list",
        },
        d = {
            name = "+vimspector",
            d = "launch debugger",
            D = "launch debugger plain",
            b = "breakpoint menu",
            h = "toggle breakpoint",
            e = "toggle cond breakpoint",
            n = "continue running",
            c = "run til cursor",
            r = "restart debugger",
            x = "quit debugger",
            X = "clear all breakpoints",
            i = "balloon eval",
            g = "goto current line"
        },
        g = {
            name = "+git",
            c = "coma",
            s = "status",
            g = ":Git {cmd}",
            p = "push",
            P = "push new branch to origin",
            o = "pull",
            h = "merge-conflict pick left",
            l = "merge-conflict pick right",
            b = "see branches",
            f = {
                name = "+commitlist",
                c = "list all commits",
                b = "list open buffer commits",
            }
        },
        z = {
            name = "+spellgram",
            z = "quick spellfix",
            g = "grammarous check",
            r = "grammarous reset"
        },
        m = {
            name = "+markdown",
            h = "header decrease",
            l = "header increase",
            t = "format table",
            i = {
                name = "+inserttoc",
                c = "custom toc",
                i = "regular toc",
                n = "toc with numbers"
            },
            p = {
                name = "+preview",
                o = "open preview",
                c = "close preview",
                p = "toggle preview"
            },
            a = {
                name = "+tablemode",
                m = "toggle table mode",
                t = "tableize"
            }
        },
        x = {
            name = "+closing",
            x = "save all and quit nvim",
            t = "save all and close tab",
            q = "quit nvim"
        },
        s = {
            name = "+split",
            v = "open vertical split",
            s = "open horizontal split",
            x = "swap splits"
        },
        r = {
            name = "+ranger",
            r = "Open ranger"
        },
        o = {
            name = "+createfiles",
            t = "touch",
            e = "touch and edit",
            d = "mkdir",
            m = "move",
            r = "remove"
        },
        w = {
            name = "+vimwiki",
            w = "open index.wiki"
        },
        n = {
            name = "+nabla",
            n = "hover formula",
            o = "enable virt lines",
            c = "disable virt lines",
        },
        p = "paste from clip",
        P = "Paste from clip",
    },
    [","] = {
        f = "harpoon item 1",
        d = "harpoon item 2",
        s = "harpoon item 3",
        a = "harpoon item 4",
        j = "harpoon item 5",
        k = "harpoon item 6",
        l = "harpoon item 7",
        q = "add file to harpoon"
    },
    g = {
        r = "goto references (trouble)",
        R = "goto references",
        i = "goto implementation",
        d = "goto definition",
        D = "goto declaration",
        h = "expand documentation",
        o = "expand diagnostic",
    },
}, { mode = "n" })

whichkey.register({
    ["<leader>"] = {
        d = {
            name = "+vimspector",
            i = "balloon eval"
        },
        m = {
            name = "+markdown",
            h = "header decrease",
            l = "header increase",
        },
    },
    d = "delete to other reg"
}, { mode = "v" })
