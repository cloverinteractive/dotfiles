return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local null_ls = require("null-ls")

        return {
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prismaFmt,
                null_ls.builtins.diagnostics.flake8,
            },
        }
    end,
}
