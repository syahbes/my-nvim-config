vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "Y",  "yg$") --yank line
vim.keymap.set("n", "J",  "mzJ`z") --append the next row to end

-- cursor stay in middle when page down / up
vim.keymap.set("n", "<C-d>",  "<C-d>zz")
vim.keymap.set("n", "<C-u>",  "<C-u>zz")

-- cursor stay in middle when searching
vim.keymap.set("n", "n",  "nzzzv")
vim.keymap.set("n", "N",  "Nzzzv")

-- greatest remap ever (paste over and throw the selected to void)
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("v", "<leader>y", "\"+y") -- yank to clipboard

--not working good?
--vim.keymap.set("n", "<leader>d", "\"_d") -- delete to void
--vim.keymap.set("v", "<leader>d", "\"_d") -- delete to void

