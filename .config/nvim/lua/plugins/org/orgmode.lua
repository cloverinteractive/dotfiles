return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
        require("orgmode").setup({
            org_agenda_files = "~/orgfiles/**/*",
            mappings = {
                org_return_uses_meta_return = true,
            },
        })
    end,
}
