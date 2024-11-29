return {
    "stevearc/conform.nvim",
    dependencies = {
        "mason.nvim",
    },
    lazy = true,
    cmd = { "ConformInfo" },
    event = { "BufWritePre" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    formatters = { "injected" },
                    timeout_ms = 3000,
                })
            end,
            mode = { "n", "v" },
            desc = "Format Injected Langs",
        },
    },

    ---@module "conform"
    opts = {
        default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
        },
        format_on_save = {
            timeout_ms = 3000,
            lsp_fallback = "fallback",
        },
        formatters = {
            injected = { options = { ignore_errors = true } },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = {
                "prettierd",
                "prettier",
                stop_after_first = true,
            },
            typescriptreact = {
                "prettierd",
                "prettier",
                stop_after_first = true,
            },
            rust = { "rustfmt", lsp_format = "fallback" },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
