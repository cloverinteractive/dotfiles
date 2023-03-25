local api = vim.api

for _, source in pairs({
  -- core
  "core.settings", -- basic vim settings
  "core.mappings", -- global key mappings

  -- plugins
  "plugins.packer", -- This needs to be the first plugin
  "plugins.nightfox", -- nvim theme
  "plugins.lualine", -- statusline
  "plugins.nvim-tree", -- file explorer
  "plugins.treesitter", -- treesitter
  "plugins.telescope", -- fuzzy finder
  "plugins.lsp.mason", -- automatic language server installer
  "plugins.lsp.nvim-cmp", -- nvim completion
  "plugins.lsp.lsp-config", -- laguage server protocol config
  "plugins.lsp.null-ls", -- formatter and diagnostics
  "plugins.lsp.copilot", -- github copilot
  "plugins.gitsigns", -- git commands
}) do
  local present, fault = pcall(require, source)
  if not present then
    api.nvim_err_writeln("Failed to load" .. source .. "\n\n" .. fault)
  end
end
