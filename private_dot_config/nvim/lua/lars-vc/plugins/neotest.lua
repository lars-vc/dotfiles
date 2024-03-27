-- config
local neotest = require("neotest")
neotest.setup({
	adapters = { -- add test adapters here
		require("neotest-rust"), -- requires cargo nextest
		require("neotest-python"),
		require("neotest-go"),
		require("neotest-jest"), -- requires jest
	},
	benchmark = {
		enabled = true,
	},
	consumers = {},
	default_strategy = "integrated",
	diagnostic = {
		enabled = true,
	},
	discovery = {
		concurrent = 0,
		enabled = true,
	},
	quickfix = {
		enabled = false,
	},
	floating = {
		border = "rounded",
		max_height = 0.6,
		max_width = 0.6,
		options = {},
	},
	highlights = {
		adapter_name = "NeotestAdapterName",
		border = "NeotestBorder",
		dir = "NeotestDir",
		expand_marker = "NeotestExpandMarker",
		failed = "NeotestFailed",
		file = "NeotestFile",
		focused = "NeotestFocused",
		indent = "NeotestIndent",
		marked = "NeotestMarked",
		namespace = "NeotestNamespace",
		passed = "NeotestPassed",
		running = "NeotestRunning",
		select_win = "NeotestWinSelect",
		skipped = "NeotestSkipped",
		target = "NeotestTarget",
		test = "NeotestTest",
		unknown = "NeotestUnknown",
	},
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "",
		running = "",
		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
		skipped = "",
		unknown = "",
	},
	jump = {
		enabled = true,
	},
	log_level = 3,
	output = {
		enabled = true,
		open_on_run = "short",
	},
	projects = {},
	run = {
		enabled = true,
	},
	running = {
		concurrent = true,
	},
	status = {
		enabled = true,
		signs = true,
		virtual_text = false,
	},
	strategies = {
		integrated = {
			height = 40,
			width = 120,
		},
	},
	summary = {
		animated = true,
		enabled = true,
		expand_errors = true,
		follow = true,
		mappings = {
			attach = "a",
			clear_marked = "M",
			clear_target = "T",
			expand = { "<CR>", "<2-LeftMouse>" },
			expand_all = "e",
			jumpto = "i",
			mark = "m",
			next_failed = "J",
			output = "o",
			prev_failed = "K",
			run = "r",
			run_marked = "R",
			short = "O",
			stop = "u",
			target = "t",
		},
	},
})

-- keymaps
-- vim.keymap.set('n', '<leader>tt', neotest.run.run, { noremap = true })
-- vim.keymap.set('n', '<leader>ta', function()
--     neotest.run.run(vim.fn.expand("%"))
-- end, { noremap = true })
-- vim.keymap.set('n', '<leader>td', function()
--     neotest.run.run({ strategy = "dap" })
-- end, { noremap = true })
-- vim.keymap.set('n', '<leader>tx', neotest.run.stop, { noremap = true })
-- vim.keymap.set('n', '<leader>th', neotest.run.attach, { noremap = true })
--
-- vim.keymap.set('n', '<leader>too', function()
--     neotest.output.open({ enter = true })
-- end, { noremap = true })
-- vim.keymap.set('n', '<leader>tos', function()
--     neotest.output.open({ enter = true, short = true })
-- end, { noremap = true })
--
-- vim.keymap.set('n', '<leader>tj', function()
--     neotest.jump.next({ status = "failed" })
-- end, { noremap = true })
-- vim.keymap.set('n', '<leader>tk', function()
--     neotest.jump.prev({ status = "failed" })
-- end, { noremap = true })
--
-- vim.keymap.set('n', '<leader>tss', neotest.summary.toggle, { noremap = true })
-- vim.keymap.set('n', '<leader>tso', neotest.summary.open, { noremap = true })
-- vim.keymap.set('n', '<leader>tsc', neotest.summary.close, { noremap = true })
-- vim.keymap.set('n', '<leader>tst', neotest.summary.run_marked, { noremap = true })
