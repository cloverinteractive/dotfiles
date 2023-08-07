local api = vim.api

for _, source in pairs({
    -- core
    "core.settings", -- basic vim settings
    "core.mappings", -- global key mappings
    "core.lsp", -- nvim lsp configs

    -- plugins
    "plugins.packer", -- This needs to be the first plugin
    "plugins.colorizer", -- Colorize hexs
    "plugins.nightfox", -- nvim theme
    "plugins.lualine", -- statusline
    "plugins.nvim-tree", -- file explorer
    "plugins.treesitter", -- treesitter
    "plugins.telescope", -- fuzzy finder
    "plugins.lspconfig", -- language server protocol config
    "plugins.mason", -- automatic language server installer
    "plugins.cmp", -- nvim completion
    "plugins.null-ls", -- formatter and diagnostics
    "plugins.lsp-inlayhints", -- inlay hints
    "plugins.gitsigns", -- git commands
    "plugins.venv-selector", -- virtualenv selector
}) do
    local present, fault = pcall(require, source)
    if not present then
        api.nvim_err_writeln("Failed to load" .. source .. "\n\n" .. fault)
    end
end
