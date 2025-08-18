return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")		
		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						width = 0.99,  -- Almost full width
						height = 0.99, -- Almost full height
						preview_cutoff = 0,
						prompt_position = "bottom",
						preview_height = 0.4,  -- Preview takes 40% of height, results get 60%
					},
				},
			},
		})

		-- default
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		-- end of default

		-- the primeagen
		--vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
		--vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function() --  string in status line
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		-- Override LSP references to use telescope
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope LSP references" })

		-- recently used files
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recently used files" })
	end,
}