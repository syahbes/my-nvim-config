-- comment.lua
return {
    "numToStr/Comment.nvim",
    name = "comment",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    config = function()
        -- Setup ts-context-commentstring first
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })

        -- Setup Comment.nvim with JSX support
        require("Comment").setup({
            -- Add support for context-aware commenting (JSX, Vue, etc.)
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })

        -- Set up keymaps
        vim.keymap.set("n", "<C-_>", "gcc", { desc = "Toggle comment line", remap = true })
        vim.keymap.set("v", "<C-_>", "gc", { desc = "Toggle comment selection", remap = true })
        vim.keymap.set("i", "<C-_>", "<C-o>gcc", { desc = "Toggle comment line (insert mode)", remap = true })
    end,
}