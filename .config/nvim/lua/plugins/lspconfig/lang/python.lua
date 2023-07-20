local M = {}

function M.setup(lspconfig, options)
    lspconfig.pyright.setup(options or {})
end

return M
