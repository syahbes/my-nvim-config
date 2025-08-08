return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd([[colorscheme catppuccin-mocha]])
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "#120217" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120217" }) -- non-active window
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6e84" })
			end,
		})
		-- Also set immediately
		vim.api.nvim_set_hl(0, "Normal", { bg = "#120217" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120217" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6e84" })
	end,
}
