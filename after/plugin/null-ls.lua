-- null-ls.lua
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Prettier for formatting
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact", 
                "typescript",
                "typescriptreact",
                "css",
                "scss",
                "html",
                "json",
                "yaml",
                "markdown",
            },
        }),
    },
    -- Format on save
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})