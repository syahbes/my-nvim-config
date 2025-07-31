-- from claude need to see it wont collide with other remaps
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- open suggestions menu
		["<Esc>"] = cmp.mapping.abort(), -- close suggestions menu
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- select 1st suggestion if no tab/scroll ?
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
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
