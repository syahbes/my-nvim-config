-- tailwind-tools.lua
return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- This will be merged with your existing lsp.lua config
  end,
  config = function()
    -- Setup Tailwind CSS Language Server
    vim.lsp.config("tailwindcss", {
      cmd = { "tailwindcss-language-server", "--stdio" },
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
      },
      root_markers = {
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "postcss.config.ts",
        "package.json",
      },
      settings = {
        tailwindCSS = {
          classAttributes = { "class", "className", "classList", "ngClass" },
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning",
          },
          experimental = {
            classRegex = {
              "tw`([^`]*)",
              'tw="([^"]*)',
              'tw={"([^"}]*)',
              "tw\\.\\w+`([^`]*)",
              "tw\\(.*?\\)`([^`]*)",
            },
          },
          validate = true,
        },
      },
    })

    -- Enable Tailwind CSS LSP
    vim.lsp.enable("tailwindcss")
  end,
}