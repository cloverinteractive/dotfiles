return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    tag = "0.1.2",
    keys = {
        {
            "<leader>ff",
            ":Telescope find_files<cr>",
            desc = "Telescope [f]ind [f]iles",
        },
        {
            "<leader>fg",
            ":Telescope live_grep<cr>",
            desc = "Telescope [f]ind [g]rep",
        },
        {
            "<leader>fb",
            ":Telescope buffers<cr>",
            desc = "Telescope [f]ind [b]uffers",
        },
        {
            "<leader>fh",
            ":Telescope help_tags<cr>",
            desc = "Telescope [f]ind [h]elp tags",
        },
        {
            "<leader>fk",
            ":Telescope keymaps<cr>",
            desc = "Telescope [f]ind [k]eymaps",
        },
    },
    opts = {},
}
