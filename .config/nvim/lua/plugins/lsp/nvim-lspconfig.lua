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

        vim.lsp.config("*", { capabilities = capabilities })

        -- Servers with custom config
        local custom_servers = {
            hls = "haskell",
            lua_ls = "lua",
            nil_ls = "nix",
            ts_ls = "typescript",
        }

        -- Setup servers with custom config
        for server, config_name in pairs(custom_servers) do
            local ok, custom_config =
                pcall(require, "plugins.lsp.lang." .. config_name)

            if ok then
                vim.lsp.config(server, custom_config)
            end
        end

        vim.lsp.enable({
            "bashls",
            "dockerls",
            "hls",
            "lua_ls",
            "nil_ls",
            "prismals",
            "purescriptls",
            "pyright",
            "tailwindcss",
            "ts_ls",
        })
    end,
}
