return {
	{
		"rgroli/other.nvim",
		event = "VeryLazy",
		config = function()
			require("other-nvim").setup({
				mappings = {
					"rails",
					"golang",
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			vim.keymap.set({ "n" }, "<Leader><CR>", "<Cmd>WhichKey<CR>")
		end,
		opts = {
			window = {
				border = "single",
			},
		},
	},
	{
		"farmergreg/vim-lastplace",
		event = "BufRead",
	},
}
