--vim.opt.guicursor = "" --cursor as block
vim.opt.cursorline = true -- highlight current line
vim.opt.nu = true -- Show line numbers
--vim.opt.relativenumber = true -- Show relative line numbers

-- Indentation settings
vim.opt.tabstop = 2 -- Number of spaces that a tab character in the file counts for
vim.opt.softtabstop = 2 -- Number of spaces that a tab counts for while editing
vim.opt.expandtab = true -- Use spaces instead of tab characters
vim.opt.smartindent = true -- Smart autoindenting when starting a new line (useful for code)
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of auto-indent
--- end of indentation settings

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- really good one:
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--did not liked this
--vim.opt.colorcolumn = "80"

--vim.g.mapleader = " "

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Enable folding
vim.opt.foldmethod = 'manual'

-- Save and restore views automatically
local augroup = vim.api.nvim_create_augroup('AutoSaveFolds', { clear = true })
vim.api.nvim_create_autocmd('BufWinLeave', {
  group = augroup,
  pattern = '*',
  command = 'silent! mkview'
})
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = augroup,
  pattern = '*',
  command = 'silent! loadview'
})
