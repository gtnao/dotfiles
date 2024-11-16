local M = {}

M.enable_quick_quit = function(pattern)
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = { pattern },
		callback = function()
			vim.keymap.set({ "n" }, "q", "<Cmd>quit<CR>", { buffer = true })
		end,
	})
end

M.is_ruby_installed = function()
	vim.fn.system("ruby -v")
	local shell_error = vim.v.shell_error
	return shell_error == 0
end

M.is_go_installed = function()
	vim.fn.system("go version")
	local shell_error = vim.v.shell_error
	return shell_error == 0
end

return M
