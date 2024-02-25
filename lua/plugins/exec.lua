return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = "ToggleTerm",
		config = function()
			require("toggleterm").setup()
		end,
	},
}
