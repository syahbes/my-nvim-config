return {
	"mbbill/undotree",
	config = function()
		local function undotree_toggle_focus()
			vim.cmd.UndotreeToggle() -- toggle Undotree
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

		-- Function to handle undo tree toggle from insert mode
		local function insert_mode_undotree_toggle()
			-- Switch to normal mode first
			vim.cmd("stopinsert")
			-- Use vim.schedule to ensure mode change completes before toggling
			vim.schedule(function()
				undotree_toggle_focus()
			end)
		end

		-- Normal mode mapping - direct toggle
		vim.keymap.set("n", "<C-z>", undotree_toggle_focus, { desc = "Toggle undo tree" })

		-- Insert mode mapping - exit insert mode first, then toggle
		vim.keymap.set("i", "<C-z>", insert_mode_undotree_toggle, { desc = "Exit insert and toggle undo tree" })
	end,
}
