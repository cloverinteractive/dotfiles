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
  use 'hrsh7th/nvim-cmp' -- Auto completion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'nvim-treesitter/nvim-treesitter' -- Treesitter

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
