local lspsaga = require("lspsaga")
lspsaga.setup({
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
vim.keymap.set("n", "<Leader>df", "<Cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<Leader>rf", "<Cmd>Lspsaga finder<CR>")
vim.keymap.set("n", "<Leader>K", "<Cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<Leader>ca", "<Cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "<Leader>rn", "<Cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "<Leader>dn", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "<Leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
