local ok, nvim_tree = pcall(require, "nvim-tree")

if not ok then
    return
end

nvim_tree.setup({
    diagnostics = {
        enable = true,
    },
})

require("plugins.nvim-tree.mappings")
