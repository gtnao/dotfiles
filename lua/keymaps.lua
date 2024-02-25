vim.g.mapleader = " "
vim.keymap.set({ "n", "x" }, "<Leader>", "<Nop>")

vim.keymap.set({ "n", "x" }, ";", ":")
vim.keymap.set({ "n", "x" }, ":", ";")

vim.keymap.set("n", "<Leader>w", [[<Cmd>update<CR>]], { silent = true })
vim.keymap.set("n", "<Leader>q", [[<Cmd>quit<CR>]])

vim.keymap.set("n", "<Leader>h", "^")
vim.keymap.set("n", "<Leader>l", "$")

vim.keymap.set({ "n", "x" }, "<", "<<")
vim.keymap.set({ "n", "x" }, ">", ">>")

vim.keymap.set("n", "<ESC><ESC>", [[<Cmd>nohlsearch<CR>]])

vim.keymap.set("n", "<Left>", [[<Cmd>vertical resize -5<CR>]])
vim.keymap.set("n", "<Right>", [[<Cmd>vertical resize +5<CR>]])
vim.keymap.set("n", "<Up>", [[<Cmd>resize -5<CR>]])
vim.keymap.set("n", "<Down>", [[<Cmd>resize +5<CR>]])
