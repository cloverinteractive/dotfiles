local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

local M = {}

function M.setup(lspconfig, options)
    lspconfig.lua_ls.setup(helpers.merge({
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "use", "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Enable ls hints
                hint = {
                    enable = true,
                    setType = true,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }, options))
end

return M