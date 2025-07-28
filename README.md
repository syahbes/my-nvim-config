<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# I need much shorter version,

include the plugins list with short desc,,
the setup (git clone https://github.com/syahbes/nvim-with-packer.git ~/.config/nvim)
and the Dependencies
[](https://github.com/nikelaz/neovim-config/tree/main#dependencies)
NPM Packages:
[](https://github.com/nikelaz/neovim-config/tree/main#npm-packages)
typescript
typescript-language-server
Install with package manager
[](https://github.com/nikelaz/neovim-config/tree/main#install-with-package-manager)
ripgrep
rust-analyzer
clangd
LUA Language Server
[](https://github.com/nikelaz/neovim-config/tree/main#lua-language-server)
[https://luals.github.io/\#install](https://luals.github.io/#install)

Here is a much shorter README.md draft for your repo including a brief plugin list, the setup command, and dependencies based on your request and the dependencies references from the linked repo:

# my nvim config

Neovim config using **lazy.nvim** plugin manager with essential plugins for a modern setup.

## Plugins

- **alpha-nvim**: Startup/dashboard screen
- **telescope.nvim**: Fuzzy finder and picker
- **catppuccin**: Soft and pleasant colorscheme
- **nvim-treesitter**: Syntax highlighting and code parsing
- **harpoon**: Quick file navigation and bookmarking
- **diffview.nvim**: Git diff viewer
- **undotree**: Undo history visualizer
- **vim-fugitive**: Git integration
- **vim-rhubarb**: GitHub extension for fugitive
- **nvim-cmp**: Completion engine with LSP, buffer, path, and Lua sources
- **none-ls.nvim**: Formatter integration (e.g., prettier)
- **nvim-autopairs**: Auto bracket/quote pairing


## Setup

Clone this repo to your Neovim config folder:

```bash
git clone https://github.com/syahbes/nvim-with-packer.git ~/.config/nvim
```

Open Neovim; lazy.nvim will bootstrap and install plugins automatically.

Run `:TSUpdate` to install Treesitter parsers.

## Dependencies

### NPM Packages

- typescript
- typescript-language-server

Install globally with:

```bash
npm install -g typescript typescript-language-server
```


### Package Manager Tools

- ripgrep
- rust-analyzer ?
- clangd ?


### Lua Language Server

Install from [https://luals.github.io/\#install](https://luals.github.io/#install)

