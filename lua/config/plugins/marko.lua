return {
	"syahbes/marko.nvim",
	config = function()
		require("marko").setup({
			width = 100,
			height = 100,
			border = "rounded",
			title = " Marks ",
			virtual_text = {
				enabled = true,
				icon = "*",
				hl_group = "Comment",
				position = "eol",  -- Changed from "eol" to "overlay"
			},
		})
	end,
}
