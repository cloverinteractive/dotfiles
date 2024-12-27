return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    lazy = true,
    config = function(_, opts)
        return require("lspsaga").setup(opts)
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<space>ft",
            "<cmd>Lspsaga term_toggle<cr>",
            desc = "Floating Terminal",
        },
        {
            "[e",
            "<cmd>Lspsaga diagnostic_jump_next<cr>",
            desc = "Lspsaga Next Diagnostic",
        },
        {
            "]e",
            "<cmd>Lspsaga diagnostic_jump_prev<cr>",
            desc = "Lspsaga Prev Diagnostic",
        },
        { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga Hover Doc" },
        { "<space>lf", "<cmd>Lspsaga finder<cr>", desc = "Lspsaga Lsp Finder" },
        { "<space>lr", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga Rename" },
        { "<space>lo", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga Outline" },
    },
    opts = {
        -- Disabled because it messed with insert mode make `a` and `i` not insert one character off
        lightbulb = {
            enable = false,
            enable_in_insert = false,
            sign = false,
            virtual_text = false,
        },
    },
}
