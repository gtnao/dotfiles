return {
	{
		"phaazon/hop.nvim",
		branch = "v2",
		event = { "BufRead", "BufNewfile" },
		config = function()
			local hop = require("hop")
			hop.setup({ keys = "etovxqpdygfblzhckisuran" })
			vim.keymap.set("", "fw", function()
				hop.hint_words()
			end, { remap = true })
			vim.keymap.set("", "fl", function()
				hop.hint_lines()
			end, { remap = true })
		end,
	},
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
