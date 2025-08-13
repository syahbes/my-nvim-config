return {
	"nvimtools/none-ls.nvim", -- For formatting with prettier
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Prettier for formatting
				null_ls.builtins.formatting.prettier.with({
					extra_args = {
						--"--no-semi", -- No semicolons
						--"--single-quote", -- Use single quotes
						"--tab-width=4", -- Use 4 spaces instead of 2
						"--trailing-comma=es5", -- Trailing commas where valid in ES5
						"--print-width=120", -- Longer line width to prevent aggressive wrapping
						"--bracket-spacing", -- Space between brackets
						"--arrow-parens=avoid", -- Avoid parentheses around single arrow function parameters
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

			-- Format on save
			--on_attach = function(client, bufnr)
			--	if client.supports_method("textDocument/formatting") then
			--		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			--		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			--		vim.api.nvim_create_autocmd("BufWritePre", {
			--			group = augroup,
			--			buffer = bufnr,
			--			callback = function()
			--				vim.lsp.buf.format({
			--					filter = function(client)
			--						return client.name == "null-ls"
			--					end,
			--					bufnr = bufnr,
			--				})
			--			end,
			--		})
			--	end
			--end,
		})
	end,
}
