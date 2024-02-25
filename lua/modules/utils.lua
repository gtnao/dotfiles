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
	local ok, _ = pcall(function()
		vim.fn.system("ruby -v")
	end)
	return ok
end

M.is_go_installed = function()
	local ok, _ = pcall(function()
		vim.fn.system("go version")
	end)
	return ok
end

return M
