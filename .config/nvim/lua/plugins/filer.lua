return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "NvimTreeToggle",
		init = function()
			vim.api.nvim_set_var("loaded_netrw", 1)
			vim.api.nvim_set_var("loaded_netrwPlugin", 1)
			vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>")
		end,
		config = function()
			require("nvim-tree").setup({
				hijack_cursor = true,
				renderer = {
					group_empty = true,
				},
				update_focused_file = {
					enable = true,
				},
				filters = {
					git_ignored = false,
					custom = {
						"^\\.git$",
					},
				},
				view = {
					adaptive_size = true,
				},
			})
		end,
	},
}
