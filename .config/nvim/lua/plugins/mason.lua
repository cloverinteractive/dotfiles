local mason_ok, mason = pcall(require, "mason")
local mlsp_ok, mlsp = pcall(require, "mason-lspconfig")

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

if not mlsp_ok then
    return
end

mlsp.setup()
