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
                ---@module "conform"
                require("conform").format({
                    async = true,
                }, function(err)
                    if not err then
                        local mode = vim.api.nvim_get_mode().mode
                        if vim.startswith(string.lower(mode), "v") then
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes(
                                    "<Esc>",
                                    true,
                                    false,
                                    true
                                ),
                                "n",
                                true
                            )
                        end
                    end
                end)
            end,
            mode = { "", "n", "v" },
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
            purescript = { "purs-tidy", lsp_format = "fallback" },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
