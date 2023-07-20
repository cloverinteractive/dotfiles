local M = {}

function M.setup(lspconfig, options)
    lspconfig.dockerls.setup(options or {})
end

return M
