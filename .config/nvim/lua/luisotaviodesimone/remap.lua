vim.g.mapleader = " "

-- Goes back to the vim file explorer 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Makes it possible to change a line from place
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- Makes it possible to copy to system buffer easier
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
