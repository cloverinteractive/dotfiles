return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
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
          "stop Persistence => session won't be saved on exit"
        },
    },
    opts = {},
}
