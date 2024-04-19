vim.g.mapleader = " "
vim.keymap.set({ "n", "x" }, "<Leader>", "<Nop>")

vim.keymap.set({ "n", "x" }, ";", ":")
vim.keymap.set({ "n", "x" }, ":", ";")

vim.keymap.set("n", "<Leader>w", [[<Cmd>update<CR>]], { silent = true })
vim.keymap.set("n", "<Leader>q", [[<Cmd>quit<CR>]])

vim.keymap.set({ "n", "x" }, "<Leader>h", "^")
vim.keymap.set({ "n", "x" }, "<Leader>l", "$")

vim.keymap.set("x", "<Leader>rp", 'y:%s/<C-r><C-r>"//gc<Left><Left><Left>')
vim.keymap.set("n", "<Leader>rp", 'yiw:%s/<C-r><C-r>"//gc<Left><Left><Left>')

vim.keymap.set({ "n", "x" }, "j", "gj")
vim.keymap.set({ "n", "x" }, "k", "gk")
vim.keymap.set({ "n", "x" }, "gj", "j")
vim.keymap.set({ "n", "x" }, "gk", "k")

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

vim.keymap.set("n", "<ESC><ESC>", [[<Cmd>nohlsearch<CR>]])

vim.keymap.set("n", "<Left>", [[<Cmd>vertical resize -5<CR>]])
vim.keymap.set("n", "<Right>", [[<Cmd>vertical resize +5<CR>]])
vim.keymap.set("n", "<Up>", [[<Cmd>resize -5<CR>]])
vim.keymap.set("n", "<Down>", [[<Cmd>resize +5<CR>]])

vim.keymap.set("n", "ZZ", "<Nop>")
vim.keymap.set("n", "ZQ", "<Nop>")
