return {
	"andymass/vim-matchup",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- Enable deferred highlighting for better performance
		vim.g.matchup_matchparen_deferred = 1

		-- Always highlight surrounding matches
		vim.g.matchup_matchparen_hi_surround_always = 1

		-- Show offscreen matches in a popup
		vim.g.matchup_matchparen_offscreen = { method = "popup" }

		-- Enable matchup for specific filetypes
		vim.g.matchup_matchparen_enabled = 1

		-- Disable matchparen (built-in) to avoid conflicts
		vim.g.loaded_matchparen = 1

		-- Additional JSX/TSX specific configuration
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "jsx", "tsx" },
			callback = function()
				-- Enable matchup for JSX tags
				vim.b.matchup_matchparen_enabled = 1

				-- Set timeout for better performance in large files
				vim.b.matchup_matchparen_timeout = 300
				vim.b.matchup_matchparen_insert_timeout = 60
			end,
		})

		-- Set up highlights after your theme loads
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				-- Only change text color, keep background transparent
				-- Using Catppuccin Mocha colors that will work well with your custom background
				vim.api.nvim_set_hl(0, "MatchParen", {
					fg = "#f38ba8", -- Catppuccin pink
					bold = true,
					bg = "NONE", -- Transparent background
				})
				vim.api.nvim_set_hl(0, "MatchParenCur", {
					fg = "#fab387", -- Catppuccin peach
					bold = true,
					bg = "NONE", -- Transparent background
				})
				vim.api.nvim_set_hl(0, "MatchWord", {
					fg = "#a6e3a1", -- Catppuccin green
					underline = false,
					bg = "NONE", -- Transparent background
				})
				vim.api.nvim_set_hl(0, "MatchWordCur", {
					fg = "#94e2d5", -- Catppuccin teal
					underline = false,
					bg = "NONE", -- Transparent background
				})
			end,
		})

		-- Also set the highlights immediately in case the colorscheme is already loaded
		vim.schedule(function()
			vim.api.nvim_set_hl(0, "MatchParen", {
				fg = "#f38ba8",
				bold = true,
				bg = "NONE",
			})
			vim.api.nvim_set_hl(0, "MatchParenCur", {
				fg = "#fab387",
				bold = true,
				bg = "NONE",
			})
			vim.api.nvim_set_hl(0, "MatchWord", {
				fg = "#a6e3a1",
				underline = false,
				bg = "NONE",
			})
			vim.api.nvim_set_hl(0, "MatchWordCur", {
				fg = "#94e2d5",
				underline = false,
				bg = "NONE",
			})
		end)
	end,

	-- Optional: Add keymaps for navigation
	keys = {
		{ "%", "<plug>(matchup-%)", desc = "Go to matching element" },
		{ "g%", "<plug>(matchup-g%)", desc = "Go backwards to matching element" },
		{ "[%", "<plug>(matchup-[%)", desc = "Go to previous matching element" },
		{ "]%", "<plug>(matchup-]%)", desc = "Go to next matching element" },
		{ "z%", "<plug>(matchup-z%)", desc = "Go inside matching element" },
	},
}
