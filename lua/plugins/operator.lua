return {
	{
		"mopp/vim-operator-convert-case",
		dependencies = {
			"kana/vim-operator-user",
		},
		keys = {
			{ "<Plug>(operator-convert-case-lower-camel)", mode = { "n", "x" } },
			{ "<Plug>(operator-convert-case-upper-camel)", mode = { "n", "x" } },
			{ "<Plug>(operator-convert-case-lower-snake)", mode = { "n", "x" } },
			{ "<Plug>(operator-convert-case-upper-snake)", mode = { "n", "x" } },
		},
		init = function()
			vim.keymap.set({ "n", "x" }, "<Leader>cl", "<Plug>(operator-convert-case-lower-camel)")
			vim.keymap.set({ "n", "x" }, "<Leader>cu", "<Plug>(operator-convert-case-upper-camel)")
			vim.keymap.set({ "n", "x" }, "<Leader>sl", "<Plug>(operator-convert-case-lower-snake)")
			vim.keymap.set({ "n", "x" }, "<Leader>su", "<Plug>(operator-convert-case-upper-snake)")
		end,
	},
	{
		"gbprod/substitute.nvim",
		event = { "TextYankPost" },
		config = function()
			local substitute = require("substitute")
			substitute.setup()
			vim.keymap.set({ "n", "x" }, "_", substitute.operator)
		end,
	},
}
