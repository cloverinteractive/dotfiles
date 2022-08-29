return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- package manager

  use 'norcalli/nvim-colorizer.lua' -- css colors

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly'
  }

  -- Themes
  use 'EdenEast/nightfox.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configuration for LSP
  use 'williamboman/mason.nvim' -- Lagunage Server Auto installation
  use 'hrsh7th/nvim-cmp' -- Auto completion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

  -- Syntax highlights
  use 'nvim-treesitter/nvim-treesitter' -- Treesitter

  -- Fuzzy search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- Autoformatter/linter
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end
  }
end)
