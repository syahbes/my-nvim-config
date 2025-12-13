return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Prettier for web files
				null_ls.builtins.formatting.prettier.with({
					extra_args = {
						"--single-quote",
						"--tab-width=2",
						"--print-width=150",
						"--trailing-comma=es5",
						"--bracket-spacing",
						"--arrow-parens=always",
						"--end-of-line=auto",
					},
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
				
				-- StyLua for Lua files
				null_ls.builtins.formatting.stylua,
			},
		})

		-- Manual formatting keybinding
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		end, { desc = "Format current buffer" })
	end,
}
