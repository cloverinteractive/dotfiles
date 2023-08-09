local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    "norcalli/nvim-colorizer.lua", -- css colors

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Themes
    "EdenEast/nightfox.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    },

    -- autocomplete
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
    "hrsh7th/nvim-cmp", -- Auto completion plugin

    -- managing & installing lsp servers, linters & formatters
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- LSP
    "neovim/nvim-lspconfig", -- Collection of configuration for LSP

    -- LSP Saga
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("plugins.lspsaga")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Enhanced LSP UIs
    "onsails/lspkind.nvim", -- LSP UIs icons
    "lvimuser/lsp-inlayhints.nvim", -- LSP inlay hints

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = { enabled = false },
                suggestion = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },

    -- Snippets
    "L3MON4D3/LuaSnip", -- Snippets plugin
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp

    -- Syntax highlights
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },

    -- Collection of lua functions
    "nvim-lua/plenary.nvim",

    -- Fuzzy search
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.0",
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },

    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- Autoformatter/linter
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns_present, gitsigns = pcall(require, "gitsigns")

            if gitsigns_present then
                gitsigns.setup()
            end
        end,
    },

    -- Python virtualenv support
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-telescope/telescope.nvim" },
        },
    },
}

require("lazy").setup(plugins, { config = { checker = { enabled = true } } })
