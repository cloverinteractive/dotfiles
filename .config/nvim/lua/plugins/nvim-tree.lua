return {
    "nvim-tree/nvim-tree.lua",
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>ee", ":NvimTreeToggle<CR>", desc = "Toggle NvimTr[e][e]" },
    },
    opts = { diagnostics = { enable = true } },
}
