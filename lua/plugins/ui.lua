return {
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("bufferline").setup()
			vim.keymap.set("n", "<C-b>l", "<Cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<C-b>h", "<Cmd>BufferLineCyclePrev<CR>")
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("scrollbar").setup()
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = { "qf" },
	},
	{
		"levouh/tint.nvim",
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("tint").setup({
				tint = -60,
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"machakann/vim-highlightedyank",
		event = { "TextYankPost" },
		init = function()
			vim.g.highlightedyank_highlight_duration = 300
		end,
	},
	{
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("modes").setup()
		end,
	},
}
