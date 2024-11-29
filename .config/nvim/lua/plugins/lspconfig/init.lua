return {
    "neovim/nvim-lspconfig", -- Collection of configuration for LSP
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mason.nvim",
        { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local helpers = require("core.helpers")
        local lspconfig = require("lspconfig")

        -- Add additional capabilities supported by nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp
                and cmp_nvim_lsp.default_capabilities(capabilities)
            or capabilities

        lspconfig.bashls.setup({
            capabilities = capabilities,
        })

        lspconfig.dockerls.setup({
            capabilities = capabilities,
        })

        lspconfig.eslint.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.eslint"),
                { capabilities = capabilities }
            )
        )

        lspconfig.hls.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.haskell"),
                { capabilities = capabilities }
            )
        )

        lspconfig.lua_ls.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.lua"),
                { capabilities = capabilities }
            )
        )

        lspconfig.nil_ls.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.nix"),
                { capabilities = capabilities }
            )
        )

        lspconfig.prismals.setup({
            capabilities = capabilities,
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
        })

        lspconfig.ts_ls.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.typescript"),
                { capabilities = capabilities }
            )
        )
    end,
}
