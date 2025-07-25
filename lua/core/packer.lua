vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

 use { "catppuccin/nvim", as = "catppuccin" }

  use ( 'nvim-treesitter/nvim-treesitter', { run = ":TSUpdate"})
  use "nvim-lua/plenary.nvim" -- for harpoon
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
    }
  use ( 'mbbill/undotree' )
  use ( 'tpope/vim-fugitive' )
  
  -- from claude 
  -- Completion plugins
  use 'hrsh7th/nvim-cmp'         -- The completion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'       -- Buffer completions
  use 'hrsh7th/cmp-path'         -- Path completions
  use 'L3MON4D3/LuaSnip'         -- Snippet engine
  use 'hrsh7th/cmp-nvim-lua'     -- Lua completions

  -- Formatting
  use 'nvimtools/none-ls.nvim'   -- For formatting with prettier

  -- Auto pairs
  use 'windwp/nvim-autopairs'    -- Automatic bracket/quote pairing

end)