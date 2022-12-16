-- Dont convert every markdown file to a vimwiki format
vim.g["vimwiki_global_ext"] = 0
-- Turn on spelling only for that buffer
-- vim.cmd [[autocmd FileType vimwiki nmap <C-b> ysiw*]]
-- vim.cmd [[autocmd FileType vimwiki nmap <C-S-b> dsiw*]]
-- vim.cmd [[autocmd FileType vimwiki nmap <C-i> ysiw_]]
-- vim.cmd [[autocmd FileType vimwiki nmap <C-S-i> dsiw_]]
vim.api.nvim_create_autocmd("FileType", {
	-- command = "nmap <buffer> <A-j> )",
	pattern = { "vimwiki" },
	callback = function()
		vim.opt_local.spell = true
		-- vim.cmd([[setlocal dictionary+=/usr/share/dict/words]])
	end,
})
