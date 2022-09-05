local present, packer = pcall(require, "packer")

if not present then
	return
end

return packer.startup(function()
	use("wbthomason/packer.nvim") -- package manager

	use("norcalli/nvim-colorizer.lua") -- css colors

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Themes
	use("EdenEast/nightfox.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- LSP
	use("neovim/nvim-lspconfig") -- Collection of configuration for LSP
	use("williamboman/mason.nvim") -- Lagunage Server Auto installation
	use("hrsh7th/nvim-cmp") -- Auto completion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin

	-- Syntax highlights
	use("nvim-treesitter/nvim-treesitter") -- Treesitter

	-- Collection of lua functions
	use("nvim-lua/plenary.nvim")

	-- Fuzzy search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Autoformatter/linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns_present, gitsigns = pcall(require, "gitsigns")

			if gitsigns_present then
				gitsigns.setup()
			end
		end,
	})
end)
