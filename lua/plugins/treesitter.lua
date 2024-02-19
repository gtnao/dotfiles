return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/playground" },
			{ "yioneko/nvim-yati" },
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
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "m-demare/hlargs.nvim" },
		},
		event = { "BufRead", "BufNewfile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"dockerfile",
					"go",
					"html",
					"java",
					"json",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"python",
					"ruby",
					"rust",
					"toml",
					"tsx",
					"typescript",
					"yaml",
				},
				highlight = { enable = true },
				yati = {
					enable = true,
					default_lazy = true,
				},
				indent = {
					enable = false,
				},
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
						},
					},
				},
			})
			require("hlargs").setup()
		end,
	},
}
