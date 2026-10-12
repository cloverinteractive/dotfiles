return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvimdev/lspsaga.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

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
            "vacuum",
        })
    end,
}
