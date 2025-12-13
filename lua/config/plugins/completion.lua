return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-buffer", -- Buffer completions
		"hrsh7th/cmp-path", -- Path completions
		"L3MON4D3/LuaSnip", -- Snippet engine
		"hrsh7th/cmp-nvim-lua", -- Lua completions
		"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load custom snippets
		require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/config/snippets"})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
      window = {
  documentation = cmp.config.window.bordered({
    border = 'rounded',
    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    col_offset = 1,  -- Add space to the left
    side_padding = 1, -- Add padding inside the window
  }),
},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- open suggestions menu
				["<Esc>"] = cmp.mapping.abort(), -- close suggestions menu
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- select 1st suggestion if no tab/scroll ?
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
