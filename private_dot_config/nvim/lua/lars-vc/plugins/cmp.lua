local lspkind = require("lspkind")
lspkind.init()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- Set up nvim-cmp.
local cmp = require("cmp")

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- add brackets after function complete
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local small_mapping = {
	["<S-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.confirm({ select = true }) --, behavior = cmp.ConfirmBehavior.Replace })
		else
			fallback()
		end
	end, { "i", "c" }),
	["<C-j>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end, { "i", "c" }),
	["<C-k>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end, { "i", "c" }),
}

local small_format = {
	format = lspkind.cmp_format({
		mode = "symbol_text",
		menu = {
			buffer = "[Buf]",
			nvim_lsp = "[LSP]",
			path = "[Path]",
			luasnip = "[LuaSnip]",
			nvim_lua = "[Lua]",
			-- Copilot = "[]",
		},
		symbol_map = { Copilot = "" },
	}),
}

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,

			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) --{ select = false, behavior = cmp.ConfirmBehavior.Replace })
			else
				fallback()
			end
		end),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "copilot" },
		-- { name = "neorg" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "buffer", keyword_length = 4 },
	}),
	formatting = small_format,
	experimental = {
		ghost_text = true,
	},
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     mapping = cmp.mapping.preset.insert({
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-u>'] = cmp.mapping.scroll_docs(4),
--         ['<S-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.confirm({ select = true })
--             else
--                 fallback()
--             end
--         end),
--         ['<C-j>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             else
--                 fallback()
--             end
--         end),
--         ['<C-k>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             else
--                 fallback()
--             end
--         end),
--     }),
--     sources = cmp.config.sources({
--         { name = 'git' }, -- You can specify the `cmp_git` source if you have installed it.
--     }, {
--         { name = 'buffer' },
--     }),
--     formatting = small_format,
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = small_mapping,
	sources = {
		{ name = "buffer" },
	},
	formatting = small_format,
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = small_mapping,
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	formatting = small_format,
})
