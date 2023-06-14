# Nvim Info:

nvim has replace vim in this config files, the reason behind it is how much flexible writing configuration
files in lua vs vimscript and how much faster plugins are, you can still use vim, but keep in mind that upon
installing, in `bash/aliases` `vim` will be aliased to `nvim` if `nvim` is detected you can obviously unalias
it or leave it alone if you either prefer nvim or don't have it installed.

## Requirements

* Nvim 0.7.2 or latest

## Plugins

### Packer

Plugin management system, this is how you get newer plugins installed.

### Colorizer

Colorizes rbga and hex codes in your code automatically

### Nvim-tree

Lua backed file explorer if you need one, toggling is automatically mapped to `<Leader> + ee`

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

### Cmp_luasnip

Snippet support for `nvim-cmp`

### LuaSnip

Snippets for lua, these make configuring nvim a breeze

### Treesitter

Treesitter support for nvim, better syntax highlight based on the code and not regular expressions, and
automatic expression fold.

### Plenary

A collection of lua functions for string matching that no-one wants to write each time

## Telescope

Nvim fuzzy search, match file names, live grep, history and more

## Github Copilot

You can disable copilot if you do not wish to use it by removing it from `init.lua`
if you wish to use copilot make sure you have a subscription to it and run `Copilot setup`
and follow the stepsm copilot should be enabled by default.

If you wish to change copilot's config just edit `.config/nvim/lua/plugins/lsp/copilot.lua`
you can execute `Copilot help` for more information on the different options.
