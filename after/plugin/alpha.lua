local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Function to get current working directory (shortened with ~)
local function get_cwd()
	local cwd = vim.fn.getcwd()
	local home = vim.fn.expand("~")
	if cwd:find(home, 1, true) == 1 then
		cwd = "~" .. cwd:sub(#home + 1)
	end
	return cwd
end

-- Function to get git branch
local function get_git_branch()
	local handle = io.popen("git branch --show-current 2>/dev/null")
	if handle then
		local branch = handle:read("*a"):gsub("\n", "")
		handle:close()
		if branch and branch ~= "" then
			return branch
		end
	end
	return nil
end

-- Function to create terminal-style prompt
local function get_terminal_prompt()
	local cwd = get_cwd()
	local branch = get_git_branch()

	if branch then
		return cwd .. " (" .. branch .. ")$ "
	else
		return cwd .. "$ "
	end
end

-- Create custom footer with inline highlights
local function create_colored_footer()
	local cwd = get_cwd()
	local branch = get_git_branch()

	if branch then
		-- Create a string with virtual text for coloring
		local prompt_line = cwd .. " (" .. branch .. ")$ "

		-- We'll use the built-in footer but apply custom highlighting via autocmd
		return { prompt_line }
	else
		return { cwd .. "$ " }
	end
end

-- Set your custom header
-- small ASCII header – back-slashes doubled
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Set the terminal prompt as footer
dashboard.section.footer.val = create_colored_footer()
dashboard.section.footer.opts.hl = "AlphaPath"

-- Your custom buttons
dashboard.section.buttons.val = {
	dashboard.button("n", "  Open netrw", ":Explore<CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Set the color for the header
dashboard.section.header.opts.hl = "AlphaHeader"

-- Define the highlight groups
vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#87D88E", force = true })
vim.api.nvim_set_hl(0, "AlphaPath", { fg = "#87D88E", force = true }) -- Green for path and parentheses
vim.api.nvim_set_hl(0, "AlphaBranch", { fg = "#70A5F9", force = true }) -- Blue for branch name

-- Also set it with an autocmd to ensure it persists after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#87D88E", force = true })
		vim.api.nvim_set_hl(0, "AlphaPath", { fg = "#87D88E", force = true })
		vim.api.nvim_set_hl(0, "AlphaBranch", { fg = "#70A5F9", force = true })
	end,
})

-- Function to apply custom syntax highlighting to the footer
local function apply_footer_highlights()
	if vim.bo.filetype == "alpha" then
		local branch = get_git_branch()
		if branch then
			local cwd = get_cwd()
			local pattern = vim.fn.escape(cwd .. " (" .. branch .. ")$ ", "()[]{}.*+?^$\\")

			-- Clear any existing matches
			vim.fn.clearmatches()

			-- Highlight the branch name specifically
			local branch_pattern = "(" .. vim.fn.escape(branch, "()[]{}.*+?^$\\") .. ")"
			vim.fn.matchadd("AlphaBranch", branch_pattern)
		end
	end
end

-- Update the footer when changing directories
vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	callback = function()
		dashboard.section.footer.val = create_colored_footer()
		if vim.bo.filetype == "alpha" then
			vim.cmd("AlphaRedraw")
			vim.defer_fn(apply_footer_highlights, 10)
		end
	end,
})

-- Apply highlights when alpha loads
vim.api.nvim_create_autocmd("FileType", {
	pattern = "alpha",
	callback = function()
		vim.defer_fn(apply_footer_highlights, 10)
	end,
})

-- Configure vertical centering
dashboard.config.layout = {
	{ type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 3 },
	dashboard.section.footer,
}

-- Apply the configuration
alpha.setup(dashboard.config)
