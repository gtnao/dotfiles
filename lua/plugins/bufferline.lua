local bufferline = require("bufferline")
bufferline.setup({
	options = {
		numbers = "ordinal",
		truncate_names = false,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. sym .. "(" .. n .. ")"
			end
			return s
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		separator_style = "slant",
	},
})
vim.keymap.set("n", "<C-b>l", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-b>h", "<Cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-b>d", function()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end)
vim.keymap.set("n", "<C-b>b", "<Cmd>BufferLinePick<CR>")
vim.keymap.set("n", "<C-b>1", function()
	bufferline.go_to_buffer(1, true)
end)
vim.keymap.set("n", "<C-b>2", function()
	bufferline.go_to_buffer(2, true)
end)
vim.keymap.set("n", "<C-b>3", function()
	bufferline.go_to_buffer(3, true)
end)
vim.keymap.set("n", "<C-b>4", function()
	bufferline.go_to_buffer(4, true)
end)
vim.keymap.set("n", "<C-b>5", function()
	bufferline.go_to_buffer(5, true)
end)
vim.keymap.set("n", "<C-b>6", function()
	bufferline.go_to_buffer(6, true)
end)
vim.keymap.set("n", "<C-b>7", function()
	bufferline.go_to_buffer(7, true)
end)
vim.keymap.set("n", "<C-b>8", function()
	bufferline.go_to_buffer(8, true)
end)
vim.keymap.set("n", "<C-b>9", function()
	bufferline.go_to_buffer(9, true)
end)
