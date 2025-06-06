# Nvim Info:

nvim has replace vim in this config files, the reason behind it is how much flexible writing configuration
files in lua vs vimscript and how much faster plugins are, you can still use vim, but keep in mind that upon
installing, in `bash/aliases` `vim` will be aliased to `nvim` if `nvim` is detected you can obviously unalias
it or leave it alone if you either prefer nvim or don't have it installed.

## Requirements

- Nvim 0.10 or latest

## Plugins

### Lazy

Plugin management system, this is how you get newer plugins installed.

### Colorizer

Colorizes rbga and hex codes in your code automatically

### Nightfox

Collection of vim themes, both light and dark, nordfox is the default but you can change this to any of
the many flavors of [nightfox](https://github.com/EdenEast/nightfox.nvim#nightfox-1)

### Nvim-lspconfig

LSP configuration plugin, if you want to know how to setup your language server quickly you can check
`:help lspconfig-all` or visit the projects [repo](https://github.com/neovim/nvim-lspconfig)

### Mason

Language server installation plugin, it will sort out fetching and installing the server of your choice
just run `:Mason` for a list of supported servers both installed and available and `:MasonInstall server`
to install it.

### Nvim-cmp and cmp-nvim-lsp

LSP auto-completion Plugin

### LuaSnip

Snippets for lua, these make configuring nvim a breeze

### Treesitter

Treesitter support for nvim, better syntax highlight based on the code and not regular expressions, and
automatic expression fold.

### Plenary

A collection of lua functions for string matching that no-one wants to write each time

### Telescope

Nvim fuzzy search, match file names, live grep, history and more
