local diagnostic_icons = require("modules.font").diagnostic_icons

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
		icons = {
			hint = diagnostic_icons.hint,
			info = diagnostic_icons.info,
			warning = diagnostic_icons.warn,
			error = diagnostic_icons.error,
		},
	},
	filters = {
		git_ignored = false,
		custom = {
			"^\\.git",
		},
	},
})
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>")
