return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"monaqa/dial.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			local dial_map = require("dial.map")
			vim.keymap.set("n", "+", dial_map.inc_normal())
			vim.keymap.set("n", "-", dial_map.dec_normal())
			vim.keymap.set("x", "+", dial_map.inc_visual())
			vim.keymap.set("x", "-", dial_map.dec_visual())
		end,
	},
}
