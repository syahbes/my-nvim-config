-- Diffview key remaps
vim.keymap.set("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { desc = "Open diff view" })
vim.keymap.set("n", "<leader>dvc", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })
vim.keymap.set("n", "<leader>dvt", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle diff view files" })
vim.keymap.set("n", "<leader>dvf", "<cmd>DiffviewFocusFiles<CR>", { desc = "Focus diff view files" })
