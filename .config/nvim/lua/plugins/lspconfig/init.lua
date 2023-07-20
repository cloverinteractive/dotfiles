local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
    return
end

require("plugins.lspconfig.lang.docker").setup(lspconfig)
require("plugins.lspconfig.lang.eslint").setup(lspconfig)
require("plugins.lspconfig.lang.haskell").setup(lspconfig)
require("plugins.lspconfig.lang.lua").setup(lspconfig)
require("plugins.lspconfig.lang.prisma").setup(lspconfig)
require("plugins.lspconfig.lang.python").setup(lspconfig)
require("plugins.lspconfig.lang.rust").setup(lspconfig)
require("plugins.lspconfig.lang.typescript").setup(lspconfig)
