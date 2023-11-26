require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		"prettier",
		"shellcheck",
		"shfmt",
		"stylua",
		-- 'sqlfluff',
	},
	automatic_installation = true,
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"clangd",
		"eslint",
		-- "gopls",
		"html",
		"jdtls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		-- "solargraph",
		"sqlls",
		"terraformls",
		"tsserver",
	},
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.bashls.setup({
	capabilities = capabilities,
})
lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})
-- lspconfig.gopls.setup({
-- 	capabilities = capabilities,
-- })
lspconfig.html.setup({
	capabilities = capabilities,
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
lspconfig.pyright.setup({
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})
-- lspconfig.solargraph.setup({
-- 	capabilities = capabilities,
-- })
lspconfig.sqlls.setup({
	capabilities = capabilities,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
	settings = {
		preferences = {
			importModuleSpecifierPreference = "non-relative",
		},
	},
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})
lspconfig.terraformls.setup({
	capabilities = capabilities,
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.sqlfluff.with({
		--   extra_args = { "--dialect", "mysql" },
		-- }),
	},
})

-- https://github.com/neovim/nvim-lspconfig/issues/1792#issuecomment-1352782205
vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = buffer,
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
