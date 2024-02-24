return {
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				popupmenu = {
					backend = "cmp",
				},
			})
		end,
	},
}
