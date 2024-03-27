local null_ls = require("null-ls")
local format = null_ls.builtins.formatting
local diagno = null_ls.builtins.diagnostics
local codeac = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- Formatting --
		format.prettier.with({ disabled_filetypes = { "markdown" }, extra_args = { "--tab-width", "4" } }),
		format.stylua,
		format.black,
		format.latexindent,
		format.beautysh,
		format.clang_format.with({ extra_args = { "-style=", '"{IndentWidth: 4}"' } }),
		format.rustfmt,
		-- format.markdownlint,

		-- Diagnostics -- (CHECK PACKER CONFIG LINTER FILETYPES)
		diagno.eslint,
		-- diagno.ltrs.with({extra_args= {  }}),
		diagno.flake8.with({ extra_args = { "--append-config", "~/.config/flake8" } }), -- idk if I like em
		diagno.ltrs.with({ disabled_filetypes = { "markdown" } }),
		-- diagno.luacheck, cant install this

		-- Completion --
		-- null_ls.builtins.completion.spell,

		-- Code actions --
		-- codeac.refactoring, -- very slow startup
		codeac.ltrs.with({ disabled_filetypes = { "markdown" } }),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you shoulduse vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local function table_to_string(tbl)
	local result = "{"
	for k, v in pairs(tbl) do
		-- Check the key type (ignore any numerical keys - assume its an array)
		if type(k) == "string" then
			result = result .. '["' .. k .. '"]' .. "="
		end

		-- Check the value type
		if type(v) == "table" then
			result = result .. table_to_string(v)
		elseif type(v) == "boolean" then
			result = result .. tostring(v)
		else
			result = result .. '"' .. v .. '"'
		end
		result = result .. ","
	end
	-- Remove leading commas from the result
	if result ~= "" then
		result = result:sub(1, result:len() - 1)
	end
	return result .. "}"
end

local h = require("null-ls.helpers")
local handle_ltrs_output = function(params)
	-- local f = io.open("~/luatex", "a")
	-- io.output(f)
	-- io.write(params)
	-- io.close()
	local json = params.output
	-- vim.pretty_print(params)
	-- vim.notify(table_to_string(params))
	-- vim.notify(tostring(params))
	if json and json.matches then
		local parser = h.diagnostics.from_json({
			severities = {
				ERROR = h.diagnostics.severities.error,
			},
		})

		local offenses = {}
		-- print(file.matches)
		vim.notify("WOOOOW")

		for _, m in ipairs(json.matches) do
			local tip = table.concat(
				vim.tbl_map(function(r)
					return "“" .. r.value .. "”"
				end, m.replacements),
				", "
			)

			table.insert(offenses, {
				message = m.message .. " Try: " .. tip,
				ruleId = m.rule.id,
				level = "ERROR",
				line = m.context.line_number,
				column = m.context.offset + 1,
				endLine = m.context.line_number,
				endColumn = m.context.offset + m.length + 1,
			})
		end

		return parser({ output = offenses })
	end

	return {}
end

local langtool = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "text" },
	-- null_ls.generator creates an async source
	-- that spawns the command with the given arguments and options

	generator = null_ls.generator({
		-- NOTE: This is commented out below
		command = "langtoolDummy",
		args = {},
		to_stdin = true,
		from_stderr = false,
		ignore_stderr = true,
		-- choose an output format (raw, json, or line)
		format = "json",
		check_exit_code = function(code, stderr)
			local success = code <= 1
			print("succ")

			if not success then
				-- can be noisy for things that run often (e.g. diagnostics), but can
				-- be useful for things that run on demand (e.g. formatting)
				print(stderr)
			end

			return success
		end,
		on_output = handle_ltrs_output,
		-- on_output = function(matchers)
		-- 	print("HELLLLOOO")
		-- 	vim.pretty_print(matchers)
		-- 	-- return function(line, params)
		-- 	-- 	for _, matcher in ipairs(matchers) do
		-- 	-- 		local diagnostic = from_pattern(matcher.pattern, matcher.groups, matcher.overrides)(line, params)
		-- 	-- 		if diagnostic then
		-- 	-- 			return diagnostic
		-- 	-- 		end
		-- 	-- 	end
		-- 	-- 	return nil
		-- 	-- end
		-- end,
		-- use helpers to parse the output from string matchers,
		-- or parse it manually with a function
		-- on_output = helpers.diagnostics.from_patterns({
		--     {
		--         pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
		--         groups = { "row", "col", "message" },
		--     },
		--     {
		--         pattern = [[:(%d+) [%w-/]+ (.*)]],
		--         groups = { "row", "message" },
		--     },
		-- }),
	}),
}

-- null_ls.register(langtool)
