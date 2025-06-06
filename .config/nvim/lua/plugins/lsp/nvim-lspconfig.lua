return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvimdev/lspsaga.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Simple servers with default config
        local simple_servers = {
            "bashls",
            "dockerls",
            "prismals",
            "purescriptls",
            "pyright",
            "tailwindcss",
        }

        -- Servers with custom config
        local custom_servers = {
            hls = "haskell",
            lua_ls = "lua",
            nil_ls = "nix",
            ts_ls = "typescript",
        }

        local lspconfig = require("lspconfig")
        local helpers = require("core.helpers")

        -- Setup servers with default config
        for _, server in ipairs(simple_servers) do
            lspconfig[server].setup({ capabilities = capabilities })
        end

        -- Setup servers with custom config
        for server, config_name in pairs(custom_servers) do
            local ok, custom_config =
                pcall(require, "plugins.lsp.lang." .. config_name)

            if ok then
                lspconfig[server].setup(
                    helpers.merge(
                        custom_config,
                        { capabilities = capabilities }
                    )
                )
            end
        end
    end,
}
