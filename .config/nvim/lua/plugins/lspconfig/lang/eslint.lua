local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

local M = {}

function M.setup(lspconfig, options)
    lspconfig.eslint.setup(helpers.merge({
        on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
            })
        end,
    }, options))
end

return M
