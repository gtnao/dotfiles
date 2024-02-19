-- TODO: fzf

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "^1.0.0",
			},
		},
		cmd = "Telescope",
		init = function()
			vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
			vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>")
			vim.keymap.set("n", "<leader>gs", "<Cmd>Telescope git_status<CR>")
			vim.keymap.set(
				"n",
				"<leader>fg",
				"<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
			)
		end,
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("fzf")
			-- telescope.load_extension("live_grep_args")
			local actions = require("telescope.actions")
			local lga_actions = require("telescope-live-grep-args.actions")
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
				extensions = {
					live_grep_args = {
						auto_quoting = true,
						mappings = {
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
							},
						},
					},
				},
			})
		end,
	},
}
