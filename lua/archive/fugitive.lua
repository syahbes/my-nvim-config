return {
	"tpope/vim-fugitive",
	dependencies = {
		"tpope/vim-rhubarb", -- GitHub extension for fugitive (enables :GBrowse)
	},
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		-- normal mode, keep current diff and open another one
		vim.keymap.set("n", "<leader>gv", ":<C-U>Gvdiffsplit!<CR>", { silent = true })
	end,
}