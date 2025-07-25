vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua', 'js', 'ts'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

vim.lsp.enable('luals')

