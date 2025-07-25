local function undotree_toggle_focus()
    vim.cmd.UndotreeToggle()         -- toggle Undotree
    -- Wait a moment to ensure the window is created
    vim.defer_fn(function()
      -- Move to the Undotree window if it's open
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname:match("undotree") then
          vim.api.nvim_set_current_win(win)
          break
        end
      end
    end, 10)
  end
  
vim.keymap.set({"n", "i"}, "<C-z>", undotree_toggle_focus)
