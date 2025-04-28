return {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.1",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter",
        },
        {
            "nvim-orgmode/orgmode",
        },
    },
    config = function()
        require("org-roam").setup({
            directory = "~/orgfiles/org_roam_files",
        })
    end,
}
