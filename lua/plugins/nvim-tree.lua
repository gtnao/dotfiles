vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
require("nvim-tree").setup({
	hijack_cursor = true,
	view = {
		centralize_selection = true,
		width = 40,
	},
	renderer = {
		group_empty = true,
	},
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	filters = {
		git_ignored = false,
		custom = {
			"^\\.git$",
		},
	},
})
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>")
