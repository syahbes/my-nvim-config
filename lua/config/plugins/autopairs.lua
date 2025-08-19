return {
	"windwp/nvim-autopairs", -- Automatic bracket/quote pairing
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
			},
			disable_filetype = { "TelescopePrompt" },
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		-- Integration with nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		local cmp_types = require("cmp.types")

		cmp.event:on("confirm_done", function(evt)
			local kind = evt.entry:get_kind()
			local ft = vim.bo.filetype

			-- Disable parens for components in JSX/TSX
			if
				(ft == "typescriptreact" or ft == "javascriptreact")
				and (
					kind == cmp_types.lsp.CompletionItemKind.Function
					or kind == cmp_types.lsp.CompletionItemKind.Method
				)
			then
				return
			end

			cmp_autopairs.on_confirm_done()(evt)
		end)
	end,
}
