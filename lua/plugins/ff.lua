-- TODO: live grep
-- TODO: fzf

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Telescope",
		init = function()
			vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
			vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>")
			vim.keymap.set("n", "<leader>gs", "<Cmd>Telescope git_status<CR>")
		end,
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
						n = {
							["<esc>"] = actions.close,
							["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})
		end,
	},
}
