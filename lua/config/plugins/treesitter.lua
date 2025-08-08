return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = {
				"javascript",
				"typescript",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			highlight = {
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
--claude :
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		require("nvim-treesitter.configs").setup({
-- 			ensure_installed = {
-- 				"javascript",
-- 				"typescript",
-- 				"c",
-- 				"lua",
-- 				"vim",
-- 				"vimdoc",
-- 				"query",
-- 				"markdown",
-- 				"markdown_inline",
-- 			},
-- 			sync_install = false,
-- 			auto_install = false,
-- 			highlight = {
-- 				enable = true,
-- 				additional_vim_regex_highlighting = false,
-- 			},
-- 			-- Optional: Add incremental selection
-- 			incremental_selection = {
-- 				enable = true,
-- 				keymaps = {
-- 					init_selection = "gnn",
-- 					node_incremental = "grn",
-- 					scope_incremental = "grc",
-- 					node_decremental = "grm",
-- 				},
-- 			},
-- 			-- Optional: Add indentation based on treesitter
-- 			indent = {
-- 				enable = true,
-- 			},
-- 		})
-- 	end,
-- }
