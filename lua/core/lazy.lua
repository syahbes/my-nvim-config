-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	-- Welcome screen
	{ "goolord/alpha-nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Colorscheme
	{ "catppuccin/nvim", name = "catppuccin" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Git diff viewer
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Icons (for Telescope and Git diff viewer)
--	{ "nvim-tree/nvim-web-devicons" },

	-- Utilities
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb", -- GitHub extension for fugitive (enables :GBrowse)

	-- Completion plugins
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"L3MON4D3/LuaSnip", -- Snippet engine
			"hrsh7th/cmp-nvim-lua", -- Lua completions
		},
	},

	-- Formatting
	"nvimtools/none-ls.nvim", -- For formatting with prettier

	--'rafamadriz/friendly-snippets', -- snippets(not worked need to figure our why)

	-- Auto pairs
	"windwp/nvim-autopairs", -- Automatic bracket/quote pairing
}, {
	rocks = {
		enabled = false, -- This will silence all the luarocks warnings
	},
})
