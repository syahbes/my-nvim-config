vim.cmd.colorscheme("catppuccin")

-- Override background color
vim.api.nvim_set_hl(0, "Normal", { bg = "#171422" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#171422" })  -- non-active window

-- Override line number color
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6e84" })

