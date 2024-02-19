local diagnostic_icons = require("modules.font").diagnostic_icons

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		event = { "BufRead", "BufNewfile" },
		init = function()
			vim.diagnostic.config({
				virtual_text = false,
			})
			local signs = {
				Error = diagnostic_icons.error,
				Warn = diagnostic_icons.warn,
				Info = diagnostic_icons.info,
				Hint = diagnostic_icons.hint,
			}
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
		config = function()
			local lspconfig = require("lspconfig")
			local null_ls = require("null-ls")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				cmd = {
					"jdtls",
				},
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.code_actions.shellcheck,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.stylua,
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("FormatOnSave", {}),
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "df", vim.lsp.buf.definition, opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "williamboman/mason-lspconfig" },
			{ "jayp0521/mason-null-ls.nvim" },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"jdtls",
					"lua_ls",
					"rust_analyzer",
					"solargraph",
					"terraformls",
					"tsserver",
				},
				automatic_installation = true,
			})
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettier",
					"shellcheck",
					"shfmt",
					"stylua",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = { "LspAttach" },
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
				beacon = {
					enable = false,
				},
				symbol_in_winbar = {
					enable = false,
				},
			})
			vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
			vim.keymap.set("n", "<Leader>ca", "<Cmd>Lspsaga code_action<CR>")
			vim.keymap.set("n", "<Leader>rn", "<Cmd>Lspsaga rename<CR>")
			vim.keymap.set("n", "<Leader>dn", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
			vim.keymap.set("n", "<Leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = { "LspAttach" },
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "TroubleToggle" },
		init = function()
			vim.keymap.set("n", "<leader>t", "<Cmd>TroubleToggle<CR>")
		end,
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "AerialToggle" },
		init = function()
			vim.keymap.set("n", "<leader>a", "<Cmd>AerialToggle<CR>")
		end,
		config = function()
			require("aerial").setup()
		end,
	},
}
