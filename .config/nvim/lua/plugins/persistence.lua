return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
    keys = {
        {
            "<leader>qs",
            [[<cmd>lua require("persistence").load()<cr>]],
            desc = "Restore session for current direcrtory",
        },
        {
            "<leader>ql",
            [[<cmd>lua require("persistence").load({ last = true })<cr>]],
            desc = "Restore the last session",
        },
        {
            "<leader>qd",
            [[<cmd>lua require("persistence").stop()<cr>]],
            "stop Persistence => session won't be saved on exit",
        },
    },
}
