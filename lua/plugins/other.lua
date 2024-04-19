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
		"stevearc/qf_helper.nvim",
		event = "VeryLazy",
		init = function()
			vim.keymap.set("n", "<Leader>tq", "<CMD>QFToggle!<CR>")
			vim.keymap.set("n", "<Leader>tl", "<CMD>LLToggle!<CR>")
			vim.keymap.set("n", "[q", "<CMD>QFPrev<CR>")
			vim.keymap.set("n", "]q", "<CMD>QFNext<CR>")
			vim.keymap.set("n", "[l", "<CMD>LLPrev<CR>")
			vim.keymap.set("n", "]l", "<CMD>LLNext<CR>")
		end,
		config = function()
			require("qf_helper").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		enabled = false,
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
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		ft = { "markdown" },
		enabled = function()
			return vim.fn.executable("deno")
		end,
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
}
