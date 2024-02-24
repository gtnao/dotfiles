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
	{
		"sentriz/vim-print-debug",
		event = { "BufRead", "BufNewFile" },
		config = function()
			vim.keymap.set("n", "<leader>pd", "<Cmd>call print_debug#print_debug()<CR>")
			vim.api.nvim_set_var("print_debug_templates", {
				go = 'fmt.Printf("+++ {}\n")',
				python = 'print(f"+++ {}")',
				javascript = "console.log(`+++ {}`)",
				javascriptreact = "console.log(`+++ {}`)",
				typescript = "console.log(`+++ {}`)",
				typescriptreact = "console.log(`+++ {}`)",
				c = 'printf("+++ {}\n");',
				ruby = 'p "+++ {}"',
			})
		end,
	},
}
