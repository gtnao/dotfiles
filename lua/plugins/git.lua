return {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
		},
		config = true,
	},
	{
		"akinsho/git-conflict.nvim",
		event = "VeryLazy",
		version = "*",
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufRead" },
		config = function()
			require("gitsigns").setup()
		end,
	},
}
