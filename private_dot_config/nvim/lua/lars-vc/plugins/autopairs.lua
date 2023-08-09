local autopairs = require("nvim-autopairs")

autopairs.setup({
	enable_check_bracket_line = true,
	ignored_next_char = "[%w]", -- will ignore alphanumeric and `.` symbol
	fast_wrap = {
		map = "<M-;>",
		keys = "jklfdsaqwertyuiop",
	},
	-- map_bs = false,
})

local escape_code = vim.api.nvim_replace_termcodes("<Esc>", false, false, true)
local backspace_code = vim.api.nvim_replace_termcodes("<BS>", false, false, true)
local function viml_backspace()
	-- expression from a deleted reddit user
	vim.cmd([[
        let g:exprvalue =
        \ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
        \ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
        \ !search('\S','nbW',line('.')) ? (col('.') != 1 ? "\<C-U>" : "") .
        \ "\<bs>" . (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : "\<bs>"
        ]])
	return vim.g.exprvalue
end

local function backspace2()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local before_cursor_is_whitespace = vim.api.nvim_get_current_line():sub(0, col):match("^%s*$")
	if not before_cursor_is_whitespace then
		return require("nvim-autopairs").autopairs_bs()
	end
	if line == 1 then
		return viml_backspace()
	end
	local correct_indent = require("nvim-treesitter.indent").get_indent(line)
	local current_indent = vim.fn.indent(line)
	local previous_line_is_whitespace = vim.api.nvim_buf_get_lines(0, line - 2, line - 1, false)[1]:match("^%s*$")
	if current_indent == correct_indent then
		if previous_line_is_whitespace then
			return viml_backspace()
		end
		return backspace_code
	elseif current_indent > correct_indent then
		return escape_code .. "==0wi"
	end
	return backspace_code
end

local function backspace()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local charstrip = line:sub(1, col)
	-- TODO: check if there is space behind the cursor
	if charstrip:match("^%s*$") then
		-- expression from a deleted reddit user
		-- vim.cmd([[
		--           let g:exprvalue =
		--           \ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
		--           \ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
		--           \ !search('\S','nbW',line('.')) ? (col('.') != 1 ? "\<C-U>" : "") .
		--           \ "\<bs>" . (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : "\<bs>"
		--       ]])
		-- vim.cmd([[ let g:exprvalue = d0kgJ]])
		-- vim.cmd([[stopinsert]])
		-- vim.cmd([[echo "test"]])
		-- vim.cmd([[execute "normal l"]])
		-- -- vim.cmd([[normal d0kgJ]])
		-- vim.cmd([[startinsert]])
		-- return vim.g.exprvalue
		local formatkey = vim.api.nvim_replace_termcodes("<C-o>==<C-o>^<C-o>1gs", true, false, true)
		vim.api.nvim_feedkeys(formatkey, "n", false)
		-- vim.api.nvim_input(formatkey)
		local formatline = vim.api.nvim_get_current_line()
		vim.pretty_print({ formatline, line })
		if formatline == line then
			local key = vim.api.nvim_replace_termcodes("<C-o>d0<C-o>k<C-o>gJ", true, false, true)
			vim.api.nvim_feedkeys(key, "n", false)
		end
	else
		return autopairs.autopairs_bs()
	end
end

-- vim.keymap.set("i", "<BS>", backspace2, { expr = true, noremap = true, replace_keycodes = false })
