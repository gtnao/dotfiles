return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/playground" },
			{ "yioneko/nvim-yati" },
			{ "andymass/vim-matchup" },
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
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "David-Kunz/treesitter-unit" },
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
					"rbs",
					"ruby",
					"rust",
					"terraform",
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
				matchup = {
					enable = true,
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
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "f<CR>",
						node_decremental = "g<CR>",
					},
				},
			})
			require("hlargs").setup()
			-- vim.keymap.set({ "n", "x" }, "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
			-- vim.keymap.set({ "n", "x" }, "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
		end,
	},
	-- {
	-- 	"bennypowers/nvim-regexplainer",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	event = { "BufRead", "BufNewfile" },
	-- 	config = function()
	-- 		require("regexplainer").setup({
	-- 			auto = true,
	-- 		})
	-- 	end,
	-- },
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		cmd = "Neogen",
		config = true,
	},
}
