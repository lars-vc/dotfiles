require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")

--==Keymaps==--
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

--==Own snippets==--
local snippet = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node
local cn = ls.choice_node
local fn = ls.function_node

-- All
-- ls.add_snippets("all", {
--     snippet(t("Lars Van Cauter"))
-- })

-- Latex
ls.add_snippets("tex", {
	snippet("init", {
		t({
			"\\documentclass{article}",
			"\\usepackage[utf8]{inputenc}",
			"\\usepackage{graphicx, caption, subcaption}",
			"\\graphicspath{images/}",
			"",
			"\\title{",
		}),
		i(1, "TITLE"),
		t({ "}", "\\author{Lars Van Cauter}", "\\date{" }),
		fn(function(args, snip, user_args)
			return os.date("%B %Y")
		end),
		t({ "}", "", "\\begin{document}", "\\maketitle", "", "" }),
		i(0),
		t({ "", "", "\\end{document}" }),
	}),
	snippet("image", {
		t({ "\\begin{figure}", "\t\\centering", "\t\\includegraphics[" }),
		cn(1, {
			sn(nil, {
				t("scale="),
				i(1, "0.5"),
			}),
			sn(nil, {
				t("width="),
				i(1, "0.95"),
				t("\\linewidth"),
			}),
		}),
		t("]"),
		t("{images/"),
		i(2, "FILE"),
		t({ "}", "\t\\captionof{figure}{" }),
		i(3, "CAPTION"),
		t({ "}", "\t\\label{fig:" }),
		i(4, "LABEL"),
		t({ "}", "\\end{figure}" }),
	}),
	snippet("use", {
		t("\\usepackage"),
		cn(1, { sn(nil, { t("["), i(1, "OPTS"), t("]") }), t("") }),
		t("{"),
		i(2, "PACKAGE"),
		t("}"),
	}),
	snippet("margins", {
		t({
			"\\usepackage{geometry}  % margins",
			"\\geometry{",
			"\ta4paper",
			"\ttotal={170mm,257mm}",
			"\tleft=20mm",
			"\ttop=20mm",
			"}",
		}),
	}),
})
