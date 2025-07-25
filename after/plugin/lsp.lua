-- lsp.lua
-- Setup TypeScript Language Server for JS/TS files
vim.lsp.config('ts_ls', {
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  root_markers = {'tsconfig.json', 'jsconfig.json', 'package.json', '.git'},
})

-- Setup Lua Language Server for Lua files only
vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

-- Setup CSS Language Server for CSS/SCSS/LESS files
vim.lsp.config('cssls', {
  cmd = {'vscode-css-language-server', '--stdio'},
  filetypes = {'css', 'scss', 'less'},
  root_markers = {'package.json', '.git'},
})

-- Enable all servers
vim.lsp.enable('ts_ls')
vim.lsp.enable('luals')
vim.lsp.enable('cssls')

-- Set up keymaps
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

-- Diagnostic keymaps (for showing errors/warnings)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
                     { desc = "Show line diagnostic" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.setloclist,
                     { desc = "Diagnostics to loclist" })
