local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

local M = {}

function M.setup(lspconfig, options)
    lspconfig.rust_analyzer.setup(helpers.merge({
        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    enable = false,
                },
            },
        },
    }, options))
end

return M
