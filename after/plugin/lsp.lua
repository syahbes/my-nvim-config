---default config for luals
vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua', 'js', 'ts', 'jsx', 'tsx', 'json', 'jsonc'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

vim.lsp.enable('luals')

