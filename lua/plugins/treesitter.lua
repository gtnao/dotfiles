return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				ft = { "typescriptreact" },
				config = function()
					require("nvim-ts-autotag").setup()
				end,
			},
			{
				"numToStr/Comment.nvim",
				dependencies = {
					"JoosepAlviste/nvim-ts-context-commentstring",
				},
				config = function()
					require("ts_context_commentstring").setup({
						enable_autocmd = false,
					})
					require("Comment").setup({
						pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
					})
				end,
			},
		},
		event = { "BufRead", "BufNewfile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"tsx",
					"typescript",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
