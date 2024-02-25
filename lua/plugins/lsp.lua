local diagnostic_icons = require("modules.font").diagnostic_icons
local is_ruby_installed = require("modules.utils").is_ruby_installed
local is_go_installed = require("modules.utils").is_go_installed

return {
	{
		"neovim/nvim-lspconfig",
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

			local function detach_lsp_from_current_buf()
				local bufnr = vim.api.nvim_get_current_buf()
				local clients = vim.lsp.buf_get_clients(bufnr)
				for _, client in pairs(clients) do
					vim.lsp.buf_detach_client(bufnr, client.id)
				end
			end
			vim.api.nvim_create_user_command("LSPDetach", detach_lsp_from_current_buf, {})
		end,
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "df", vim.lsp.buf.definition, opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		event = { "BufRead", "BufNewfile" },
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup({
				ensure_installed = {
					"bashls",
					"cssls",
					"clangd",
					"eslint",
					is_go_installed() and "gopls" or nil,
					"html",
					"jdtls",
					"lua_ls",
					"mdx_analyzer",
					"pyright",
					"rust_analyzer",
					is_ruby_installed() and "solargraph" or nil,
					"terraformls",
					"tsserver",
				},
				automatic_installation = true,
			})

			local opts = {
				capabilities = default_capabilities,
				on_attach = function(client, bufnr)
					if client.name == "lua_ls" then
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					elseif client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					else
						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_create_autocmd("BufWritePre", {
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format({ async = false })
								end,
							})
						end
					end
				end,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			}

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup(opts)
				end,
				["jdtls"] = function()
					lspconfig.jdtls.setup({
						capabilities = default_capabilities,
						on_attach = function(client, _)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
						cmd = { "jdtls" },
					})
				end,
				["tsserver"] = function()
					lspconfig.tsserver.setup({
						capabilities = default_capabilities,
						init_options = {
							preferences = {
								importModuleSpecifierPreference = "non-relative",
							},
						},
						on_attach = function(client, _)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
					})
				end,
			})
		end,
	},
	{
		"jayp0521/mason-null-ls.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
		event = { "BufRead", "BufNewfile" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"google_java_format",
					"prettier",
					"shellcheck",
					"shfmt",
					"stylua",
				},
				automatic_installation = true,
			})

			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.google_java_format.with({ extra_args = { "--aosp" } }),
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.code_actions.shellcheck,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.stylua,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = { "LspAttach" },
		config = function()
			require("lspsaga").setup({
				scroll_preview = {
					scroll_down = "<C-d>",
					scroll_up = "<C-u>",
				},
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
			vim.keymap.set("n", "<Leader>rf", "<Cmd>Lspsaga finder<CR>")
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
	{ "folke/neodev.nvim" },
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
