vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
-- normal mode, keep current diff and open another one
vim.keymap.set("n", "<leader>gv", ":<C-U>Gvdiffsplit!<CR>", { silent = true })
