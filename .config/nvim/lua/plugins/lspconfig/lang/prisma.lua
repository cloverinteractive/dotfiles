local M = {}

function M.setup(lspconfig, options)
    lspconfig.prismals.setup(options or {})
end

return M
