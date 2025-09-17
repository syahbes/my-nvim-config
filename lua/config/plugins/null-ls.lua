return {
	"nvimtools/none-ls.nvim", -- For formatting with prettier
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Prettier for formatting
				null_ls.builtins.formatting.prettier.with({
					extra_args = {
						-- "--no-semi", -- semi: false
						"--single-quote", -- singleQuote: true
						"--tab-width=2", -- tabWidth: 2
						"--print-width=150", -- printWidth: 150
						"--trailing-comma=es5", -- trailingComma (last element)
						"--bracket-spacing", -- bracketSpacing: true
						"--arrow-parens=always", -- "avoid" const square = x => x * x;  OR  "always" const square = (x) => x * x;
						"--end-of-line=auto", -- endOfLine: "auto"
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
			},
			-- Manual formatting keybinding
			vim.keymap.set("n", "<leader>fm", function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end, { desc = "Format current buffer" }),
		})
	end,
}
