local M = {}

M.enable_quick_quit = function(pattern)
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = { pattern },
		callback = function()
			vim.keymap.set({ "n" }, "q", "<Cmd>quit<CR>", { buffer = true })
		end,
	})
end

return M
