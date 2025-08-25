-- return {
-- 	"sindrets/diffview.nvim",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		require("diffview").setup({
-- 			use_icons = false, -- Disable icons to avoid nvim-web-devicons warning
-- 		})
-- 		-- Diffview key remaps
-- 		vim.keymap.set("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { desc = "Open diff view" })
-- 		vim.keymap.set("n", "<leader>dvc", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })
-- 	end,
-- }
return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("diffview").setup({
			use_icons = false, -- Disable icons to avoid nvim-web-devicons warning
		})

		-- Toggle Diffview open/close with <leader>dv
		vim.keymap.set("n", "<leader>dv", function()
			-- Get list of all open Diffview buffers
			local view = require("diffview.lib").get_current_view()
			if view then
				vim.cmd("DiffviewClose")
			else
				vim.cmd("DiffviewOpen")
			end
		end, { desc = "Toggle diff view" })
	end,
}
