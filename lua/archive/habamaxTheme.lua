-- Theme configuration for lazy.nvim
return {
  -- This creates a "virtual" plugin that just runs configuration
  "theme-config",
  name = "custom-theme",
  dir = vim.fn.stdpath("config"), -- Points to your config directory
  priority = 1000, -- Load early to set colorscheme
  config = function()
    -- Set the colorscheme to habamax
    vim.cmd('colorscheme habamax')
    
    -- Enable current line highlighting
    vim.opt.cursorline = true
    
    -- Custom highlight groups
    local function set_highlights()
      -- Set current line background to black
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#000000' })
      
      -- Try multiple highlight groups that could control the file path area
      local dark_bg = '#1c1c1c'
      local light_fg = '#ffffff'
      local dim_fg = '#808080'
      
      -- Winbar related
      vim.api.nvim_set_hl(0, 'WinBar', { bg = dark_bg, fg = light_fg })
      vim.api.nvim_set_hl(0, 'WinBarNC', { bg = dark_bg, fg = dim_fg })
      
      -- Tabline related (might be what's showing)
      vim.api.nvim_set_hl(0, 'TabLine', { bg = dark_bg, fg = light_fg })
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = dark_bg })
      vim.api.nvim_set_hl(0, 'TabLineSel', { bg = '#2c2c2c', fg = light_fg })
      
      -- Statusline related
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = dark_bg, fg = light_fg })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = dark_bg, fg = dim_fg })
      
      -- Other possible groups
      vim.api.nvim_set_hl(0, 'WinSeparator', { bg = dark_bg, fg = '#404040' })
      vim.api.nvim_set_hl(0, 'VertSplit', { bg = dark_bg, fg = '#404040' })
      
      -- Floating window related
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = dark_bg, fg = dim_fg })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = dark_bg, fg = light_fg })
      
      -- Title related
      vim.api.nvim_set_hl(0, 'Title', { bg = dark_bg, fg = light_fg, bold = true })
    end
    
    -- Apply highlights immediately
    set_highlights()
    
    -- Reapply highlights after colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = set_highlights,
      desc = 'Reapply custom highlights after colorscheme change'
    })
    
    -- Enable winbar to show file path
    vim.opt.winbar = '%f'  -- Shows relative file path
  end
}
