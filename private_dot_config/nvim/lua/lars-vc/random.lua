-- prolog is a bitch
-- vim.cmd [[au FileType perl set filetype=prolog]]
vim.api.nvim_create_autocmd("FileType", {
	command = "set filetype=prolog",
	pattern = { "perl" },
})
-- highlight yanked region
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = (vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"),
			timeout = 125,
		})
	end,
})
-- hexokinase highlighters
vim.cmd([[ let g:Hexokinase_highlighters = ['virtual'] ]])
-- auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
-- skeleton files
local skelGrp = vim.api.nvim_create_augroup("SkeletonWrites", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
	command = "0r ~/.config/nvim/skeletons/skel.sh",
	pattern = { "*.sh" },
	group = skelGrp,
})
vim.api.nvim_create_autocmd("BufNewFile", {
	command = "0r ~/.config/nvim/skeletons/skel.tex",
	pattern = { "*.tex" },
	group = skelGrp,
})
-- vim.cmd [[autocmd BufNewFile *.sh 0r ~/.config/nvim/skeletons/skel.sh]]
-- vim.cmd [[autocmd BufNewFile *.tex 0r ~/.config/nvim/skeletons/skel.tex]]
-- disable some useless builtin plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"fzf",
	"tutor",
}
for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
