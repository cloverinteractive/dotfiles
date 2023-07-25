local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
    return
end

local _, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities(capabilities)
    or capabilities

require("plugins.lspconfig.lang.docker").setup(
    lspconfig,
    { capabilities = capabilities }
)

require("plugins.lspconfig.lang.eslint").setup(lspconfig, {
    capabilities = capabilities,
})

require("plugins.lspconfig.lang.haskell").setup(
    lspconfig,
    { capabilities = capabilities }
)

require("plugins.lspconfig.lang.lua").setup(
    lspconfig,
    { capabilities = capabilities }
)

require("plugins.lspconfig.lang.prisma").setup(
    lspconfig,
    { capabilities = capabilities }
)

require("plugins.lspconfig.lang.python").setup(
    lspconfig,
    { capabilities = capabilities }
)

require("plugins.lspconfig.lang.rust").setup(
    lspconfig,
    { capabilities = capabilities }
)

require("plugins.lspconfig.lang.typescript").setup(
    lspconfig,
    { capabilities = capabilities }
)
