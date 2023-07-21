local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local mlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mlsp_ok then
    return
end

mason_lspconfig.setup()
