return {
    "mfussenegger/nvim-lint",
    events = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            python = { "flake8" },
            ["*"] = { "typos" },
        }

        local lint_augroup =
            vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd(
            { "BufEnter", "BufWritePost", "InsertLeave" },
            {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            }
        )
    end,
}
