local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

local M = {}

function M.setup(lspconfig, options)
    lspconfig.hls.setup(helpers.merge({
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { "haskell", "lhaskell" },
        -- Server specific settings...
        settings = {
            ["haskell"] = {
                formattingProvider = "hfmt",
            },
        },
    }, options))
end

return M
