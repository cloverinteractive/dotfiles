return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        "mfussenegger/nvim-dap",
        {
            "mfussenegger/nvim-dap-python",
            build = {
                type = "builtin",
                copy_directories = {
                    "doc",
                },
            },
        }, -- optional
        "ibhagwan/fzf-lua", -- optional
    },
    ft = "python", -- Load when opening Python files
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
        search = {}, -- if you add your own searches, they go here.
        options = {
            -- debug = true,
            -- notify_user_on_venv_activation = true,
        }, -- if you add plugin options, they go here.
    },
}
