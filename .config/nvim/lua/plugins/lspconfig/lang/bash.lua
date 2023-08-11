local M = {}

function M.setup(lspconfig, options)
    lspconfig.bashls.setup(options or {})
end

return M
