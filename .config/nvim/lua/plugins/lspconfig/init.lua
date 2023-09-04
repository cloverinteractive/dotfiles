return {
    "neovim/nvim-lspconfig", -- Collection of configuration for LSP
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "lvimuser/lsp-inlayhints.nvim",
            opts = {},
        },
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

        local on_attach = require("lsp-inlayhints").on_attach

        lspconfig.bashls.setup({ capabilities = capabilities })

        lspconfig.dockerls.setup({ capabilities = capabilities })

        lspconfig.eslint.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.eslint"),
                { capabilities = capabilities, on_attach = on_attach }
            )
        )

        lspconfig.hls.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.haskell"),
                { capabilities = capabilities, on_attach = on_attach }
            )
        )

        lspconfig.lua_ls.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.lua"),
                { capabilities = capabilities, on_attach = on_attach }
            )
        )

        lspconfig.prismals.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.rust_analyzer.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.rust"),
                { capabilities = capabilities, on_attach = on_attach }
            )
        )

        lspconfig.tsserver.setup(
            helpers.merge(
                require("plugins.lspconfig.lang.typescript"),
                { capabilities = capabilities, on_attach = on_attach }
            )
        )
    end,
}
