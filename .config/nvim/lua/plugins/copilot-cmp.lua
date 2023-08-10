return {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    opts = {},
    config = function()
        require("copilot_cmp").setup()
    end,
}
