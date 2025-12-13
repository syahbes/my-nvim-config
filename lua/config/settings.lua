--vim.opt.guicursor = "" --cursor as block
--vim.cmd([[highlight Cursor guifg=NONE guibg=#F2CD32]]) -- yellow
vim.cmd([[highlight Cursor guifg=NONE guibg=#F4CD0D]]) -- yellow
--vim.cmd([[highlight Cursor guifg=NONE guibg=#A5E3A4]]) -- catppuccin green

vim.opt.guicursor = {
  --"n-v-c:block",  -- normal/visual: block
  "n-v-c:block-Cursor",  -- normal/visual: block with Cursor highlight
  "i-ci-ve:block-blinkwait247-blinkon247-blinkoff247", -- 247 theme!
  "r-cr:hor20",
  "o:hor50"
}
--vim.opt.cursorline = true -- highlight current line
vim.opt.nu = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

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

-- disable autoformat
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Configure diagnostic floating window
vim.diagnostic.config({
  float = {
    border = 'rounded',  -- or remove this line for no border
    source = 'always',   -- Show source of diagnostic
    header = '',         -- Remove header
    prefix = '',         -- Remove prefix
    max_width = 80,      -- Set maximum width (adjust the number as needed)
    format = function(diagnostic)
      return diagnostic.message
    end,
  },
})
