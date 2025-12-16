#
Deprecated go to 
https://github.com/syahbes/nvim-config-minimal



# Neovim Configuration

## Directory Structure

```
├── init.lua            # Root main entry point
├── lazy-lock.json      # Lazy.nvim lock file
├── lua
│   └── config
│       ├── init.lua                    # Main entry point
│       ├── lazy_plugin_manager.lua     # Plugin manager setup
│       ├── remap.lua                   # Custom key mappings
│       ├── settings.lua                # Core Neovim settings
│       └── plugins
│           ├── alpha.lua               # Welcome screen
│           ├── autopairs.lua           # Auto bracket closing
│           ├── catppuccin.lua          # Color scheme
│           ├── completion.lua          # Configures nvim-cmp for autocompletion
│           ├── fugitive.lua            # Git wrapper
│           ├── harpoon.lua             # File navigator
│           ├── lsp.lua                 # Configures LSP servers (TypeScript, Lua, CSS)
│           ├── null-ls.lua             # Formatter
│           ├── telescope.lua           # Fuzzy finder
│           ├── treesitter.lua          # Syntax highlighting
│           ├── undotree.lua            # Enhanced Ctrl z
│           └── vdiffview.lua           # Vertical Diff
└── README.md
```

## File Descriptions

### `init.lua` (Main Entry Point)

- Sets the leader key
- Loads all configuration modules
- Keep this file minimal - it just orchestrates loading other files

### `lua/config/` (Core Configuration)

- **`init.lua`**: dir main entry
- **`lazy_plugin_manager.lua`**: Sets up the lazy.nvim plugin manager
- **`settings.lua`**: Basic Neovim options (indentation, line numbers, etc.)
- **`remap.lua`**: Custom keyboard shortcuts and mappings

### `lua/config/plugins/` (Plugins Configurations)

Each file configures a specific plugin or related group of plugins:

- **`alpha.lua`**: Welcome screen
- **`autopairs.lua`**: Automatic bracket/quote closing
- **`colors.lua`**: Color scheme and theming
- **`completion.lua`**: Configures autocompletion
- **`fugitive.lua`**: Git wrapper
- **`harpoon.lua`**: File Navigator
- **`lsp.lua`**: Language servers for code intelligence
- **`null-ls.lua`**: Formatter
- **`telescope.lua`**: File finder and search functionality
- **`treesitter.lua`**: Advanced syntax highlighting
- **`undotree.lua`**: Undo menu
- **`vdiffview.lua`**: Git vertical Diff

## How It Works

1. **lazy.nvim Discovery**: The lazy.nvim plugin manager automatically discovers all `.lua` files in the `lua/config/plugins/` directory
2. **Module Loading**: Each plugin file returns a table that lazy.nvim uses to configure that plugin
3. **Lazy Loading**: Many plugins are configured to load only when needed (on certain events or key presses)

# Dependencies

Before installing the Neovim configuration, make sure to install the following dependencies:

## Language Servers and Development Tools

```bash
# TypeScript and web development language servers
npm install -g typescript typescript-language-server
npm install -g vscode-langservers-extracted

# Tree-sitter CLI for syntax highlighting
npm install -g tree-sitter-cli

# Prettier for code formatting
npm install -g prettier
```

for format .lua files
npm install -g @johnnymorganz/stylua-bin

## System Tools

```bash
# Ripgrep for fast text searching (used by Telescope)
sudo apt-get install ripgrep

# fd-find for fast file finding (used by Telescope)
sudo apt install fd-find

# Create symlink for fd command
sudo ln -s $(which fdfind) /usr/local/bin/fd

# Lua package manager for Lua dependencies
sudo apt install luarocks

# Lua regex library
sudo luarocks install jsregexp
```

## Fonts (Nerd Fonts for Icons)

```bash
# Update package list
sudo apt update

# Install some popular Nerd Fonts
sudo apt install fonts-firacode fonts-cascadia-code

# Or install the full nerd fonts package
sudo apt install fonts-nerd-font-*

# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download and install Nerd Font versions manually
cd /tmp

# Get Fira Code Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip FiraCode.zip -d FiraCode
cp FiraCode/*.ttf ~/.local/share/fonts/

# Clean up
rm -rf CascadiaCode* FiraCode*

# Refresh font cache
fc-cache -fv
```

# Install

Here's how to clone your new repository directly into your `~/.config/nvim directory:`

## Clone directly into the target directory

Remove existing nvim config (make sure to backup first!)

```bash
rm -rf ~/.config/nvim
```

Clone directly into the nvim directory

```bash
git clone git@github.com:syahbes/my-nvim-config.git
```

# Test the configuration:

open nvim

Install plugins: When you first open Neovim, lazy.nvim will automatically install all the plugins. You might see some installation messages.
Check everything works: Try some key mappings like:

```
<space>ff - Find files (Telescope)
<space>fg - Live grep (search in files)
gd - Go to definition (when editing code)
```

# Add new plugins

To add new plugins, add them to the `lua/config/plugins/` directory and lazy.nvim will automatically discover them and install them.

```lua
return {
    "plugin-name",
    -- plugin options (tag, branch, dependencies, etc.)
    config = function()
        -- configuration code
    end,  -- comma after end is correct
}  -- final closing brace, no comma
```
