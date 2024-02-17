return {
	{
		"farmergreg/vim-lastplace",
		event = "BufRead",
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("hlslens").setup()
			vim.keymap.set("n", "<Leader>/", [[*<Cmd>lua require('hlslens').start()<CR>]])
		end,
	},
}
