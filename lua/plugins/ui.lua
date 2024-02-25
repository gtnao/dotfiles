local enable_quick_quit = require("modules.utils").enable_quick_quit
local diagnostic_icons = require("modules.font").diagnostic_icons

return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "VimEnter" },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.section.header.val = {
				[[                                                                       ]],
				[[  ██████   █████                   █████   █████  ███                  ]],
				[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
				[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
				[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
				[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
				[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
				[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
				[[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
				[[                                                                       ]],
			}
			require("alpha").setup(startify.config)
		end,
	},
	{
		"rcarriga/nvim-notify",
		event = { "VeryLazy" },
		config = function()
			require("notify").setup()
			vim.notify = require("notify")
			enable_quick_quit("notify")
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = { "VeryLazy" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "VimEnter" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "VimEnter" },
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					truncate_names = false,
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(_, _, diagnostics_dict, _)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and diagnostic_icons.error
								or (e == "warning" and diagnostic_icons.warn or diagnostic_icons.info)
							s = s .. sym .. "(" .. n .. ")"
						end
						return s
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "FileExplorer",
							text_align = "center",
							separator = true,
						},
					},
					separator_style = "slant",
				},
			})
			vim.keymap.set("n", "<C-b>l", "<Cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<C-b>h", "<Cmd>BufferLineCyclePrev<CR>")
		end,
	},
	{
		"GustavoKatel/sidebar.nvim",
		cmd = { "SidebarNvimToggle" },
		init = function()
			vim.keymap.set("n", "<leader>ss", "<Cmd>SidebarNvimToggle<CR>")
		end,
		config = function()
			require("sidebar-nvim").setup()
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
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("ibl").setup()
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
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinNew" },
	},
	{
		"vuki656/package-info.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		ft = { "json" },
		config = function()
			require("package-info").setup()
		end,
	},
	{
		"MTDL9/vim-log-highlighting",
		ft = { "log" },
	},
}
