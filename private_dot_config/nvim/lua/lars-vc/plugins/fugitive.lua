-- vim.cmd([[autocmd User FugitiveIndex nmap <buffer> <Tab> =]])
-- vim.cmd([[autocmd User FugitiveIndex nmap <buffer> <A-k> (]])
-- vim.cmd([[autocmd User FugitiveIndex nmap <buffer> <A-j> )]])
-- vim.api.nvim_create_autocmd("User", {
-- 	callback = function()
-- 		print("hello")
-- 		vim.keymap.set("n", "<A-j>", ")") --{ buffer = 0 })
-- 		-- vim.keymap.set("n", "<A-k>", "(", { buffer = 0 })
-- 		-- vim.keymap.set("n", "<Tab>", "=", { buffer = 0 })
-- 	end,
-- 	pattern = { "FugitiveIndex" },
-- })
vim.api.nvim_create_autocmd("User", {
	-- command = "nmap <buffer> <A-j> )",
	pattern = { "FugitiveIndex" },
	callback = function()
		vim.cmd([[nmap <buffer> <A-j> )]])
		vim.cmd([[nmap <buffer> <A-k> (]])
		vim.cmd([[nmap <buffer> <Tab> =]])
	end,
})
