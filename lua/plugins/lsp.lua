return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		event = { "BufRead", "BufNewfile" },
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
				-- TODO:
				buffer = buffer,
				callback = function()
					vim.lsp.buf.format({ async = false })
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
		"j-hui/fidget.nvim",
		event = { "LspAttach" },
		config = function()
			require("fidget").setup()
		end,
	},
}
