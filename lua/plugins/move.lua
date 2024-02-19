return {
	{
		"haya14busa/vim-edgemotion",
		keys = {
			{ "<Leader>j", mode = { "n", "x" } },
			{ "<Leader>k", mode = { "n", "x" } },
		},
		config = function()
			vim.keymap.set({ "n", "x" }, "<Leader>j", "<Plug>(edgemotion-j)")
			vim.keymap.set({ "n", "x" }, "<Leader>k", "<Plug>(edgemotion-k)")
		end,
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
