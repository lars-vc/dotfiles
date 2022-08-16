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
        border = "double"
    }

}
whichkey.register ({
    ["<leader>"] = {
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
        c = {
            name = "+coc",
            a = "code actions",
            l = "codelens actions",
            d = "goto definition",
            y = "goto type-definition",
            i = "goto implementation",
            f = "quick fix",
            r = "show references",
            n = "rename var",
            t = "show documentation"
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
            g = "GrammerousCheck",
            r = "GrammerousReset"
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
        b = {
            name = "+tagbar",
            t = "toggle tagbar",
            o = "open tagbar",
            c = "close tagbar"
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
        }
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
    }
}, {mode = "n"})

whichkey.register({
    ["<leader>"] = {
        c = {
            name = "+coc",
            a = "code actions"
        },
        d = {
            name = "+vimspector",
            i = "balloon eval"
        },
        m = {
            name = "+markdown",
            h = "header decrease",
            l = "header increase",
        },
        r = {
            name = "+sniprun",
            r = "run block"
        }
    }
}, {mode = "v"})
