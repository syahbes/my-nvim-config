vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use ( 'nvim-treesitter/nvim-treesitter', { run = ":TSUpdate"})
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
    }
  use ( 'mbbill/undotree' )
  use ( 'tpope/vim-fugitive' )
  
  -- Completion plugins
  use 'hrsh7th/nvim-cmp'         -- The completion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'       -- Buffer completions
  use 'hrsh7th/cmp-path'         -- Path completions
  use 'L3MON4D3/LuaSnip'         -- Snippet engine
  use 'hrsh7th/cmp-nvim-lua'     -- Lua completions

end)
